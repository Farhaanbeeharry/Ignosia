import 'dart:convert';

import 'package:Ignosia/Model/ResponseModel.dart';
import 'package:http/http.dart' as http;

class API {
  Future<ResponseModel> post(String url, var body) async {
    var apiResponse = await http.post(url, body: body);

    String stringResponse = apiResponse.body;

    Map<String, dynamic> mapJSON = jsonDecode(stringResponse);

    return ResponseModel().fromJson(mapJSON);
  }
}
