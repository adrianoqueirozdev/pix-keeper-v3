import 'dart:async';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/participants_pix_model.dart';
import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/core/data/models/pix_key_type.dart';
import 'package:pix_keeper/core/data/models/pix_key_type_option_model.dart';
import 'package:pix_keeper/core/presentation/blocs/participants_pix/participants_pix_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/participants_pix/participants_pix_events.dart';
import 'package:pix_keeper/core/presentation/blocs/participants_pix/participants_pix_state.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_events.dart';
import 'package:pix_keeper/core/utils/user_manager.dart';
import 'package:pix_keeper/presentation/pix_key_form/widgets/select_institution.dart';
import 'package:pix_keeper/presentation/pix_key_form/widgets/select_pix_key_type.dart';
import 'package:pix_keeper/shared/constants/app_constants.dart';
import 'package:pix_keeper/shared/utils/pix_key_types.dart';
import 'package:uuid/uuid.dart';

const int _kDebounceTime = 1000;

class PixKeyFormPageController extends GetxController {
  final ParticipantsPixBloc participantsPixBloc;
  final PixKeyBloc pixKeyBloc;
  PixKeyModel? pixKeyEdit;
  final String? pixKeyCopied;
  final PixKeyTypeOptionModel? newPixKeyType;

  PixKeyFormPageController({
    required this.participantsPixBloc,
    required this.pixKeyBloc,
    this.pixKeyEdit,
    this.pixKeyCopied,
    this.newPixKeyType,
  }) : super() {
    _isEdit.value = pixKeyEdit != null && pixKeyCopied == null && newPixKeyType == null;
  }

  final List<PixKeyTypeOptionModel> pixKeyTypesOptions = pixKeyTypes;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String? userId = UserManager().userId;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController keyPixController = TextEditingController();
  final TextEditingController favoredNameController = TextEditingController();
  final TextEditingController filterController = TextEditingController();
  final _timer = Timer.periodic(const Duration(seconds: 1), (timer) {}).obs;

  final _isEnabledInputKeyPix = false.obs;
  final _inputFormatters = <TextInputFormatter>[].obs;

  final _selectedKeyPixType = PixKeyTypeOptionModel().obs;
  final _selectedParticipantPix = ParticipantPixModel().obs;
  final _isEdit = false.obs;

  List<TextInputFormatter> get inputFormatters => _inputFormatters;
  bool get isEnabledInputKeyPix => _isEnabledInputKeyPix.value;

  PixKeyTypeOptionModel get selectedKeyPixType => _selectedKeyPixType.value;
  ParticipantPixModel get selectedParticipantPix => _selectedParticipantPix.value;
  bool get isEdit => _isEdit.value;

  @override
  void onInit() {
    super.onInit();

    _loadParticipantsPix();
    _initializeEditMode();
    _onAddCopiedPixKey();
  }

  @override
  void onClose() {
    super.onClose();

    pixKeyBloc.close();
    participantsPixBloc.close();
    filterController.dispose();
    keyPixController.dispose();
    nameController.dispose();
    favoredNameController.dispose();
  }

  void _loadParticipantsPix() {
    participantsPixBloc.add(LoadParticipantsPixEvent());
  }

  void _initializeEditMode() {
    if (pixKeyEdit == null) return;

    keyPixController.text = pixKeyEdit!.key!;
    nameController.text = pixKeyEdit!.name!;
    favoredNameController.text = pixKeyEdit!.favoredName ?? '';

    final pixKeyTypeOption = _getSelectedKeyPixType(pixKeyEdit!.pixKeyType!);
    _selectedKeyPixType.value = pixKeyTypeOption;
    _setDynamicValues(pixKeyTypeOption.pixKeyType!);

    participantsPixBloc.stream.listen((event) {
      if (event is ParticipantsPixLoadedState) {
        final selectedParticipantPix = participantsPixBloc.state.participantsPix
            .firstWhereOrNull((participantPix) => participantPix.ispb == pixKeyEdit?.institutionIspb);

        if (selectedParticipantPix != null) {
          _selectedParticipantPix.value = selectedParticipantPix;
        }
      }
    });
  }

  void _onAddCopiedPixKey() {
    if (pixKeyCopied == null && newPixKeyType == null) return;

    keyPixController.text = pixKeyCopied!;
    _setDynamicValues(newPixKeyType!.pixKeyType!);
    _selectedKeyPixType.value = _getSelectedKeyPixType(newPixKeyType!.pixKeyType!);
  }

  PixKeyTypeOptionModel _getSelectedKeyPixType(PixKeyType pixKeyType) {
    return pixKeyTypesOptions.firstWhere((pixKeyTypeOption) => pixKeyTypeOption.pixKeyType == pixKeyType);
  }

