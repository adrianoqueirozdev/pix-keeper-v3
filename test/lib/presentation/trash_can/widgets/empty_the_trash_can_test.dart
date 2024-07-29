import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pix_keeper/presentation/trash_can/widgets/empty_the_trash_can.dart';

void main() {
  testWidgets('EmptyTheTrashcan shows correct text and triggers callbacks', (WidgetTester tester) async {
    bool cancelPressed = false;
    bool confirmPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmptyTheTrashcan(
            onCancel: () {
              cancelPressed = true;
            },
            onConfirm: () {
              confirmPressed = true;
            },
          ),
        ),
      ),
    );

    expect(find.text('Esvaziar Lixeira'), findsOneWidget);
    expect(
      find.text(
          "Tem certeza que deseja esvaziar a lixeira? As chaves Pix serão excluídas e não será possível recuperá-las."),
      findsOneWidget,
    );

    final cancelButton = find.text('Cancelar');
    final confirmButton = find.text('Confirmar');

    expect(cancelButton, findsOneWidget);
    expect(confirmButton, findsOneWidget);

    await tester.tap(cancelButton);
    await tester.pump();
    expect(cancelPressed, true);

    await tester.tap(confirmButton);
    await tester.pump();
    expect(confirmPressed, true);
  });
}
