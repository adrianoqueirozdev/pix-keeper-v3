import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/presentation/home/home_page_controller.dart';
import 'package:pix_keeper/presentation/home/widgets/pix_keys_list.dart';
import 'package:pix_keeper/presentation/home/widgets/pix_keys_list_skeleton.dart';
import 'package:pix_keeper/presentation/pix_key_form/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/presentation/pix_key_form/blocs/pix_key/pix_key_state.dart';
import 'package:pix_keeper/shared/constants/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Chaves Pix'),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<PixKeyBloc, PixKeyState>(
              bloc: controller.pixKeyBloc,
              builder: (context, state) {
                return switch (state.runtimeType) {
                  const (PixKeyInitialState) => const PixKeysListSkeleton(),
                  const (PixKeyLoadedState) => PixKeysList(pixKeys: state.pixKeys),
                  _ => const Text("Erro"),
                };
              },
            ),
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
