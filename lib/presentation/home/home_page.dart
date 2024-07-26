import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_state.dart';
import 'package:pix_keeper/core/utils/user_manager.dart';
import 'package:pix_keeper/presentation/home/home_page_controller.dart';
import 'package:pix_keeper/presentation/home/widgets/pix_keys_list.dart';
import 'package:pix_keeper/shared/constants/app_constants.dart';
import 'package:pix_keeper/shared/constants/app_images.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';
import 'package:pix_keeper/shared/widgets/load_data_error.dart';
import 'package:pix_keeper/shared/widgets/pix_keys_list_skeleton.dart';
import 'package:pix_keeper/shared/widgets/profile_avatar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userPhotoUrl = UserManager().user?.photoURL;

    final pixKeyBloc = Get.find<PixKeyBloc>();

    return GetBuilder<HomePageController>(
      init: HomePageController(pixKeyBloc: pixKeyBloc),
      builder: (controller) {
        return BlocListener<PixKeyBloc, PixKeyState>(
          bloc: pixKeyBloc,
          listener: (context, state) {
            if (state is DeletePixKeySuccessState) {
              Future.microtask(() => controller.showSnackBarDeletePixKeySuccess(state.id));
            } else if (state is RestorePixKeySuccessState) {
              Future.microtask(() => controller.showSnackBarRestorePixKeySuccess());
            }
          },
          child: BaseWidgetBuilder(
            builder: (context, textTheme, colorScheme, isDarkMode, _) {
              final backgroundColor = isDarkMode ? colorScheme.onSecondary : colorScheme.primary;

              return Scaffold(
                backgroundColor: backgroundColor,
                appBar: AppBar(
                  backgroundColor: backgroundColor,
                  foregroundColor: isDarkMode ? colorScheme.onSurface : colorScheme.onPrimary,
                  toolbarHeight: 72,
                  leadingWidth: 52,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SvgPicture.asset(
                      AppImages.logoDefault,
                      width: 40,
                      height: 40,
                    ).animate().fade(duration: kDurationAnimation),
                  ),
                  title: Text(
                    'Chaves Pix',
                    style: textTheme.headlineSmall?.copyWith(
                      color: isDarkMode ? colorScheme.onSurface : colorScheme.onPrimary,
                    ),
                  ),
                  actions: [
                    if (userPhotoUrl != null) ...[
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: controller.onNavigateToProfile,
                        child: ProfileAvatar(imageUrl: userPhotoUrl),
                      ),
                      const SizedBox(width: 12),
                    ]
                  ],
                ),
                body: Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: BlocBuilder<PixKeyBloc, PixKeyState>(
                    bloc: controller.pixKeyBloc,
                    builder: (context, state) {
                      return switch (state.runtimeType) {
                        const (PixKeyInitialState) => const PixKeysListSkeleton(),
                        const (PixKeyLoadedState) => PixKeysList(
                            pixKeys: state.pixKeys!,
                            onRefresh: controller.onRefresh,
                            onNavigateToDetails: controller.onNavigateToDetails,
                            onShowBottomSheetBanks: controller.onShowBottomSheetBanks,
                          ),
                        _ => const LoadDataError(),
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
          ),
        );
      },
    );
  }
}
