import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_events.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_keys_deleted/pix_keys_deleted_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_keys_deleted/pix_keys_deleted_state.dart';
import 'package:pix_keeper/core/presentation/factories/pix_keys_deleted_bloc_factory.dart';
import 'package:pix_keeper/shared/widgets/load_data_error.dart';
import 'package:pix_keeper/shared/widgets/pix_keys_list_skeleton.dart';
import 'package:pix_keeper/presentation/trash_can/trash_can_page_controller.dart';
import 'package:pix_keeper/presentation/trash_can/widgets/trash_can_pix_keys_list.dart';

class TrashCanPage extends StatelessWidget {
  const TrashCanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pixKeyBloc = Get.find<PixKeyBloc>();

    return GetBuilder<TrashCanPageController>(
      init: TrashCanPageController(pixKeysDeletedBloc: PixKeysDeletedBlocFactory.create()),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Lixeira"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: BlocListener<PixKeysDeletedBloc, PixKeysDeletedState>(
              bloc: controller.pixKeysDeletedBloc,
              listener: (context, state) {
                if (state is PixKeysDeletedSuccessState) {
                  pixKeyBloc.add(LoadPixKeysEvent());
                }
              },
              child: BlocBuilder<PixKeysDeletedBloc, PixKeysDeletedState>(
                bloc: controller.pixKeysDeletedBloc,
                builder: (context, state) {
                  return switch (state.runtimeType) {
                    const (PixKeysDeletedInitialState) => const PixKeysListSkeleton(),
                    const (PixKeysDeletedSuccessState) => TrashCanPixKeysList(
                        pixKeys: state.pixKeys!,
                        onRefresh: controller.onRefresh,
                        onRestore: controller.onRestore,
                      ),
                    _ => const LoadDataError(),
                  };
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
