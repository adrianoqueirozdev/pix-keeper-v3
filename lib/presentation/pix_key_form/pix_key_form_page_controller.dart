import 'dart:async';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/participants_pix.dart';
import 'package:pix_keeper/core/data/models/pix_key.dart';
import 'package:pix_keeper/presentation/pix_key_form/blocs/participants_pix/participants_pix_bloc.dart';
import 'package:pix_keeper/presentation/pix_key_form/blocs/participants_pix/participants_pix_events.dart';
import 'package:pix_keeper/presentation/pix_key_form/blocs/participants_pix/participants_pix_state.dart';
import 'package:pix_keeper/presentation/pix_key_form/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/presentation/pix_key_form/blocs/pix_key/pix_key_events.dart';
import 'package:pix_keeper/presentation/pix_key_form/blocs/pix_key/pix_key_state.dart';
import 'package:pix_keeper/presentation/pix_key_form/widgets/select_institution.dart';
import 'package:pix_keeper/presentation/pix_key_form/widgets/select_pix_key_type.dart';
import 'package:pix_keeper/shared/utils/get_key_pix_type_options.dart';
import 'package:uuid/uuid.dart';

const int _kDebounceTime = 1000;

class PixKeyFormPageController extends GetxController {
  final List<PixKeyTypeOption> keyPixTypeOptions = getKeyPixTypeOptions();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController keyPixController = TextEditingController();
  final TextEditingController favoredNameController = TextEditingController();
  final TextEditingController filterController = TextEditingController();
  final _timer = Timer.periodic(const Duration(seconds: 1), (timer) {}).obs;

  final _isEnabledInputKeyPix = false.obs;
  final _inputFormatters = <TextInputFormatter>[].obs;

  final _selectedKeyPixType = PixKeyTypeOption().obs;
  final _selectedParticipantPix = ParticipantPix().obs;
  final _pixKeyEdit = PixKeyModel().obs;
  final _isEdit = false.obs;

  late final ParticipantsPixBloc participantsPixBloc;
  late final PixKeyBloc pixKeyBloc;

  List<TextInputFormatter> get inputFormatters => _inputFormatters;
  bool get isEnabledInputKeyPix => _isEnabledInputKeyPix.value;

  PixKeyTypeOption get selectedKeyPixType => _selectedKeyPixType.value;
  ParticipantPix get selectedParticipantPix => _selectedParticipantPix.value;
  PixKeyModel get pixKeyEdit => _pixKeyEdit.value;
  bool get isEdit => _isEdit.value;

  void bottomSheetSelectedKeyPixType(BuildContext context) {
    keyPixController.clear();

    showModalBottomSheet(
      context: context,
      builder: (context) => const SelectPixKeyType(),
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
    if (_timer.value.isActive) _timer.value.cancel();
    _timer.value = Timer(Duration(milliseconds: delay), () => callback());
    update();
  }

  void onChangeFilterParticipantsPix(String? value) async {
    _debounce(() {
      if (value == null || value.isEmpty) {
        participantsPixBloc.add(LoadParticipantsPixEvent());
      } else {
        participantsPixBloc.add(FilterParticipantsPixEvent(filterController.text));
        update();
      }
    }, _kDebounceTime);

    participantsPixBloc.add(LoadParticipantsPixEvent());
  }

  void onClearFilter() {
    filterController.clear();
    participantsPixBloc.add(LoadParticipantsPixEvent());
  }

  void setSelectKeyPixType(PixKeyTypeOption? value) {
    _selectedKeyPixType(value);
    update();

    final pixKeyType = value!.pixKeyType;
    if (pixKeyType == null) return;

    _setDynamicValues(pixKeyType);
  }

  void confirmSelectKeyPixType() {
    Get.back();
  }

  void setSelectedParticipantPix(ParticipantPix? value) {
    _selectedParticipantPix(value!);
    update();
  }

  void confirmSelectParticipantPix() {
    Get.back();
  }

  void bottomSheetSelectedParticipantPix(BuildContext context) {
    if (participantsPixBloc.state.participantsPix.isEmpty) return;

    showModalBottomSheet(
      context: context,
      builder: (context) => const SelectedInstitution(),
      isScrollControlled: true,
    );
  }

  void savePixKey() async {
    if (formKey.currentState!.validate()) {
      final pixKey = PixKeyModel(
        id: isEdit ? pixKeyEdit.id : const Uuid().v4(),
        key: keyPixController.text,
        pixKeyType: selectedKeyPixType.pixKeyType,
        pixKeyTypeLabel: selectedKeyPixType.label,
        name: nameController.text,
        favoredName: favoredNameController.text,
        institutionShortName: selectedParticipantPix.shortName,
        institutionIspb: selectedParticipantPix.ispb,
        isFavorite: false,
        createdAt: isEdit ? DateTime.now().toIso8601String() : pixKeyEdit.createdAt,
        updatedAt: isEdit ? null : DateTime.now().toIso8601String(),
      );

      if (pixKeyEdit.id == null) {
        pixKeyBloc.add(CreatePixKeyEvent(pixKey));
      } else {
        pixKeyBloc.add(UpdatePixKeyEvent(pixKey));
      }
    }
  }

  @override
  void onInit() {
    participantsPixBloc = ParticipantsPixBloc();
    pixKeyBloc = PixKeyBloc();

    final arguments = Get.arguments as PixKeyModel?;
    if (arguments != null) {
      _pixKeyEdit.value = arguments;
      _isEdit.value = true;

      final pixKeyTypeOption = keyPixTypeOptions.firstWhere((element) => element.pixKeyType == arguments.pixKeyType);
      _selectedKeyPixType.value = pixKeyTypeOption;

      keyPixController.text = arguments.key!;
      nameController.text = arguments.name!;
      favoredNameController.text = arguments.favoredName ?? '';

      _setDynamicValues(pixKeyTypeOption.pixKeyType!);

      update();
    }

    participantsPixBloc.add(LoadParticipantsPixEvent());
    participantsPixBloc.stream.listen((event) {
      if (event is ParticipantsPixLoadedState) {
        if (arguments != null) {
          final selectedParticipantPix = participantsPixBloc.state.participantsPix
              .firstWhere((element) => element.ispb == arguments.institutionIspb);
          _selectedParticipantPix.value = selectedParticipantPix;

          update();
        }
      }
    });

    pixKeyBloc.stream.listen((event) {
      if (event is CreatePixKeySuccessState) {
        Get.back(result: true);
      } else if (event is UpdatePixKeySuccessState) {
        Get.back(result: event.pixKey);
      }
    });

    super.onInit();
  }
}
