import 'dart:convert';
import 'package:flutter_perpus/config/app_config.dart';
import 'package:flutter_perpus/modules/profile/src/models/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  final String baseUrl;

  ProfileService({this.baseUrl = '${AppConfig.baseUrl}/accounts'});

  Future<Profile> fetchProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      Uri.parse('$baseUrl/me'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Profile(
        email: data['email'],
        namaDepan: data['nama_depan'],
        namaBelakang: data['nama_belakang'],
        tanggalLahir: data['tanggal_lahir'],
      );
    } else {
      throw Exception('Gagal memuat profil: ${response.body}');
    }
  }
}
