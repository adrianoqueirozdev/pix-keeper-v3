import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pix_keeper/shared/widgets/base_widget.dart';

void main() {
  testWidgets('BaseWidgetBuilder passes correct parameters to builder', (WidgetTester tester) async {
    late BuildContext capturedContext;
    late TextTheme capturedTextTheme;
    late ColorScheme capturedColorScheme;
    late bool capturedIsDarkMode;
    late Size capturedSize;

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          body: BaseWidgetBuilder(
            builder: (context, textTheme, colorScheme, isDarkMode, size) {
              capturedContext = context;
              capturedTextTheme = textTheme;
              capturedColorScheme = colorScheme;
              capturedIsDarkMode = isDarkMode;
              capturedSize = size;

              return const SizedBox();
            },
          ),
        ),
      ),
    );

    // Verifica se o construtor é chamado com os parâmetros corretos
    expect(capturedContext, isNotNull);
    expect(capturedTextTheme, isNotNull);
    expect(capturedColorScheme, isNotNull);
    expect(capturedIsDarkMode, isFalse); // O tema padrão é claro, então isDarkMode deve ser falso
    expect(capturedSize, isNotNull);
  });

  testWidgets('BaseWidgetBuilder adapts to dark mode', (WidgetTester tester) async {
    late bool capturedIsDarkMode;

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark, // Força o modo dark
        home: Scaffold(
          body: BaseWidgetBuilder(
            builder: (context, textTheme, colorScheme, isDarkMode, size) {
              capturedIsDarkMode = isDarkMode;

              return const SizedBox();
            },
          ),
        ),
      ),
    );

    // Verifique se o construtor é chamado com isDarkMode definido como verdadeiro
    expect(capturedIsDarkMode, isTrue);
  });
}
