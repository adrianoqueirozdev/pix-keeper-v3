import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pix_keeper/presentation/profile/profile_page_controller.dart';
import 'package:pix_keeper/presentation/profile/widgets/user_profile_info.dart';
import 'package:pix_keeper/shared/constants/environments.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    final isDarkMode = colorScheme.brightness == Brightness.dark;

    return GetBuilder<ProfilePageController>(
      init: ProfilePageController(),
      builder: (controller) {
        final user = controller.user;

        return Scaffold(
          backgroundColor: isDarkMode ? colorScheme.onSecondary : colorScheme.primary,
          appBar: AppBar(
            backgroundColor: isDarkMode ? colorScheme.onSecondary : colorScheme.primary,
            foregroundColor: isDarkMode ? colorScheme.onSurface : colorScheme.onPrimary,
            actions: [
              IconButton(
                onPressed: controller.onLogout,
                icon: const Icon(Icons.logout),
              )
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(190),
              child: SizedBox(
                height: 190,
                width: size.width,
                child: UserProfileInfo(user: user!),
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              children: [
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  onTap: controller.onNavigateToTrashCan,
                  leading: const Icon(Icons.delete_sweep),
                  title: const Text("Lixeira"),
                  style: ListTileStyle.drawer,
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
                const Divider(
                  thickness: 0.5,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  onTap: controller.onOpenAppSettings,
                  leading: const Icon(Icons.settings),
                  title: const Text("Configurações"),
                  style: ListTileStyle.drawer,
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
              ].animate(interval: 50.ms).fade(),
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              "v${Environments.appVersion}",
              style: textTheme.titleSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        );
      },
    );
  }
}
