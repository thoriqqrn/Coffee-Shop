import 'package:flutter/material.dart';
import 'package:coffe_shop/models/coffee.dart';
import 'package:coffe_shop/models/coffee_shop.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Coffee> userCart;
  @override
  void initState() {
    super.initState();
    userCart = Provider.of<CoffeeShop>(context, listen: false).getUserCart();
  }

  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeFromCart(coffee);
  }

  Future<void> _showConfirmationDialog(Coffee coffee) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirmation',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          content: Text(
            'Are you sure you want to remove this item from your order?',
            style: GoogleFonts.poppins(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the AlertDialog
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                removeFromCart(coffee);
                Navigator.of(context).pop(); // Close the AlertDialog
              },
              child: Text(
                'Yes, Remove',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showPaymentConfirmationDialog(
      String paymentMethod, List<Coffee> userCart) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Payment Confirmation',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Order Details:',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              Consumer<CoffeeShop>(
                builder: (context, value, child) {
                  List<Coffee> userCart = value.getUserCart();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: userCart.map((coffee) {
                      return ListTile(
                        title: Text(coffee.name),
                        subtitle: Text(coffee.price),
                        trailing: Image.asset(coffee.imagePath),
                      );
                    }).toList(),
                  );
                },
              ),
              SizedBox(height: 20),
              Text(
                'Choose Payment Method:',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () {
                      _handlePaymentConfirmation('QRIS', userCart);
                    },
                    child: Text(
                      'QRIS',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () {
                      _handlePaymentConfirmation('Cash', userCart);
                    },
                    child: Text(
                      'Cash',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _handlePaymentConfirmation(String paymentMethod, List<Coffee> userCart) {
    // Handle payment confirmation logic here
    if (paymentMethod == 'QRIS') {
      // Implement QRIS payment logic
    } else if (paymentMethod == 'Cash') {
      // Implement Cash payment logic
    }

    // Add the order to the order history
    Provider.of<CoffeeShop>(context, listen: false)
        .addToHistory(userCart, paymentMethod);

    // Clear the cart
    Provider.of<CoffeeShop>(context, listen: false).clearCart();

    // Close the dialogs and show payment success snackbar
    Navigator.of(context).pop(); // Close the Payment Confirmation Dialog
    showSnackbar('Payment Successful');
  }

  void showSnackbar(String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        message,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              'Your Order',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 18),
            Expanded(
              child: Consumer<CoffeeShop>(
                builder: (context, value, child) {
                  List<Coffee> userCart = value.getUserCart();

                  if (userCart.isEmpty) {
                    return const Center(
                      child: Text('Your cart is empty.'),
                    );
                  }

                  return ListView.builder(
                    itemCount: userCart.length,
                    itemBuilder: (context, index) {
                      Coffee cartItem = userCart[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                          horizontal: 10,
                        ),
                        child: ListTile(
                          title: Text(
                            cartItem.name,
                            style: GoogleFonts.poppins(),
                          ),
                          subtitle: Text(cartItem.price),
                          leading: Image.asset(cartItem.imagePath),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              _showConfirmationDialog(cartItem);
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                _showPaymentConfirmationDialog('Cash', userCart);
              },
              child: Container(
                padding: const EdgeInsets.all(25),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Pay Now',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
