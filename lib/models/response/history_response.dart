// To parse this JSON data, do
//
//     final historyResponse = historyResponseFromJson(jsonString);

import 'dart:convert';

import 'package:dex/models/base_response.dart';

HistoryResponse historyResponseFromJson(String str) =>
    HistoryResponse.fromJson(json.decode(str));

String historyResponseToJson(HistoryResponse data) =>
    json.encode(data.toJson());

class HistoryResponse extends BaseResponse {
  HistoryResponse({this.data, status, message});

  List<Datum>? data;

  factory HistoryResponse.fromJson(Map<String, dynamic> json) {
    print("==============$json");
    // print(json);
    return HistoryResponse(
      data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      status: json['errorStatus'] ?? true,
      message: json['errorMessage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        'errorStatus': status,
        'errorMessage': message,
      };
}

class Datum {
  Datum({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
  });

  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  int? marketCap;
  int? marketCapRank;
  double? fullyDilutedValuation;
  double? totalVolume;
  double? high24H;
  double? low24H;
  double? priceChange24H;
  double? priceChangePercentage24H;
  dynamic marketCapChange24H;
  double? marketCapChangePercentage24H;
  double? circulatingSupply;
  double? totalSupply;
  double? maxSupply;
  dynamic ath;
  double? athChangePercentage;
  DateTime? athDate;
  double? atl;
  double? atlChangePercentage;
  DateTime? atlDate;
  dynamic roi;
  DateTime? lastUpdated;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"] == null
            ? 0.0
            : json["current_price"].toDouble(),
        marketCap: json["market_cap"],
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation: json["fully_diluted_valuation"] == null
            ? 0.0
            : json["fully_diluted_valuation"].toDouble(),
        totalVolume: json["total_volume"] == null
            ? 0.0
            : json["total_volume"].toDouble(),
        high24H: json["high_24h"] == null ? 0.0 : json["high_24h"].toDouble(),
        low24H: json["low_24h"] == null ? 0.0 : json["low_24h"].toDouble(),
        priceChange24H: json["price_change_24h"] == null
            ? 0.0
            : json["price_change_24h"].toDouble(),
        priceChangePercentage24H: json["price_change_percentage_24h"] == null
            ? 0.0
            : json["price_change_percentage_24h"].toDouble(),
        marketCapChange24H: json["market_cap_change_24h"],
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"] == null
                ? 0.0
                : json["market_cap_change_percentage_24h"].toDouble(),
        circulatingSupply: json["circulating_supply"] == null
            ? 0.0
            : json["circulating_supply"].toDouble(),
        totalSupply: json["total_supply"] == null
            ? 0.0
            : json["total_supply"].toDouble(),
        maxSupply:
            json["max_supply"] == null ? 0.0 : json["max_supply"].toDouble(),
        ath: json["ath"],
        athChangePercentage: json["ath_change_percentage"] == null
            ? 0.0
            : json["ath_change_percentage"].toDouble(),
        athDate: DateTime.parse(json["ath_date"]),
        atl: json["atl"].toDouble(),
        atlChangePercentage: json["atl_change_percentage"] == null
            ? 0.0
            : json["atl_change_percentage"].toDouble(),
        atlDate: DateTime.parse(json["atl_date"]),
        roi: json["roi"],
        lastUpdated: DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
        "image": image,
        "current_price": currentPrice,
        "market_cap": marketCap,
        "market_cap_rank": marketCapRank,
        "fully_diluted_valuation": fullyDilutedValuation,
        "total_volume": totalVolume,
        "high_24h": high24H,
        "low_24h": low24H,
        "price_change_24h": priceChange24H,
        "price_change_percentage_24h": priceChangePercentage24H,
        "market_cap_change_24h": marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "max_supply": maxSupply,
        "ath": ath,
        "ath_change_percentage": athChangePercentage,
        "ath_date": athDate!.toIso8601String(),
        "atl": atl,
        "atl_change_percentage": atlChangePercentage,
        "atl_date": atlDate!.toIso8601String(),
        "roi": roi,
        "last_updated": lastUpdated!.toIso8601String(),
      };
}
