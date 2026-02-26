// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonCardImpl _$$PokemonCardImplFromJson(Map<String, dynamic> json) =>
    _$PokemonCardImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      number: json['number'] as String,
      set: json['set'] as String,
      setId: json['setId'] as String,
      rarity: json['rarity'] as String,
      imageUrl: json['imageUrl'] as String,
      imageUrlHiRes: json['imageUrlHiRes'] as String,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      prices: json['prices'] == null
          ? null
          : PokemonCardPrices.fromJson(json['prices'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokemonCardImplToJson(_$PokemonCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'set': instance.set,
      'setId': instance.setId,
      'rarity': instance.rarity,
      'imageUrl': instance.imageUrl,
      'imageUrlHiRes': instance.imageUrlHiRes,
      'types': instance.types,
      'prices': instance.prices,
    };

_$PokemonCardPricesImpl _$$PokemonCardPricesImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonCardPricesImpl(
      tcgplayer: json['tcgplayer'] == null
          ? null
          : TCGPlayerPrices.fromJson(json['tcgplayer'] as Map<String, dynamic>),
      cardmarket: json['cardmarket'] == null
          ? null
          : CardmarketPrices.fromJson(
              json['cardmarket'] as Map<String, dynamic>),
      history: (json['history'] as List<dynamic>?)
              ?.map((e) => PriceHistory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PokemonCardPricesImplToJson(
        _$PokemonCardPricesImpl instance) =>
    <String, dynamic>{
      'tcgplayer': instance.tcgplayer,
      'cardmarket': instance.cardmarket,
      'history': instance.history,
    };

_$TCGPlayerPricesImpl _$$TCGPlayerPricesImplFromJson(
        Map<String, dynamic> json) =>
    _$TCGPlayerPricesImpl(
      low: (json['low'] as num?)?.toDouble(),
      mid: (json['mid'] as num?)?.toDouble(),
      high: (json['high'] as num?)?.toDouble(),
      market: (json['market'] as num?)?.toDouble(),
      reverseHoloMarket: (json['reverseHoloMarket'] as num?)?.toDouble(),
      holofoilMarket: (json['holofoilMarket'] as num?)?.toDouble(),
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$TCGPlayerPricesImplToJson(
        _$TCGPlayerPricesImpl instance) =>
    <String, dynamic>{
      'low': instance.low,
      'mid': instance.mid,
      'high': instance.high,
      'market': instance.market,
      'reverseHoloMarket': instance.reverseHoloMarket,
      'holofoilMarket': instance.holofoilMarket,
      'updatedAt': instance.updatedAt,
    };

_$CardmarketPricesImpl _$$CardmarketPricesImplFromJson(
        Map<String, dynamic> json) =>
    _$CardmarketPricesImpl(
      averageSellPrice: (json['averageSellPrice'] as num?)?.toDouble(),
      lowPrice: (json['lowPrice'] as num?)?.toDouble(),
      trendPrice: (json['trendPrice'] as num?)?.toDouble(),
      avg1: (json['avg1'] as num?)?.toDouble(),
      avg7: (json['avg7'] as num?)?.toDouble(),
      avg30: (json['avg30'] as num?)?.toDouble(),
      reverseHoloTrend: (json['reverseHoloTrend'] as num?)?.toDouble(),
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$CardmarketPricesImplToJson(
        _$CardmarketPricesImpl instance) =>
    <String, dynamic>{
      'averageSellPrice': instance.averageSellPrice,
      'lowPrice': instance.lowPrice,
      'trendPrice': instance.trendPrice,
      'avg1': instance.avg1,
      'avg7': instance.avg7,
      'avg30': instance.avg30,
      'reverseHoloTrend': instance.reverseHoloTrend,
      'updatedAt': instance.updatedAt,
    };

_$PriceHistoryImpl _$$PriceHistoryImplFromJson(Map<String, dynamic> json) =>
    _$PriceHistoryImpl(
      date: DateTime.parse(json['date'] as String),
      tcgMarket: (json['tcgMarket'] as num).toDouble(),
      cmTrend: (json['cmTrend'] as num).toDouble(),
      cmAvg7: (json['cmAvg7'] as num?)?.toDouble(),
      cmAvg30: (json['cmAvg30'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PriceHistoryImplToJson(_$PriceHistoryImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'tcgMarket': instance.tcgMarket,
      'cmTrend': instance.cmTrend,
      'cmAvg7': instance.cmAvg7,
      'cmAvg30': instance.cmAvg30,
    };
