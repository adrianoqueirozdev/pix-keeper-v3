import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pix_keeper/shared/widgets/custom_icon_button.dart';

class MockCallback extends Mock {
  void call();
}

void main() {
  testWidgets('CustomIconButton displays correctly and calls onPressed', (WidgetTester tester) async {
    // Criar retornos de chamada simulados
    final mockOnPressed = MockCallback();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomIconButton(
            icon: Icons.add,
            onPressed: mockOnPressed.call,
            size: const Size(28, 28),
            iconSize: 24,
            colorIcon: Colors.red,
          ),
        ),
      ),
    );

    // Verifica se o ícone é exibido corretamente
    expect(find.byIcon(Icons.add), findsOneWidget);
    final Icon icon = tester.widget(find.byIcon(Icons.add));
    expect(icon.size, 24);
    expect(icon.color, Colors.red);

    // Pressiona o botão do ícone e verifica se o retorno de chamada foi chamado
    await tester.tap(find.byType(IconButton));
    verify(mockOnPressed()).called(1);
  });
}
