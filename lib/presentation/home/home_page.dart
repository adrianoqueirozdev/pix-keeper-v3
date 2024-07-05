import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/presentation/home/home_page_controller.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';

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
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.toNamed(AppRoutes.pixKeyForm),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
