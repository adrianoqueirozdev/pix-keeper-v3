import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pix_keeper/shared/widgets/bottom_sheet_group_button.dart';

class MockCallback extends Mock {
  void call();
}

void main() {
  testWidgets('BottomSheetGroupButton displays correctly and calls callbacks', (WidgetTester tester) async {
    // Criar retornos de chamada simulados
    final mockOnPrimaryAction = MockCallback();
    final mockOnSecondaryAction = MockCallback();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BottomSheetGroupButton(
            primaryText: 'Confirmar',
            secondaryText: 'Cancelar',
            onPrimaryAction: mockOnPrimaryAction.call,
            onSecondaryAction: mockOnSecondaryAction.call,
          ),
        ),
      ),
    );

    // Verifica se os botões são exibidos corretamente
    expect(find.text('Confirmar'), findsOneWidget);
    expect(find.text('Cancelar'), findsOneWidget);

    // Pressiona o botão principal e verifica se o retorno de chamada foi chamado
    await tester.tap(find.text('Confirmar'));
    verify(mockOnPrimaryAction()).called(1);

    // Pressiona o botão secundário e verifica se o retorno de chamada foi chamado
    await tester.tap(find.text('Cancelar'));
    verify(mockOnSecondaryAction()).called(1);
  });
}
