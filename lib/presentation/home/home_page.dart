import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/presentation/home/home_page_controller.dart';
import 'package:pix_keeper/presentation/home/widgets/pix_keys_list.dart';
import 'package:pix_keeper/presentation/home/widgets/pix_keys_list_skeleton.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_state.dart';

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
                  const (PixKeyLoadedState) => PixKeysList(
                      onRefresh: controller.onRefresh,
                      pixKeys: state.pixKeys!,
                      onTap: controller.onTapDetails,
                      onShowBottomSheetBanks: controller.onShowBottomSheetBanks,
                    ),
                  _ => const Center(
                      child: Text("Erro inesperado!"),
                    ),
                };
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: controller.onNavigateToForm,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
