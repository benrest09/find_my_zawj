import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Find My Zawj',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 119, 164),
                    fontSize: 30,
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
          ],
        ),
        backgroundColor: Color.fromARGB(255, 250, 238, 246),
      ),

      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentGeometry.topCenter,
          children: [
            Text(
              "ini homepage",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
