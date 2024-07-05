import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/presentation/pix_key_form/pix_key_form_page_controller.dart';

import 'package:pix_keeper/shared/widgets/modal_bottom_sheet_base.dart';

class SelectPixKeyType extends StatelessWidget {
  const SelectPixKeyType({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder<PixKeyFormPageController>(
      init: PixKeyFormPageController(),
      builder: (controller) {
        return ModalBottomSheetBase(
          height: 430,
          title: "Tipo de chave",
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.keyPixTypeOptions.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    value: controller.keyPixTypeOptions[index],
                    title: Text(
                      controller.keyPixTypeOptions[index].label!,
                      style: textTheme.bodyMedium,
                    ),
                    groupValue: controller.selectedKeyPixType,
                    selected: controller.keyPixTypeOptions[index] == controller.selectedKeyPixType,
                    onChanged: controller.setSelectKeyPixType,
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                onPressed: controller.confirmSelectKeyPixType,
                child: const Text('Confirmar'),
              ),
            ),
            const SizedBox(
              height: 24,
            )
          ],
        );
      },
    );
  }
}
