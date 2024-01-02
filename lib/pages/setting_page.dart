import 'package:coffe_shop/const.dart';
import 'package:coffe_shop/pages/history_page.dart';
import 'package:coffe_shop/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular Avatar
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                  'lib/images/profile.png'), // Add your image asset path
            ),
            const SizedBox(height: 20),
            Text(
              'Have A nice Day',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Text(
                  '"Pekerjaan besar tidak dihasilkan oleh kekuatan, tetapi oleh daya tahan. Keseriusan bukanlah kemampuan untuk bertahan saat Anda berada di bawah, tetapi kemampuan untuk terus maju saat Anda melihat kesulitan."',
                  style: GoogleFonts.poppins(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                width: double.infinity,
                child: Center(
                  child: Text(
                    'History',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Splash()),
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Log Out',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w500),
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
