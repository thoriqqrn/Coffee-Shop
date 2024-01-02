import 'package:coffe_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final coffeeShop = Provider.of<CoffeeShop>(context);

    // Sorting orderHistory berdasarkan tanggal (dari yang terbaru)
    coffeeShop.orderHistory.sort((a, b) => b.date.compareTo(a.date));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order History',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
        itemCount: coffeeShop.orderHistory.length,
        itemBuilder: (context, index) {
          final historyEntry = coffeeShop.orderHistory[index];
          return ListTile(
            title: Text('Items: ${historyEntry.itemName}'),
            subtitle: Text(
                'Date: ${historyEntry.date}\nPayment Method: ${historyEntry.paymentMethod}'),
          );
        },
      ),
    );
  }
}
