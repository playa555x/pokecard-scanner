import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_card.freezed.dart';
part 'pokemon_card.g.dart';

@freezed
class PokemonCard with _$PokemonCard {
  const factory PokemonCard({
    required String id,
    required String name,
    required String number,
    required String set,
    required String setId,
    required String rarity,
    required String imageUrl,
    required String imageUrlHiRes,
    @Default([]) List<String> types,
    PokemonCardPrices? prices,
  }) = _PokemonCard;

  factory PokemonCard.fromJson(Map<String, dynamic> json) =>
      _$PokemonCardFromJson(json);
}

@freezed
class PokemonCardPrices with _$PokemonCardPrices {
  const factory PokemonCardPrices({
    TCGPlayerPrices? tcgplayer,
    CardmarketPrices? cardmarket,
    @Default([]) List<PriceHistory> history,
  }) = _PokemonCardPrices;

  factory PokemonCardPrices.fromJson(Map<String, dynamic> json) =>
      _$PokemonCardPricesFromJson(json);
}

@freezed
class TCGPlayerPrices with _$TCGPlayerPrices {
  const factory TCGPlayerPrices({
    double? low,
    double? mid,
    double? high,
    double? market,
    double? reverseHoloMarket,
    double? holofoilMarket,
    String? updatedAt,
  }) = _TCGPlayerPrices;

  factory TCGPlayerPrices.fromJson(Map<String, dynamic> json) =>
      _$TCGPlayerPricesFromJson(json);
}

@freezed
class CardmarketPrices with _$CardmarketPrices {
  const factory CardmarketPrices({
    double? averageSellPrice,
    double? lowPrice,
    double? trendPrice,
    double? avg1,
    double? avg7,
    double? avg30,
    double? reverseHoloTrend,
    String? updatedAt,
  }) = _CardmarketPrices;

  factory CardmarketPrices.fromJson(Map<String, dynamic> json) =>
      _$CardmarketPricesFromJson(json);
}

@freezed
class PriceHistory with _$PriceHistory {
  const factory PriceHistory({
    required DateTime date,
    required double tcgMarket,
    required double cmTrend,
    double? cmAvg7,
    double? cmAvg30,
  }) = _PriceHistory;

  factory PriceHistory.fromJson(Map<String, dynamic> json) =>
      _$PriceHistoryFromJson(json);
}

// Price trend direction
enum PriceTrend { up, down, stable }

extension PriceHistoryExtension on List<PriceHistory> {
  PriceTrend get trend {
    if (length < 2) return PriceTrend.stable;
    final recent = last.tcgMarket;
    final older = first.tcgMarket;
    final pct = (recent - older) / older;
    if (pct > 0.03) return PriceTrend.up;
    if (pct < -0.03) return PriceTrend.down;
    return PriceTrend.stable;
  }

  double get trendPercent {
    if (length < 2) return 0.0;
    final recent = last.tcgMarket;
    final older = first.tcgMarket;
    return ((recent - older) / older) * 100;
  }
}
