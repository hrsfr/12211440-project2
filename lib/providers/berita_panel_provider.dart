import 'dart:convert';

import 'package:flutter/material.dart';

class BeritaPanelProvider with ChangeNotifier {
  List data = [];

  Future<List> muatdata() async {
    final url =
        "http://api.mediastack.com/v1/news?access_key=fa1081ef4329af0229ea820b060fa5de";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      data = [];
    } else {
      final js = jsonDecode(response.body);
      data = js['data'];
    }
    notifyListeners();
    return data;
  }
}
