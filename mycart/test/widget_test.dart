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
}
