import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pix_keeper/shared/widgets/load_data_error.dart';

void main() {
  testWidgets('LoadDataError displays default message', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadDataError(),
        ),
      ),
    );

    // Verifica se a mensagem padrão é exibida
    expect(find.text("Ops! Parece que algo deu errado 🤔. Volte novamente mais tarde 😉."), findsOneWidget);
  });

  testWidgets('LoadDataError displays custom message', (WidgetTester tester) async {
    const customMessage = 'Mensagem personalizada';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadDataError(message: customMessage),
        ),
      ),
    );

    // Verifica se a mensagem personalizada é exibida
    expect(find.text(customMessage), findsOneWidget);
  });
}
