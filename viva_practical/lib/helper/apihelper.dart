import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../modal/country_modal.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String countryApi = "https://restcountries.com/v3.1/all";

  Future<List<country>?> getCountry() async {
    http.Response response = await http.get(Uri.parse("$countryApi"));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      List alldata = data;

      List<country> allusers = alldata
          .map(
            (e) => country.fromJson(data: e),
          )
          .toList();
      return allusers;
    } else {
      return null;
    }
  }
}
