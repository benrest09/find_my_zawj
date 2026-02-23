import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/splash_screen.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const Text(
                "Find your soulmate",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Serif',
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Karena jodoh bukan hanya tentang rasa,\n"
                "tetapi tentang iman, kesiapan, dan doa yang\n"
                "dipertemukan dengan cara terbaik.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.6),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE06292),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Isi Sekarang",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextButton(
                onPressed: () {},
                child: const Text(
                  "Isi Nanti",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
