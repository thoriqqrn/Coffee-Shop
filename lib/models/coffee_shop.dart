import 'package:coffe_shop/models/history_entry.dart';
import 'package:flutter/material.dart';

import 'coffee.dart'; // Assuming you have a Coffee class

class CoffeeShop extends ChangeNotifier {
  List<Coffee> coffeesForSale = [];
  List<Coffee> userCart = [];
  List<HistoryEntry> orderHistory = [];

  CoffeeShop() {
    // Initialize some sample coffees for sale
    coffeesForSale = [
      Coffee(
        name: 'Long Black',
        price: 'Rp 17.000',
        imagePath: 'lib/images/black.png',
      ),
      Coffee(
          name: 'Latte', price: 'Rp 30.000', imagePath: 'lib/images/latte.png'),
      Coffee(
          name: 'Espresso',
          price: 'Rp 23.000',
          imagePath: 'lib/images/espresso.png'),
      Coffee(
          name: 'Iced Coffee',
          price: 'Rp 25.000',
          imagePath: 'lib/images/ice-coffee.png'),
      Coffee(
          name: 'Iced Matcha',
          price: 'Rp 27.000',
          imagePath: 'lib/images/fruit.png'),
      Coffee(
          name: 'Iced Taro',
          price: 'Rp 27.000',
          imagePath: 'lib/images/taro.png'),
      Coffee(
          name: 'Javanese Fried Rice',
          price: 'Rp 35.000',
          imagePath: 'lib/images/fried-rice.png'),
      Coffee(
          name: 'French Fries',
          price: 'Rp 17.000',
          imagePath: 'lib/images/french-fries.png'),
    ];
  }

  List<Coffee> getCoffeeList() {
    // Return the list of available coffees for sale
    return coffeesForSale;
  }

  List<Coffee> getUserCart() {
    // Return the user's cart
    return userCart;
  }

  void addToCart(Coffee coffee) {
    // Add a coffee to the user's cart
    userCart.add(coffee);
    notifyListeners();
  }

  void removeFromCart(Coffee coffee) {
    // Remove a coffee from the user's cart
    userCart.remove(coffee);
    notifyListeners();
  }

  void clearCart() {
    userCart.clear();
    notifyListeners();
  }

  void addToHistory(List<Coffee> items, String paymentMethod) {
    final date = DateTime.now().toString();

    final historyEntry = HistoryEntry(
      itemName: items.map((coffee) => coffee.name).join(', '),
      date: date,
      paymentMethod: paymentMethod,
    );

    orderHistory.add(historyEntry);
    notifyListeners();
  }
}
