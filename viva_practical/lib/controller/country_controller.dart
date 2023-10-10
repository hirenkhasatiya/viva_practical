import 'package:flutter/material.dart';

import '../helper/apihelper.dart';
import '../modal/country_modal.dart';

class countryController extends ChangeNotifier {
  List<country> allcountry = [];

  countryController() {
    getUser();
  }

  getUser() async {
    allcountry = await ApiHelper.apiHelper.getCountry() ?? [];

    notifyListeners();
  }
}
