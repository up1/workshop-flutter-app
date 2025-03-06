import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycart/cart/viewmodel/cart_viewmodel.dart';

import 'package:mycart/product/data/product_remote_data.dart';
import 'package:mycart/product/data/product_response_model.dart';
import 'package:mycart/product/view/screen/product_list_screen.dart';
import 'package:mycart/product/view/widget/product_item_widget.dart';
import 'package:mycart/product/viewmodel/product_viewmodel.dart';
import 'package:provider/provider.dart';

class MockProductRemoteDataSource implements ProductRemoteDataSource {
  @override
  Future<ProductResponseModel> getProducts({required int limit}) async {
    return ProductResponseModel.fromJson([
      {
        "id": 1,
        "title": "Product 1",
        "price": 100,
        "description": "Description 1",
        "category": "Category 1",
        "thumbnail": "https://dummyimage.com/600x400/000/fff",
      },
      {
        "id": 2,
        "title": "Product 2",
        "price": 200,
        "description": "Description 2",
        "category": "Category 2",
        "thumbnail": "https://dummyimage.com/600x400/000/fff",
      },
      {
        "id": 3,
        "title": "Product 3",
        "price": 300,
        "description": "Description 3",
        "category": "Category 3",
        "thumbnail": "https://dummyimage.com/600x400/000/fff",
      },
      {
        "id": 4,
        "title": "Product 4",
        "price": 400,
        "description": "Description 4",
        "category": "Category 4",
        "thumbnail": "https://dummyimage.com/600x400/000/fff",
      },
    ]);
  }
}

void main() {
  testWidgets('List of products in first page', (WidgetTester tester) async {
    // Initialize the cart view model.
    final cartViewModel = CartViewModel();
    final productViewModel = ProductViewModel(
      productRemoteDataSource: MockProductRemoteDataSource(),
    );
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<CartViewModel>(create: (_) => cartViewModel),
          ChangeNotifierProvider<ProductViewModel>(
            create: (_) => productViewModel,
          ),
        ],
        child: const MaterialApp(home: ProductScreen()),
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
      final productViewModel = ProductViewModel(
        productRemoteDataSource: MockProductRemoteDataSource(),
      );
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<CartViewModel>(create: (_) => cartViewModel),
            ChangeNotifierProvider<ProductViewModel>(
              create: (_) => productViewModel,
            ),
          ],
          child: const MaterialApp(home: ProductScreen()),
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
