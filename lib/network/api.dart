import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intermediate1/models/data.dart';
import '../models/details.dart';

class API {
  Future<Data> getData() async {
    try {
      final http.Response request = await http.get(Uri.parse(
          "https://api.spoonacular.com/recipes/complexSearch?apiKey=866fd1f4d62a4ff6a294db1ded77a9e4"));
      if (request.statusCode <= 299 && request.statusCode >= 200) {
        final Map<String, dynamic> jsonBody = jsonDecode(request.body);
        Data data = Data.fromMap(jsonBody);
        return data;
      } else {
        throw ('RequestFailure ' + request.body);
      }
    } on Exception catch (e) {
      throw ('RequestFailure ' + e.toString());
    }
  }

  Future<Details> getDetails(String id) async {
    try {
      Details().id = int.parse(id);
      final http.Response request = await http.get(Uri.parse(
          "https://api.spoonacular.com/recipes/${id}/information?apiKey=866fd1f4d62a4ff6a294db1ded77a9e4"));
      if (request.statusCode <= 299 && request.statusCode >= 200) {
        final Map<String, dynamic> jsonBody = jsonDecode(request.body);
        Details data = Details.fromMap(jsonBody);
        return data;
      } else {
        throw ('RequestFailure ' + request.body);
      }
    } on Exception catch (e) {
      throw ('RequestFailure ' + e.toString());
    }
  }
}
