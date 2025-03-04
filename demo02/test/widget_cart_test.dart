// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:demo02/view/screen/cart_screen.dart';
import 'package:demo02/view/widget/cart_item.dart';
import 'package:demo02/viewmodel/products_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Check data in cart', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // Create 3 data tests for ProductsViewModel()
    final productsViewModel = ProductsViewModel();
    productsViewModel.add("image1", "name1");
    productsViewModel.add("image2", "name2");
    productsViewModel.add("image3", "name3");

    await tester.pumpWidget(
      ChangeNotifierProvider<ProductsViewModel>(
        create: (_) => productsViewModel,
        child: const MaterialApp(home: CartScreen()),
      ),
    );

    // Find and verify the cart title widget
    expect(find.byKey(const Key("cart_title")), findsOneWidget);
    // Get value of cart title
    final cartTitle = tester.widget<Text>(find.byKey(const Key("cart_title")));
    expect(cartTitle.data, "Cart");

    // Verify the number of items in cart
    expect(find.byKey(const Key("cart_list")), findsOneWidget);

    // Verify the content of items
    expect(find.byType(CartItem), findsNWidgets(3));
  });
}
