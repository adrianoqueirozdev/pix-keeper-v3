import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pix_keeper/shared/constants/app_images.dart';
import 'package:pix_keeper/shared/widgets/bank_icon_button.dart';

void main() {
  testWidgets('BankIconButton shows correct icon', (WidgetTester tester) async {
    bool wasPressed = false;

    const testImagePath = AppImages.caixa;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BankIconButton(
            onPressed: () {
              wasPressed = true;
            },
            imagePath: testImagePath,
          ),
        ),
      ),
    );

    // Verifica se o widget Image foi renderizado
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    // Verifica se o caminho da imagem está correto.
    final imageWidget = tester.widget<Image>(imageFinder);
    expect((imageWidget.image as AssetImage).assetName, testImagePath);

    // Verifica se o botão responde ao toque e chama a função de callback
    final iconButtonFinder = find.byType(IconButton);
    expect(iconButtonFinder, findsOneWidget);

    await tester.tap(iconButtonFinder);
    await tester.pump();

    expect(wasPressed, true);
  });
}
