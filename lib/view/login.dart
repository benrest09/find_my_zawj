import 'package:find_my_zawj/database/preferences.dart';
import 'package:find_my_zawj/models/usermodel.dart';
import 'package:find_my_zawj/view/pengguna_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../database/sqflite.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isipassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: const Color.fromARGB(255, 250, 238, 246),
        title: Row(
          children: [
            Text(
              'Find My Zawj',
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFE76CA3),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.favorite,
              color: Color.fromARGB(255, 239, 97, 144),
              size: 24,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),

                Text(
                  "Selamat Datang",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFE76CA3),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Masuk untuk melanjutkan perjalanan menuju pernikahan yang berkah.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),

                const SizedBox(height: 40),

                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: passwordController,
                  obscureText: isipassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outlined),
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

                const SizedBox(height: 8),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Lupa Password?",
                    style: const TextStyle(
                      color: Color(0xFFE76CA3),
                      fontSize: 15,
                    ),
                  ),
                ),

                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () async {
                    final UserModel? login = await DBHelper.loginUser(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    if (login != null) {
                      PreferenceHandler().storingIsLogin(true);
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Login Berhasil")));

                      await Future.delayed(const Duration(seconds: 2));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PenggunaScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Login Gagal, email atau password salah",
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color(0xFFE76CA3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 6,
                  ),
                  child: Text(
                    "Masuk",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFBFCF7FF),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
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
                          child: Image.asset(
                            'assets/icons/apple.png',
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
                          DBHelper.registerUser(
                            UserModel(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Pendaftaran Berhasil")),
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return PenggunaScreen();
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
      ),
    );
  }
}
