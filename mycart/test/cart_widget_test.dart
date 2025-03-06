import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mycart/cart/view/screen/cart_screen.dart';
import 'package:mycart/cart/view/widget/cart_item_widget.dart';
import 'package:mycart/cart/viewmodel/cart_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Check data in cart', (WidgetTester tester) async {
    // Create 3 data tests for CartViewModel
    final cartViewModel = CartViewModel();
    cartViewModel.add("image1", "name1");
    cartViewModel.add("image2", "name2");
    cartViewModel.add("image3", "name3");
    await tester.pumpWidget(
      ChangeNotifierProvider<CartViewModel>(
        create: (_) => cartViewModel,
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
    expect(find.text("name1"), findsOneWidget);
    expect(find.text("name2"), findsOneWidget);
    expect(find.text("name3"), findsOneWidget);
  });
}
