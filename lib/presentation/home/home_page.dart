import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/presentation/blocs/pix_key/pix_key_state.dart';
import 'package:pix_keeper/presentation/home/home_page_controller.dart';
import 'package:pix_keeper/presentation/home/widgets/pix_keys_list.dart';
import 'package:pix_keeper/presentation/home/widgets/pix_keys_list_skeleton.dart';
import 'package:pix_keeper/shared/constants/animations.dart';
import 'package:pix_keeper/shared/constants/app_images.dart';
import 'package:pix_keeper/shared/widgets/profile_avatar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDarkMode = colorScheme.brightness == Brightness.dark;

    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        final userPhotoUrl = controller.user?.photoURL;

        return Scaffold(
          backgroundColor: isDarkMode ? colorScheme.onSecondary : colorScheme.primary,
          appBar: AppBar(
            backgroundColor: isDarkMode ? colorScheme.onSecondary : colorScheme.primary,
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
