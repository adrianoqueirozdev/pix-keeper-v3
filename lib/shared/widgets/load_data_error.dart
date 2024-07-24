import 'package:flutter/material.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';

class LoadDataError extends StatelessWidget {
  final String message;

  const LoadDataError({super.key, this.message = "Ops! Parece que algo deu errado 🤔. Volte novamente mais tarde 😉."});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetBuilder(
      builder: (_, textTheme, __, ___, ____) => Center(
        child: Text(
          message,
          style: textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
