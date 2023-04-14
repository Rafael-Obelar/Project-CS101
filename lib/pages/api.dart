// ignore_for_file: empty_constructor_bodies

import 'dart:convert';
import 'package:http/http.dart' as http;


class CardapioApi {
  static const _baseUrl = 'http://35.175.143.13/';

  static Future<List> getPedido() async {
    final response = await http.get(Uri.parse('$_baseUrl/pedidos'));
    if (response.statusCode == 200) {
      final pedidoJson = jsonDecode(response.body);
      final pedidos = pedidoJson;
      return pedidos;
    } else {
      throw Exception('Failed to load pokemon name');
    }
  }
}

