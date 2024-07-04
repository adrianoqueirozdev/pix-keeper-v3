import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pix_keeper/presentation/home/home_page_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Chaves Pix'),
          ),
          body: const Center(
            child: Text('Home Page'),
          ),
        );
      },
    );
  }
}
