import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';
import 'package:pix_keeper/shared/widgets/profile_avatar.dart';

class UserProfileInfo extends StatelessWidget {
  final User user;

  const UserProfileInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetBuilder(
      builder: (context, textTheme, colorScheme, isDarkMode, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: ProfileAvatar(
                borderColor: isDarkMode ? colorScheme.onSurface : colorScheme.surface,
                size: 100,
                imageUrl: user.photoURL!,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${user.displayName}",
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: isDarkMode ? colorScheme.onSurface : colorScheme.surface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "${user.email}",
              style: textTheme.bodyMedium?.copyWith(
                color: isDarkMode ? colorScheme.onSurfaceVariant : colorScheme.surface,
              ),
            ),
            const SizedBox(height: 12),
          ].animate().fade(duration: 200.ms),
        );
      },
    );
  }
}
