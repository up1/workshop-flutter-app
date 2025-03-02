import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo01/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ShoppingCartApp());

    // Verify appbar's title
    expect(find.text('Catalog'), findsOneWidget);

    // Verify shopping cart icon
    expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
  });
}
