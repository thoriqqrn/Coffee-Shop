import 'package:coffe_shop/const.dart';
import 'package:coffe_shop/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('lib/images/espresso.png', height: 170),
          const SizedBox(
            height: 57,
          ),
          Text("Brew Day",
              style: GoogleFonts.poppins(
                color: const Color(0xFF5C4534),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 12,
          ),
          Text('How do you like your coffe ? ',
              style: GoogleFonts.poppins(
                color: const Color(0x8E5C4534),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(
            height: 62,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: 280,
                    height: 63,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF5C4534),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 84,
                  top: 17,
                  child: Text(
                    'Enter Shop',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          )
        ])));
  }
}
