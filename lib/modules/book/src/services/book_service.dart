import 'dart:convert';

import 'package:flutter_perpus/modules/book/src/models/book_model.dart';
import 'package:http/http.dart' as http;

class BookService {
  Future<List<Book>> fetchRandomBooks() async {
    final response = await http.get(
      Uri.parse('https://api.kamu.com/books/random'),
    );
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Book.fromJson(e)).toList();
    } else {
      throw Exception('Gagal memuat buku');
    }
  }
}
