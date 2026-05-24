import 'dart:convert';

import 'package:http/http.dart'
as http;

import '../models/equipment.dart';

class EquipmentService {

  static const baseUrl =
      'http://10.0.2.2:3000';

  static Future<List<Equipment>>
  getEquipments() async {

    final response =
    await http.get(

      Uri.parse(
          '$baseUrl/equipments'
      ),
    );

    final data =
    jsonDecode(response.body);

    return List<Equipment>.from(

      data.map(
            (item) =>
            Equipment.fromJson(item),
      ),
    );
  }
}