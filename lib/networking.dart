import 'dart:convert';

import 'package:http/http.dart' as http;

const baseApiURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class NetworkHelper {
  NetworkHelper();

  Future getTickerData(String currencyPair) async {
    var response = await http.get(baseApiURL + currencyPair);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
