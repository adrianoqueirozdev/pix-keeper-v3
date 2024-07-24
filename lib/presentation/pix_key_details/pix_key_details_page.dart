import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/data/models/pix_key_model.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_state.dart';
import 'package:pix_keeper/presentation/pix_key_details/pix_key_details_controller.dart';
import 'package:pix_keeper/presentation/pix_key_details/widgets/pix_key_qr_code.dart';
import 'package:pix_keeper/presentation/pix_key_details/widgets/title_detail.dart';
import 'package:pix_keeper/shared/constants/app_constants.dart';
import 'package:pix_keeper/shared/controllers/copy_controller.dart';
import 'package:pix_keeper/shared/widgets/banks_list.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';

class PixKeyDetailsPage extends StatelessWidget {
  const PixKeyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CopyController copyController = Get.find<CopyController>();
    final pixKeyDetails = Get.arguments as PixKeyModel;

    return GetBuilder<PixKeyDetailsController>(
      init: PixKeyDetailsController(
        pixKeyBloc: Get.find<PixKeyBloc>(),
        pixKeyDetails: pixKeyDetails,
      ),
      builder: (controller) {
        final pixKey = controller.pixKeyDetails;
        final name = pixKey.name;
        final key = pixKey.key!;
        final pixKeyTypeLabel = pixKey.pixKeyTypeLabel;
        final institution = pixKey.institutionShortName;
        final favoredName = pixKey.favoredName;
        return BaseWidgetBuilder(
          builder: (context, _, colorScheme, __, ___) {
            return Scaffold(
              appBar: AppBar(),
              body: BlocListener<PixKeyBloc, PixKeyState>(
                bloc: controller.pixKeyBloc,
                listener: (context, state) {
                  if (state is DeletePixKeySuccessState) {
                    Get.back();
                    Get.back();
                  }
                },
                child: GetBuilder<CopyController>(
                  init: copyController,
                  builder: (copyController) {
                    return SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            PixKeyQrCode(text: key),
                            const SizedBox(height: 16),
                            TitleDetail(title: "Nome", value: '$name'),
                            TitleDetail(title: "Tipo", value: '$pixKeyTypeLabel'),
                            TitleDetail(title: "Chave pix", value: key),
                            if (favoredName != null && favoredName.isNotEmpty)
                              TitleDetail(title: "Nome do favorecido", value: favoredName),
                            if (institution != null && institution.isNotEmpty)
                              TitleDetail(title: "Instituição", value: institution),
                            const _CustomDivider(),
                            BanksList(pixKey: pixKey),
                            const _CustomDivider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: controller.onEdit,
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () => copyController.onCopy(pixKey),
                                  icon: Icon(copyController.icon(pixKey)),
                                ),
                                IconButton(
                                  onPressed: controller.onShare,
                                  icon: const Icon(Icons.share),
                                ),
                                IconButton(
                                  onPressed: controller.onDeletePixKey,
                                  icon: Icon(
                                    Icons.delete,
                                    color: colorScheme.error,
                                  ),
                                ),
                              ].animate().fadeIn(duration: kDurationAnimation),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 32),
      child: Divider(
        thickness: 0.5,
      ),
    );
  }
}
