import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_state.dart';
import 'package:pix_keeper/presentation/pix_key_form/pix_key_form_page_controller.dart';
import 'package:pix_keeper/presentation/pix_key_form/widgets/custom_text_field.dart';
import 'package:pix_keeper/shared/validations/validation_pix_key_form.dart';

class PixKeyFormPage extends StatelessWidget {
  const PixKeyFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GetBuilder<PixKeyFormPageController>(
      init: PixKeyFormPageController(),
      builder: (controller) {
        return BlocBuilder<PixKeyBloc, PixKeyState>(
          bloc: controller.pixKeyBloc,
          builder: (context, state) {
            final isLoading = state is CreatePixKeyLoadingState;

            return Scaffold(
              appBar: AppBar(
                title: Text(controller.isEdit ? 'Editar chave' : 'Adicionar chave'),
                actions: [
                  IconButton(
                    onPressed: isLoading ? null : controller.savePixKey,
                    icon: SizedBox(
                      width: 24,
                      height: 24,
                      child: isLoading
                          ? CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colorScheme.onPrimary,
                            )
                          : const Icon(Icons.check),
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
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
                          suffixIcon: const Icon(Icons.expand_more),
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
                          suffixIcon: const Icon(Icons.expand_more),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
