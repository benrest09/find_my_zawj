import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PenggunaModel {
  int? id;
  String nama;
  int umur;
  String domisili;
  String jenisKelamin;
  String tanggalLahir;

  PenggunaModel({
    this.id,
    required this.nama,
    required this.umur,
    required this.domisili,
    required this.jenisKelamin,
    required this.tanggalLahir,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'umur': umur,
      'domisili': domisili,
      'jenis_kelamin': jenisKelamin,
      'tanggal_lahir': tanggalLahir,
    };
  }

  factory PenggunaModel.fromMap(Map<String, dynamic> map) {
    return PenggunaModel(
      id: map['id'] != null ? map['id'] as int : null,
      nama: map['nama'] as String,
      umur: map['umur'] as int,
      domisili: map['domisili'] as String,
      jenisKelamin: map['jenis_kelamin'] as String,
      tanggalLahir: map['tanggal_lahir'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PenggunaModel.fromJson(String source) =>
      PenggunaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
