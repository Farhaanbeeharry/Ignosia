import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web/Model/ResponseModel.dart';

class API {
  Future<ResponseModel> post(String url, var body) async {
    var apiResponse = await http.post(url, body: body);

    String stringResponse = apiResponse.body;
    Map<String, dynamic> mapResponse = jsonDecode(stringResponse);

    return ResponseModel().cast(mapResponse);
  }
}
