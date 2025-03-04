// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:demo02/view/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo02/main.dart';

void main() {
  testWidgets('List of products in first page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the product list is displayed.
    expect(find.byType(ProductItem), findsWidgets);
    expect(find.text("Demo of Products"), findsOneWidget);

    // Verify that the product list is not empty.
    expect(find.byType(ProductItem), findsNWidgets(4));

    // Verify that the cart icon is displayed.
    expect(find.byIcon(Icons.shopping_cart_rounded), findsOneWidget);
  });

  testWidgets('Add a product to cart', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    expect(find.text("0"), findsOneWidget);

    // Tap key="add" to add a product to cart
    await tester.tap(find.byKey(Key("add")).first);
    await tester.pump();

    // Verify that the product is added to cart
    expect(find.text("1"), findsOneWidget);
  });

  testWidgets('Add more than one product to cart', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap key="add" to add a product to cart
    await tester.tap(find.byKey(Key("add")).first);
    await tester.pump();

    // Tap key="add" in second position to add a product to cart
    await tester.tap(find.byKey(Key("add")).at(1));
    await tester.pump();

    // Verify that the product is added to cart
    expect(find.text("2"), findsOneWidget);
  });
}
