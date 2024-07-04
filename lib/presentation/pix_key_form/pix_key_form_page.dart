import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/presentation/pix_key_form/pix_key_form_page_controller.dart';

class PixKeyFormPage extends StatelessWidget {
  const PixKeyFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PixKeyFormPageController>(
      init: PixKeyFormPageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Adicionar Chave Pix'),
          ),
          body: const Center(
            child: Text('Pix Key Form Page'),
          ),
        );
      },
    );
  }
}
