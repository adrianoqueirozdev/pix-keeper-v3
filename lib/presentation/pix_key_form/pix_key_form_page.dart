import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_state.dart';
import 'package:pix_keeper/core/presentation/factories/participants_pix_bloc_factory.dart';
import 'package:pix_keeper/core/presentation/factories/pix_key_bloc_factory.dart';
import 'package:pix_keeper/core/utils/new_pix_key_params.dart';
import 'package:pix_keeper/presentation/pix_key_form/pix_key_form_page_controller.dart';
import 'package:pix_keeper/presentation/pix_key_form/widgets/custom_text_field.dart';
import 'package:pix_keeper/shared/utils/validation_pix_key_form.dart';

class PixKeyFormPage extends StatelessWidget {
  const PixKeyFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pixKeyFormParams = Get.arguments as PixKeyFormParams?;

    return GetBuilder<PixKeyFormPageController>(
      init: PixKeyFormPageController(
        pixKeyBloc: PixKeyBlocFactory.create(),
        participantsPixBloc: ParticipantsPixBlocFactory.create(),
        pixKeyCopied: pixKeyFormParams?.pixKeyCopied,
        newPixKeyType: pixKeyFormParams?.pixKeyTypeOption,
        pixKeyEdit: pixKeyFormParams?.pixKeyEdit,
      ),
      builder: (controller) {
        return BlocListener<PixKeyBloc, PixKeyState>(
          bloc: controller.pixKeyBloc,
          listener: (context, state) {
            if (state is CreatePixKeySuccessState) {
              Get.back(result: true);
            } else if (state is UpdatePixKeySuccessState) {
              Get.back(result: state.pixKey);
            }
          },
          child: BlocBuilder<PixKeyBloc, PixKeyState>(
            bloc: controller.pixKeyBloc,
            builder: (context, state) {
              final isLoading = state is CreatePixKeyLoadingState;

              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    controller.isEdit ? 'Editar chave' : 'Adicionar chave',
                  ),
                  actions: [
                    IconButton(
                      onPressed: isLoading ? null : controller.savePixKey,
                      icon: SizedBox(
                        width: 24,
                        height: 24,
                        child: isLoading ? const CircularProgressIndicator(strokeWidth: 2) : const Icon(Icons.check),
                      ),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            readOnly: isLoading,
                            textInputAction: TextInputAction.next,
                            autofocus: controller.isEdit,
                            validator: ValidationPixKeyForm.validateName,
                            label: "Nome da chave",
                            controller: controller.nameController,
                          ),
                          CustomTextField(
                            readOnly: true,
                            validator: (_) => ValidationPixKeyForm.validateKeyPixType(controller.selectedKeyPixType),
                            label: "Tipo de chave",
                            hintText: controller.selectedKeyPixType.label ?? "Selecione",
                            onTap: isLoading ? null : () => controller.bottomSheetSelectedKeyPixType(context),
                            suffixIcon: const Icon(
                              Icons.expand_more,
                              size: 28,
                            ),
                          ),
                          Visibility(
                            visible: controller.isEnabledInputKeyPix,
                            child: Column(
                              children: [
                                CustomTextField(
                                  readOnly: isLoading,
                                  textInputAction: TextInputAction.next,
                                  validator: (_) => ValidationPixKeyForm.validateKeyPix(
                                    controller.keyPixController.text,
                                    controller.selectedKeyPixType.pixKeyType!,
                                  ),
                                  inputFormatters: controller.inputFormatters,
                                  label: "Chave Pix",
                                  controller: controller.keyPixController,
                                ),
                              ],
                            ),
                          ),
                          CustomTextField(
                            readOnly: isLoading,
                            textInputAction: TextInputAction.next,
                            label: "Favorecido",
                            controller: controller.favoredNameController,
                          ),
                          CustomTextField(
                            readOnly: true,
                            label: "Instituição",
                            hintText: controller.selectedParticipantPix.shortName ?? "Selecione",
                            onTap: isLoading ? null : () => controller.bottomSheetSelectedParticipantPix(context),
                            suffixIcon: const Icon(
                              Icons.expand_more,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
