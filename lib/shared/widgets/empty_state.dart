import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pix_keeper/shared/constants/app_images.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String description;

  const EmptyState({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        FadeIn(
          duration: const Duration(milliseconds: 800),
          child: SvgPicture.asset(
            AppImages.empty,
            width: size.width * 0.5,
          ),
        ),
        const SizedBox(height: 16),
        FadeIn(
          duration: const Duration(milliseconds: 800),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
