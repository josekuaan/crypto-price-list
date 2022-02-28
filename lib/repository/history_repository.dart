import 'dart:convert';

import 'package:dex/models/response/history_response.dart';
import 'package:dex/networks/app_config.dart';
import 'package:http/http.dart' as http;

class HistoryRepository {
  Future<HistoryResponse> fetchHistory() async {
    late HistoryResponse historyResponse;

    try {
      var url = Uri.parse(AppConfig.baseUrl);

      var response = await http.get(url);

      if (response.statusCode == 200) {
        List decodeResponse = jsonDecode(response.body);

        historyResponse = HistoryResponse.fromJson({"data": decodeResponse});
      }
    } catch (e) {
      throw Error();
    }

    return historyResponse;
  }
}
