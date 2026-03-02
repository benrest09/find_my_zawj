// ignore_for_file: deprecated_member_use

import 'package:find_my_zawj/database/pengguna_controller.dart';
import 'package:find_my_zawj/models/profil_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PenggunaScreen extends StatefulWidget {
  const PenggunaScreen({super.key});

  @override
  State<PenggunaScreen> createState() => _PenggunaScreenState();
}

class _PenggunaScreenState extends State<PenggunaScreen> {
  final namaController = TextEditingController();
  final umurController = TextEditingController();
  final domisiliController = TextEditingController();
  final tanggalLahirController = TextEditingController();

  String? selectedGender;
  DateTime? selectedDate;

  late Future<List<PenggunaModel>> _penggunaList;

  @override
  void initState() {
    super.initState();
    _penggunaList = PenggunaController.getAllPengguna();
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Text(
              'Lengkapi Profil Anda',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 141, 141, 141),
              ),
            ),
            const SizedBox(height: 20),

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

            const SizedBox(height: 10),

            TextFormField(
              controller: umurController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Masukkan Umur',
                prefixIcon: const Icon(Icons.cake),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 10),

            TextFormField(
              controller: domisiliController,
              decoration: InputDecoration(
                hintText: 'Masukkan Domisili',
                prefixIcon: const Icon(Icons.location_city_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Jenis Kelamin",
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
            ),

            RadioListTile<String>(
              value: "Laki-Laki",
              groupValue: selectedGender,
              title: const Text("Laki-Laki"),
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),

            RadioListTile<String>(
              value: "Perempuan",
              groupValue: selectedGender,
              title: const Text("Perempuan"),
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),

            const SizedBox(height: 10),

            TextFormField(
              controller: tanggalLahirController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Pilih Tanggal Lahir',
                prefixIcon: const Icon(Icons.date_range_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );

                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                    tanggalLahirController.text =
                        "${picked.day}/${picked.month}/${picked.year}";
                  });
                }
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE76CA3), Color(0xFFF9A8D4)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    if (namaController.text.isEmpty) {
                      showMessage("Nama Belum Diisi");
                      return;
                    }

                    if (umurController.text.isEmpty) {
                      showMessage("Umur Belum Diisi");
                      return;
                    }

                    int? umur = int.tryParse(umurController.text);

                    if (umur == null) {
                      showMessage("Umur harus berupa angka");
                      return;
                    }

                    if (umur < 18) {
                      showMessage("Umur Minimal 18 Tahun");
                      return;
                    }

                    if (domisiliController.text.isEmpty) {
                      showMessage("Domisili Belum Diisi");
                      return;
                    }

                    if (selectedDate == null) {
                      showMessage("Tanggal Lahir Belum Dipilih");
                      return;
                    }

                    if (selectedGender == null) {
                      showMessage("Jenis Kelamin Belum Dipilih");
                      return;
                    }

                    await PenggunaController.registerPengguna(
                      PenggunaModel(
                        nama: namaController.text,
                        umur: umur,
                        domisili: domisiliController.text,
                        jenisKelamin: selectedGender!,
                        tanggalLahir: selectedDate!.toIso8601String(),
                      ),
                    );

                    setState(() {
                      _penggunaList = PenggunaController.getAllPengguna();
                    });

                    namaController.clear();
                    umurController.clear();
                    domisiliController.clear();
                    tanggalLahirController.clear();
                    selectedGender = null;
                    selectedDate = null;
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      "Register Pengguna",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            FutureBuilder<List<PenggunaModel>>(
              future: _penggunaList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text("Belum ada data");
                }

                final data = snapshot.data!;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return ListTile(
                      title: Text(
                        item.nama,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Umur: ${item.umur} Tahun\n"
                        "Domisili: ${item.domisili}\n"
                        "Jenis Kelamin: ${item.jenisKelamin}\n"
                        "Tanggal Lahir: ${item.tanggalLahir}",
                      ),
                      isThreeLine: true,
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

  void showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
