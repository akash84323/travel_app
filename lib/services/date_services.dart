import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/models/data_models.dart';

class DataServices {
  String baseUrl = 'http://mark.bslmeiyu.com/api';

  Future getInfo() async {
    var apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = jsonDecode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      if (kDebugMode) {
        print('debug : $e');
      }
      return <DataModel>[];
    }
  }
}
