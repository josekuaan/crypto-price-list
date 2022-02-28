import 'dart:convert';

import 'package:dex/models/response/history_response.dart';
import 'package:dex/networks/app_config.dart';
import 'package:http/http.dart' as http;

class HistoryRepository {
  Future<HistoryResponse> fetchHistory() async {
    late HistoryResponse historyResponse;
    var decodeRes;

    try {
      print(AppConfig.baseUrl);
      var url = Uri.parse(AppConfig.baseUrl);

      var response = await http.get(url);
      // print(response.body);
      if (response.statusCode == 200) {
        print(response);
        List decodeResponse = jsonDecode(response.body);
        // print("decodeResponse");
        // print(decodeResponse);

        historyResponse = HistoryResponse.fromJson({"data": decodeResponse});
      }
    } catch (e) {
      print(e);
      print("decodeResponse");
      // historyResponse = HistoryResponse(message: e.toString(), status: false);
    }

    return historyResponse;
  }
}
