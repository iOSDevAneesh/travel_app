import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_buddy/Model/data_model.dart';

class ApiClient {
  final String baseUrl = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getInfo() async {
    var apiUrl = "/getplaces";

    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);

        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e.toString());
      return <DataModel>[];
    }
  }
}
