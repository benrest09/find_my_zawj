import 'package:find_my_zawj/database/siswa_controller.dart';
import 'package:find_my_zawj/models/siswa_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CrSiswaScreen extends StatefulWidget {
  const CrSiswaScreen({super.key});

  @override
  State<CrSiswaScreen> createState() => _CrSiswaScreenState();
}

class _CrSiswaScreenState extends State<CrSiswaScreen> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();

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

      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextFormField(
              controller: namaController,
              decoration: InputDecoration(
                hintText: 'Masukkan Nama Anda',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: kelasController,
              decoration: InputDecoration(
                hintText: 'Masukkan Kelas',
                prefixIcon: const Icon(Icons.class_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (namaController.text.isEmpty) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Nama Belum Diisi")));
                    return;
                  }
                  if (kelasController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Kelas Belum Diisi")),
                    );
                    return;
                  }
                  SiswaController.registerSiswa(
                    SiswaModel(
                      nama: namaController.text,
                      kelas: kelasController.text,
                    ),
                  );

                  namaController.clear();
                  kelasController.clear();
                  setState(() {});
                },
                child: Text("Register Siswa"),
              ),
            ),

            FutureBuilder(
              future: SiswaController.getAllSiswa(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                final dataSiswa = snapshot.data as List<SiswaModel>;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataSiswa.length,
                  itemBuilder: (BuildContext context, int index) {
                    final items = dataSiswa[index];
                    return ListTile(
                      title: Text(items.nama),
                      subtitle: Text(items.kelas),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