  void _clearFilter() {
    filterController.clear();
  }

  void _unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void bottomSheetSelectedPixKeyType(BuildContext context) async {
    _unfocus();

    await Future.delayed(const Duration(milliseconds: 200));

    Get.bottomSheet(
      isScrollControlled: true,
      enterBottomSheetDuration: kBottomSheetDurationAnimation,
      SelectPixKeyType(pixKeyFormPageController: this),
    );
  }

  void _setDynamicValues(PixKeyType pixKeyType) {
    final formatNoSpaces = FilteringTextInputFormatter.deny(RegExp(r"\s"));
    final digitsOnly = FilteringTextInputFormatter.digitsOnly;

    switch (pixKeyType) {
      case PixKeyType.email:
        _isEnabledInputKeyPix(true);
        _inputFormatters([formatNoSpaces]);
        break;
      case PixKeyType.phone:
        _isEnabledInputKeyPix(true);
        _inputFormatters([digitsOnly, TelefoneInputFormatter()]);
        break;
      case PixKeyType.cpf:
        _isEnabledInputKeyPix(true);
        _inputFormatters([digitsOnly, CpfInputFormatter()]);
        break;
      case PixKeyType.cnpj:
        _isEnabledInputKeyPix(true);
        _inputFormatters([digitsOnly, CnpjInputFormatter()]);
        break;
      case PixKeyType.random:
        _isEnabledInputKeyPix(true);
        _inputFormatters([formatNoSpaces]);
        break;
      default:
        _inputFormatters([]);
        break;
    }
  }

  void _debounce(VoidCallback callback, int delay) {
    if (_timer.value.isActive) {
      _timer.value.cancel();
    }

    _timer.value = Timer(Duration(milliseconds: delay), () => callback());
    update();
  }

  void onChangeFilterParticipantsPix(String? value) async {
    _debounce(() {
      if (value == null || value.isEmpty) {
        _loadParticipantsPix();
      } else {
        participantsPixBloc.add(FilterParticipantsPixEvent(filterController.text));
        update();
      }
    }, _kDebounceTime);

    _loadParticipantsPix();
  }

  void onClearFilter() {
    _clearFilter();
    _loadParticipantsPix();
  }

  void setSelectKeyPixType(PixKeyTypeOptionModel? value) {
    if (value != null) {
      _selectedKeyPixType(value);
      _setDynamicValues(value.pixKeyType!);
      update();
    }
  }

  void setSelectedParticipantPix(ParticipantPixModel? value) {
    _selectedParticipantPix(value!);
    update();
  }

  void bottomSheetSelectedParticipantPix(BuildContext context) async {
    if (participantsPixBloc.state.participantsPix.isEmpty) return;

    _unfocus();
    await Future.delayed(const Duration(milliseconds: 200));

    Get.bottomSheet(
      isScrollControlled: true,
      enterBottomSheetDuration: kBottomSheetDurationAnimation,
      SelectedInstitution(pixKeyFormPageController: this),
    );
  }

  PixKeyModel _createPixKeyModel() {
    String generatePixKeyId() {
      return isEdit ? pixKeyEdit?.id ?? '' : const Uuid().v4();
    }

    String? getFavoredName() {
      return favoredNameController.text.isEmpty ? null : favoredNameController.text;
    }

    String getCreationDate() {
      return isEdit ? pixKeyEdit?.createdAt ?? DateTime.now().toIso8601String() : DateTime.now().toIso8601String();
    }

    String? getUpdateDate() {
      return isEdit ? null : DateTime.now().toIso8601String();
    }

    return PixKeyModel(
      id: generatePixKeyId(),
      key: keyPixController.text,
      pixKeyType: selectedKeyPixType.pixKeyType,
      pixKeyTypeLabel: selectedKeyPixType.label,
      name: nameController.text,
      favoredName: getFavoredName(),
      institutionShortName: selectedParticipantPix.shortName,
      institutionIspb: selectedParticipantPix.ispb,
      isFavorite: false,
      userId: userId,
      createdAt: getCreationDate(),
      updatedAt: getUpdateDate(),
    );
  }

  void _dispatchPixKeyEvent(PixKeyModel pixKey) {
    if (isEdit) {
      pixKeyBloc.add(UpdatePixKeyEvent(pixKeyModel: pixKey));
    } else {
      pixKeyBloc.add(CreatePixKeyEvent(pixKeyModel: pixKey));
    }
  }

  void savePixKey() async {
    if (formKey.currentState!.validate()) {
      final pixKey = _createPixKeyModel();
      _dispatchPixKeyEvent(pixKey);
    }
  }
}
