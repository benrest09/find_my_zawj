import 'package:find_my_zawj/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isipassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Find My Zawj',
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE76CA3),
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 239, 97, 144),
                  size: 24,
                ),
              ],
            ),
            SizedBox(height: 4),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 250, 238, 246),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                "Selamat Datang",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE76CA3),
                ),
              ),
              SizedBox(height: 8),

              Text(
                "Masuk untuk melanjutkan perjalanan menuju pernikahan yang berkah.",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 8),

              TextFormField(
                obscureText: isipassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock_outlined),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isipassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isipassword = !isipassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Lupa Password?",
                  style: TextStyle(color: Color(0xFFE76CA3), fontSize: 15),
                ),
              ),
              SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    print('o');
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 40),
                  backgroundColor: Color(0xFFE76CA3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(20),
                  ),
                  elevation: 6,
                ),
                child: Text(
                  "Masuk",
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFBFCF7FF),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Center(
                child: Text(
                  "Atau lanjutkan dengan",
                  style: TextStyle(color: Colors.grey[600], fontSize: 18),
                ),
              ),
              SizedBox(height: 35),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      print("google login");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFBFCF7FF),
                        //Color(0xFFFFB7DC),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 201, 199, 199),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/icons/google.png',
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),

                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      print("google login");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFBFCF7FF),
                        //Color(0xFFFFB7DC),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 201, 199, 199),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset('assets/icons/apple.png', width: 30),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),

                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      print("google login");
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFBFCF7FF),
                        //Color(0xFFFFB7DC),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 201, 199, 199),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/icons/facebook.png',
                          width: 30,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20, height: 16),
                ],
              ),

              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum Punya Akun? ",
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return SplashScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Daftar",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE76CA3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
