import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/presentation/pix_key_form/pix_key_form_page_controller.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';
import 'package:pix_keeper/shared/widgets/modal_bottom_sheet_base.dart';

class SelectPixKeyType extends StatelessWidget {
  final PixKeyFormPageController pixKeyFormPageController;

  const SelectPixKeyType({super.key, required this.pixKeyFormPageController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PixKeyFormPageController>(
      init: pixKeyFormPageController,
      builder: (controller) {
        return BaseWidgetBuilder(
          builder: (context, textTheme, colorScheme, isDarkMode, size) {
            return ModalBottomSheetBase(
              height: 430,
              title: "Tipo de chave",
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: controller.pixKeyTypesOptions.length,
                    itemBuilder: (context, index) {
                      return RadioListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        value: controller.pixKeyTypesOptions[index],
                        title: Text(
                          controller.pixKeyTypesOptions[index].label!,
                          style: textTheme.bodyLarge,
                        ),
                        groupValue: controller.selectedKeyPixType,
                        selected: controller.pixKeyTypesOptions[index] == controller.selectedKeyPixType,
                        onChanged: controller.setSelectKeyPixType,
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  height: 56,
                  child: FilledButton(
                    onPressed: () => Get.back(),
                    child: const Text('Confirmar'),
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
