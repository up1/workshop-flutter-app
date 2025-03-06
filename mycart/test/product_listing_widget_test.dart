import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycart/cart/viewmodel/cart_viewmodel.dart';

import 'package:mycart/main.dart';
import 'package:mycart/product/view/widget/product_item_widget.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('List of products in first page', (WidgetTester tester) async {
    // Initialize the cart view model.
    final cartViewModel = CartViewModel();
    await tester.pumpWidget(
      ChangeNotifierProvider<CartViewModel>(
        create: (_) => cartViewModel,
        child: const MaterialApp(home: MyApp()),
      ),
    );

    // Verify that the product list is displayed.
    expect(find.byType(ProductItem), findsWidgets);
    expect(find.byIcon(Icons.shopping_cart_rounded), findsOneWidget);

    // Verify that the product list is not empty.
    expect(find.text("Product Listing"), findsOneWidget);
    final productTitle = tester.widget<Text>(
      find.byKey(const Key("product_listing")),
    );
    expect(productTitle.data, "Product Listing");

    // Verify that the product list is not empty.
    expect(find.byType(ProductItem), findsNWidgets(4));

    // Verify that the cart icon is displayed.
    expect(find.byIcon(Icons.shopping_cart_rounded), findsOneWidget);
  });

  testWidgets(
    'Add more than one product to cart and check number of product in cart',
    (WidgetTester tester) async {
      // Initialize the cart view model.
      final cartViewModel = CartViewModel();
      await tester.pumpWidget(
        ChangeNotifierProvider<CartViewModel>(
          create: (_) => cartViewModel,
          child: const MaterialApp(home: MyApp()),
        ),
      );

      // Tap key="add" to add a product to cart
      await tester.tap(find.byKey(Key("add")).first);
      await tester.pump();

      // Tap key="add" in second position to add a product to cart
      await tester.tap(find.byKey(Key("add")).at(1));
      await tester.pump();

      // Verify that the product is added to cart
      expect(find.text("2"), findsOneWidget);

      final cartCounter = tester.widget<Text>(
        find.byKey(const Key("cart_counter")),
      );
      expect(cartCounter.data, "2", reason: "Cart counter is not 2");
    },
  );
}
