import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/presentation/blocs/participants_pix/participants_pix_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/participants_pix/participants_pix_state.dart';
import 'package:pix_keeper/presentation/pix_key_form/pix_key_form_page_controller.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';
import 'package:pix_keeper/shared/widgets/custom_icon_button.dart';
import 'package:pix_keeper/shared/widgets/modal_bottom_sheet_base.dart';

class SelectedInstitution extends StatelessWidget {
  final PixKeyFormPageController pixKeyFormPageController;

  const SelectedInstitution({super.key, required this.pixKeyFormPageController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PixKeyFormPageController>(
      init: pixKeyFormPageController,
      builder: (controller) {
        return BaseWidgetBuilder(
          builder: (context, textTheme, colorScheme, _, size) {
            return ModalBottomSheetBase(
              height: size.height * 0.95,
              title: "Instituição",
              children: [
                Container(
                  height: 56,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer.withAlpha(100),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Row(
                    textDirection: Directionality.of(context),
                    children: [
                      const Icon(Icons.search),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 8),
                          child: TextField(
                            controller: controller.filterController,
                            onChanged: controller.onChangeFilterParticipantsPix,
                            decoration: const InputDecoration(
                              hintText: "Pesquisar",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: controller.filterController.text.isNotEmpty,
                        child: CustomIconButton(
                          icon: Icons.close,
                          onPressed: controller.onClearFilter,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                BlocBuilder<ParticipantsPixBloc, ParticipantsPixState>(
                  bloc: controller.participantsPixBloc,
                  builder: (context, state) {
                    final list = state.participantsPix;

                    if (list.isEmpty) {
                      return Center(
                        child: Text(
                          "Instituição não encontrada",
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.secondary,
                          ),
                        ),
                      );
                    }

                    return Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return RadioListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            value: list[index],
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  list[index].shortName!,
                                  style: textTheme.bodyLarge,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  list[index].ispb!,
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.secondary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                            groupValue: controller.selectedParticipantPix,
                            selected: controller.selectedParticipantPix == list[index],
                            onChanged: controller.setSelectedParticipantPix,
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Visibility(
                  visible: controller.participantsPixBloc.state.participantsPix.isNotEmpty,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: 56,
                    child: FilledButton(
                      onPressed: () => Get.back(),
                      child: const Text('Confirmar'),
                    ),
                  ),
                ),
                const SizedBox(height: 24)
              ],
            );
          },
        );
      },
    );
  }
}
