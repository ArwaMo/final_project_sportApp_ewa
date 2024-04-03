import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  Map<String, dynamic> jsonData = {
    "page": 1,
    "pages": 1,
    "per_page": "50",
    "total": 1,
    "data": [
      {
        "id": "BRA",
        "iso2Code": "BR",
        "name": "Brazil",
        "region": {
          "id": "LCN",
          "iso2code": "ZJ",
          "value": "Latin America & Caribbean (all income levels)"
        },
        "adminregion": {
          "id": "LAC",
          "iso2code": "XJ",
          "value": "Latin America & Caribbean (developing only)"
        },
        "incomeLevel": {
          "id": "UMC",
          "iso2code": "XT",
          "value": "Upper middle income"
        },
        "lendingType": {
          "id": "IBD",
          "iso2code": "XF",
          "value": "IBRD"
        },
        "capitalCity": "Brasilia",
        "longitude": "-47.9292",
        "latitude": "-15.7801"
      }
    ]
  };

  // Extracting the relevant data
  int page = jsonData['page'];
  int total = jsonData['total'];
  List<dynamic> data = jsonData['data'];

  // Accessing the first item
  Map<String, dynamic> countryData = data[0];

  // Extracting specific properties
  String id = countryData['id'];
  String iso2Code = countryData['iso2Code'];
  String name = countryData['name'];
  String capitalCity = countryData['capitalCity'];
  String longitude = countryData['longitude'];
  String latitude = countryData['latitude'];

  // Printing the extracted data
  print('Page: $page');
  print('Total: $total');
  print('Country ID: $id');
  print('ISO2 Code: $iso2Code');
  print('Name: $name');
  print('Capital City: $capitalCity');
  print('Longitude: $longitude');
  print('Latitude: $latitude');
}