// To parse this JSON data, do
//
//     final productsCategory = productsCategoryFromJson(jsonString);

import 'dart:convert';

List<String> productsCategoryFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String productsCategoryToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
