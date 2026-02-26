// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonCard _$PokemonCardFromJson(Map<String, dynamic> json) {
  return _PokemonCard.fromJson(json);
}

/// @nodoc
mixin _$PokemonCard {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get set => throw _privateConstructorUsedError;
  String get setId => throw _privateConstructorUsedError;
  String get rarity => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get imageUrlHiRes => throw _privateConstructorUsedError;
  List<String> get types => throw _privateConstructorUsedError;
  PokemonCardPrices? get prices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonCardCopyWith<PokemonCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonCardCopyWith<$Res> {
  factory $PokemonCardCopyWith(
          PokemonCard value, $Res Function(PokemonCard) then) =
      _$PokemonCardCopyWithImpl<$Res, PokemonCard>;
  @useResult
  $Res call(
      {String id,
      String name,
      String number,
      String set,
      String setId,
      String rarity,
      String imageUrl,
      String imageUrlHiRes,
      List<String> types,
      PokemonCardPrices? prices});

  $PokemonCardPricesCopyWith<$Res>? get prices;
}

/// @nodoc
class _$PokemonCardCopyWithImpl<$Res, $Val extends PokemonCard>
    implements $PokemonCardCopyWith<$Res> {
  _$PokemonCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? number = null,
    Object? set = null,
    Object? setId = null,
    Object? rarity = null,
    Object? imageUrl = null,
    Object? imageUrlHiRes = null,
    Object? types = null,
    Object? prices = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      set: null == set
          ? _value.set
          : set // ignore: cast_nullable_to_non_nullable
              as String,
      setId: null == setId
          ? _value.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrlHiRes: null == imageUrlHiRes
          ? _value.imageUrlHiRes
          : imageUrlHiRes // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      prices: freezed == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as PokemonCardPrices?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PokemonCardPricesCopyWith<$Res>? get prices {
    if (_value.prices == null) {
      return null;
    }

    return $PokemonCardPricesCopyWith<$Res>(_value.prices!, (value) {
      return _then(_value.copyWith(prices: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonCardImplCopyWith<$Res>
    implements $PokemonCardCopyWith<$Res> {
  factory _$$PokemonCardImplCopyWith(
          _$PokemonCardImpl value, $Res Function(_$PokemonCardImpl) then) =
      __$$PokemonCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String number,
      String set,
      String setId,
      String rarity,
      String imageUrl,
      String imageUrlHiRes,
      List<String> types,
      PokemonCardPrices? prices});

  @override
  $PokemonCardPricesCopyWith<$Res>? get prices;
}

/// @nodoc
class __$$PokemonCardImplCopyWithImpl<$Res>
    extends _$PokemonCardCopyWithImpl<$Res, _$PokemonCardImpl>
    implements _$$PokemonCardImplCopyWith<$Res> {
  __$$PokemonCardImplCopyWithImpl(
      _$PokemonCardImpl _value, $Res Function(_$PokemonCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? number = null,
    Object? set = null,
    Object? setId = null,
    Object? rarity = null,
    Object? imageUrl = null,
    Object? imageUrlHiRes = null,
    Object? types = null,
    Object? prices = freezed,
  }) {
    return _then(_$PokemonCardImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      set: null == set
          ? _value.set
          : set // ignore: cast_nullable_to_non_nullable
              as String,
      setId: null == setId
          ? _value.setId
          : setId // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrlHiRes: null == imageUrlHiRes
          ? _value.imageUrlHiRes
          : imageUrlHiRes // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      prices: freezed == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as PokemonCardPrices?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonCardImpl implements _PokemonCard {
  const _$PokemonCardImpl(
      {required this.id,
      required this.name,
      required this.number,
      required this.set,
      required this.setId,
      required this.rarity,
      required this.imageUrl,
      required this.imageUrlHiRes,
      final List<String> types = const [],
      this.prices})
      : _types = types;

  factory _$PokemonCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonCardImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String number;
  @override
  final String set;
  @override
  final String setId;
  @override
  final String rarity;
  @override
  final String imageUrl;
  @override
  final String imageUrlHiRes;
  final List<String> _types;
  @override
  @JsonKey()
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  final PokemonCardPrices? prices;

  @override
  String toString() {
    return 'PokemonCard(id: $id, name: $name, number: $number, set: $set, setId: $setId, rarity: $rarity, imageUrl: $imageUrl, imageUrlHiRes: $imageUrlHiRes, types: $types, prices: $prices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.set, set) || other.set == set) &&
            (identical(other.setId, setId) || other.setId == setId) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.imageUrlHiRes, imageUrlHiRes) ||
                other.imageUrlHiRes == imageUrlHiRes) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.prices, prices) || other.prices == prices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      number,
      set,
      setId,
      rarity,
      imageUrl,
      imageUrlHiRes,
      const DeepCollectionEquality().hash(_types),
      prices);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonCardImplCopyWith<_$PokemonCardImpl> get copyWith =>
      __$$PokemonCardImplCopyWithImpl<_$PokemonCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonCardImplToJson(
      this,
    );
  }
}

abstract class _PokemonCard implements PokemonCard {
  const factory _PokemonCard(
      {required final String id,
      required final String name,
      required final String number,
      required final String set,
      required final String setId,
      required final String rarity,
      required final String imageUrl,
      required final String imageUrlHiRes,
      final List<String> types,
      final PokemonCardPrices? prices}) = _$PokemonCardImpl;

  factory _PokemonCard.fromJson(Map<String, dynamic> json) =
      _$PokemonCardImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get number;
  @override
  String get set;
  @override
  String get setId;
  @override
  String get rarity;
  @override
  String get imageUrl;
  @override
  String get imageUrlHiRes;
  @override
  List<String> get types;
  @override
  PokemonCardPrices? get prices;
  @override
  @JsonKey(ignore: true)
  _$$PokemonCardImplCopyWith<_$PokemonCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonCardPrices _$PokemonCardPricesFromJson(Map<String, dynamic> json) {
  return _PokemonCardPrices.fromJson(json);
}

/// @nodoc
mixin _$PokemonCardPrices {
  TCGPlayerPrices? get tcgplayer => throw _privateConstructorUsedError;
  CardmarketPrices? get cardmarket => throw _privateConstructorUsedError;
  List<PriceHistory> get history => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonCardPricesCopyWith<PokemonCardPrices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonCardPricesCopyWith<$Res> {
  factory $PokemonCardPricesCopyWith(
          PokemonCardPrices value, $Res Function(PokemonCardPrices) then) =
      _$PokemonCardPricesCopyWithImpl<$Res, PokemonCardPrices>;
  @useResult
  $Res call(
      {TCGPlayerPrices? tcgplayer,
      CardmarketPrices? cardmarket,
      List<PriceHistory> history});

  $TCGPlayerPricesCopyWith<$Res>? get tcgplayer;
  $CardmarketPricesCopyWith<$Res>? get cardmarket;
}

/// @nodoc
class _$PokemonCardPricesCopyWithImpl<$Res, $Val extends PokemonCardPrices>
    implements $PokemonCardPricesCopyWith<$Res> {
  _$PokemonCardPricesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tcgplayer = freezed,
    Object? cardmarket = freezed,
    Object? history = null,
  }) {
    return _then(_value.copyWith(
      tcgplayer: freezed == tcgplayer
          ? _value.tcgplayer
          : tcgplayer // ignore: cast_nullable_to_non_nullable
              as TCGPlayerPrices?,
      cardmarket: freezed == cardmarket
          ? _value.cardmarket
          : cardmarket // ignore: cast_nullable_to_non_nullable
              as CardmarketPrices?,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<PriceHistory>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TCGPlayerPricesCopyWith<$Res>? get tcgplayer {
    if (_value.tcgplayer == null) {
      return null;
    }

    return $TCGPlayerPricesCopyWith<$Res>(_value.tcgplayer!, (value) {
      return _then(_value.copyWith(tcgplayer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CardmarketPricesCopyWith<$Res>? get cardmarket {
    if (_value.cardmarket == null) {
      return null;
    }

    return $CardmarketPricesCopyWith<$Res>(_value.cardmarket!, (value) {
      return _then(_value.copyWith(cardmarket: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonCardPricesImplCopyWith<$Res>
    implements $PokemonCardPricesCopyWith<$Res> {
  factory _$$PokemonCardPricesImplCopyWith(_$PokemonCardPricesImpl value,
          $Res Function(_$PokemonCardPricesImpl) then) =
      __$$PokemonCardPricesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TCGPlayerPrices? tcgplayer,
      CardmarketPrices? cardmarket,
      List<PriceHistory> history});

  @override
  $TCGPlayerPricesCopyWith<$Res>? get tcgplayer;
  @override
  $CardmarketPricesCopyWith<$Res>? get cardmarket;
}

/// @nodoc
class __$$PokemonCardPricesImplCopyWithImpl<$Res>
    extends _$PokemonCardPricesCopyWithImpl<$Res, _$PokemonCardPricesImpl>
    implements _$$PokemonCardPricesImplCopyWith<$Res> {
  __$$PokemonCardPricesImplCopyWithImpl(_$PokemonCardPricesImpl _value,
      $Res Function(_$PokemonCardPricesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tcgplayer = freezed,
    Object? cardmarket = freezed,
    Object? history = null,
  }) {
    return _then(_$PokemonCardPricesImpl(
      tcgplayer: freezed == tcgplayer
          ? _value.tcgplayer
          : tcgplayer // ignore: cast_nullable_to_non_nullable
              as TCGPlayerPrices?,
      cardmarket: freezed == cardmarket
          ? _value.cardmarket
          : cardmarket // ignore: cast_nullable_to_non_nullable
              as CardmarketPrices?,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<PriceHistory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonCardPricesImpl implements _PokemonCardPrices {
  const _$PokemonCardPricesImpl(
      {this.tcgplayer,
      this.cardmarket,
      final List<PriceHistory> history = const []})
      : _history = history;

  factory _$PokemonCardPricesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonCardPricesImplFromJson(json);

  @override
  final TCGPlayerPrices? tcgplayer;
  @override
  final CardmarketPrices? cardmarket;
  final List<PriceHistory> _history;
  @override
  @JsonKey()
  List<PriceHistory> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  String toString() {
    return 'PokemonCardPrices(tcgplayer: $tcgplayer, cardmarket: $cardmarket, history: $history)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonCardPricesImpl &&
            (identical(other.tcgplayer, tcgplayer) ||
                other.tcgplayer == tcgplayer) &&
            (identical(other.cardmarket, cardmarket) ||
                other.cardmarket == cardmarket) &&
            const DeepCollectionEquality().equals(other._history, _history));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tcgplayer, cardmarket,
      const DeepCollectionEquality().hash(_history));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonCardPricesImplCopyWith<_$PokemonCardPricesImpl> get copyWith =>
      __$$PokemonCardPricesImplCopyWithImpl<_$PokemonCardPricesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonCardPricesImplToJson(
      this,
    );
  }
}

abstract class _PokemonCardPrices implements PokemonCardPrices {
  const factory _PokemonCardPrices(
      {final TCGPlayerPrices? tcgplayer,
      final CardmarketPrices? cardmarket,
      final List<PriceHistory> history}) = _$PokemonCardPricesImpl;

  factory _PokemonCardPrices.fromJson(Map<String, dynamic> json) =
      _$PokemonCardPricesImpl.fromJson;

  @override
  TCGPlayerPrices? get tcgplayer;
  @override
  CardmarketPrices? get cardmarket;
  @override
  List<PriceHistory> get history;
  @override
  @JsonKey(ignore: true)
  _$$PokemonCardPricesImplCopyWith<_$PokemonCardPricesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TCGPlayerPrices _$TCGPlayerPricesFromJson(Map<String, dynamic> json) {
  return _TCGPlayerPrices.fromJson(json);
}

/// @nodoc
mixin _$TCGPlayerPrices {
  double? get low => throw _privateConstructorUsedError;
  double? get mid => throw _privateConstructorUsedError;
  double? get high => throw _privateConstructorUsedError;
  double? get market => throw _privateConstructorUsedError;
  double? get reverseHoloMarket => throw _privateConstructorUsedError;
  double? get holofoilMarket => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TCGPlayerPricesCopyWith<TCGPlayerPrices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TCGPlayerPricesCopyWith<$Res> {
  factory $TCGPlayerPricesCopyWith(
          TCGPlayerPrices value, $Res Function(TCGPlayerPrices) then) =
      _$TCGPlayerPricesCopyWithImpl<$Res, TCGPlayerPrices>;
  @useResult
  $Res call(
      {double? low,
      double? mid,
      double? high,
      double? market,
      double? reverseHoloMarket,
      double? holofoilMarket,
      String? updatedAt});
}

/// @nodoc
class _$TCGPlayerPricesCopyWithImpl<$Res, $Val extends TCGPlayerPrices>
    implements $TCGPlayerPricesCopyWith<$Res> {
  _$TCGPlayerPricesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? low = freezed,
    Object? mid = freezed,
    Object? high = freezed,
    Object? market = freezed,
    Object? reverseHoloMarket = freezed,
    Object? holofoilMarket = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      low: freezed == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double?,
      mid: freezed == mid
          ? _value.mid
          : mid // ignore: cast_nullable_to_non_nullable
              as double?,
      high: freezed == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double?,
      market: freezed == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as double?,
      reverseHoloMarket: freezed == reverseHoloMarket
          ? _value.reverseHoloMarket
          : reverseHoloMarket // ignore: cast_nullable_to_non_nullable
              as double?,
      holofoilMarket: freezed == holofoilMarket
          ? _value.holofoilMarket
          : holofoilMarket // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TCGPlayerPricesImplCopyWith<$Res>
    implements $TCGPlayerPricesCopyWith<$Res> {
  factory _$$TCGPlayerPricesImplCopyWith(_$TCGPlayerPricesImpl value,
          $Res Function(_$TCGPlayerPricesImpl) then) =
      __$$TCGPlayerPricesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? low,
      double? mid,
      double? high,
      double? market,
      double? reverseHoloMarket,
      double? holofoilMarket,
      String? updatedAt});
}

/// @nodoc
class __$$TCGPlayerPricesImplCopyWithImpl<$Res>
    extends _$TCGPlayerPricesCopyWithImpl<$Res, _$TCGPlayerPricesImpl>
    implements _$$TCGPlayerPricesImplCopyWith<$Res> {
  __$$TCGPlayerPricesImplCopyWithImpl(
      _$TCGPlayerPricesImpl _value, $Res Function(_$TCGPlayerPricesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? low = freezed,
    Object? mid = freezed,
    Object? high = freezed,
    Object? market = freezed,
    Object? reverseHoloMarket = freezed,
    Object? holofoilMarket = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TCGPlayerPricesImpl(
      low: freezed == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double?,
      mid: freezed == mid
          ? _value.mid
          : mid // ignore: cast_nullable_to_non_nullable
              as double?,
      high: freezed == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double?,
      market: freezed == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as double?,
      reverseHoloMarket: freezed == reverseHoloMarket
          ? _value.reverseHoloMarket
          : reverseHoloMarket // ignore: cast_nullable_to_non_nullable
              as double?,
      holofoilMarket: freezed == holofoilMarket
          ? _value.holofoilMarket
          : holofoilMarket // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TCGPlayerPricesImpl implements _TCGPlayerPrices {
  const _$TCGPlayerPricesImpl(
      {this.low,
      this.mid,
      this.high,
      this.market,
      this.reverseHoloMarket,
      this.holofoilMarket,
      this.updatedAt});

  factory _$TCGPlayerPricesImpl.fromJson(Map<String, dynamic> json) =>
      _$$TCGPlayerPricesImplFromJson(json);

  @override
  final double? low;
  @override
  final double? mid;
  @override
  final double? high;
  @override
  final double? market;
  @override
  final double? reverseHoloMarket;
  @override
  final double? holofoilMarket;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'TCGPlayerPrices(low: $low, mid: $mid, high: $high, market: $market, reverseHoloMarket: $reverseHoloMarket, holofoilMarket: $holofoilMarket, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TCGPlayerPricesImpl &&
            (identical(other.low, low) || other.low == low) &&
            (identical(other.mid, mid) || other.mid == mid) &&
            (identical(other.high, high) || other.high == high) &&
            (identical(other.market, market) || other.market == market) &&
            (identical(other.reverseHoloMarket, reverseHoloMarket) ||
                other.reverseHoloMarket == reverseHoloMarket) &&
            (identical(other.holofoilMarket, holofoilMarket) ||
                other.holofoilMarket == holofoilMarket) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, low, mid, high, market,
      reverseHoloMarket, holofoilMarket, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TCGPlayerPricesImplCopyWith<_$TCGPlayerPricesImpl> get copyWith =>
      __$$TCGPlayerPricesImplCopyWithImpl<_$TCGPlayerPricesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TCGPlayerPricesImplToJson(
      this,
    );
  }
}

abstract class _TCGPlayerPrices implements TCGPlayerPrices {
  const factory _TCGPlayerPrices(
      {final double? low,
      final double? mid,
      final double? high,
      final double? market,
      final double? reverseHoloMarket,
      final double? holofoilMarket,
      final String? updatedAt}) = _$TCGPlayerPricesImpl;

  factory _TCGPlayerPrices.fromJson(Map<String, dynamic> json) =
      _$TCGPlayerPricesImpl.fromJson;

  @override
  double? get low;
  @override
  double? get mid;
  @override
  double? get high;
  @override
  double? get market;
  @override
  double? get reverseHoloMarket;
  @override
  double? get holofoilMarket;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$TCGPlayerPricesImplCopyWith<_$TCGPlayerPricesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CardmarketPrices _$CardmarketPricesFromJson(Map<String, dynamic> json) {
  return _CardmarketPrices.fromJson(json);
}

/// @nodoc
mixin _$CardmarketPrices {
  double? get averageSellPrice => throw _privateConstructorUsedError;
  double? get lowPrice => throw _privateConstructorUsedError;
  double? get trendPrice => throw _privateConstructorUsedError;
  double? get avg1 => throw _privateConstructorUsedError;
  double? get avg7 => throw _privateConstructorUsedError;
  double? get avg30 => throw _privateConstructorUsedError;
  double? get reverseHoloTrend => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardmarketPricesCopyWith<CardmarketPrices> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardmarketPricesCopyWith<$Res> {
  factory $CardmarketPricesCopyWith(
          CardmarketPrices value, $Res Function(CardmarketPrices) then) =
      _$CardmarketPricesCopyWithImpl<$Res, CardmarketPrices>;
  @useResult
  $Res call(
      {double? averageSellPrice,
      double? lowPrice,
      double? trendPrice,
      double? avg1,
      double? avg7,
      double? avg30,
      double? reverseHoloTrend,
      String? updatedAt});
}

/// @nodoc
class _$CardmarketPricesCopyWithImpl<$Res, $Val extends CardmarketPrices>
    implements $CardmarketPricesCopyWith<$Res> {
  _$CardmarketPricesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageSellPrice = freezed,
    Object? lowPrice = freezed,
    Object? trendPrice = freezed,
    Object? avg1 = freezed,
    Object? avg7 = freezed,
    Object? avg30 = freezed,
    Object? reverseHoloTrend = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      averageSellPrice: freezed == averageSellPrice
          ? _value.averageSellPrice
          : averageSellPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      lowPrice: freezed == lowPrice
          ? _value.lowPrice
          : lowPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      trendPrice: freezed == trendPrice
          ? _value.trendPrice
          : trendPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      avg1: freezed == avg1
          ? _value.avg1
          : avg1 // ignore: cast_nullable_to_non_nullable
              as double?,
      avg7: freezed == avg7
          ? _value.avg7
          : avg7 // ignore: cast_nullable_to_non_nullable
              as double?,
      avg30: freezed == avg30
          ? _value.avg30
          : avg30 // ignore: cast_nullable_to_non_nullable
              as double?,
      reverseHoloTrend: freezed == reverseHoloTrend
          ? _value.reverseHoloTrend
          : reverseHoloTrend // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardmarketPricesImplCopyWith<$Res>
    implements $CardmarketPricesCopyWith<$Res> {
  factory _$$CardmarketPricesImplCopyWith(_$CardmarketPricesImpl value,
          $Res Function(_$CardmarketPricesImpl) then) =
      __$$CardmarketPricesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? averageSellPrice,
      double? lowPrice,
      double? trendPrice,
      double? avg1,
      double? avg7,
      double? avg30,
      double? reverseHoloTrend,
      String? updatedAt});
}

/// @nodoc
class __$$CardmarketPricesImplCopyWithImpl<$Res>
    extends _$CardmarketPricesCopyWithImpl<$Res, _$CardmarketPricesImpl>
    implements _$$CardmarketPricesImplCopyWith<$Res> {
  __$$CardmarketPricesImplCopyWithImpl(_$CardmarketPricesImpl _value,
      $Res Function(_$CardmarketPricesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageSellPrice = freezed,
    Object? lowPrice = freezed,
    Object? trendPrice = freezed,
    Object? avg1 = freezed,
    Object? avg7 = freezed,
    Object? avg30 = freezed,
    Object? reverseHoloTrend = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CardmarketPricesImpl(
      averageSellPrice: freezed == averageSellPrice
          ? _value.averageSellPrice
          : averageSellPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      lowPrice: freezed == lowPrice
          ? _value.lowPrice
          : lowPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      trendPrice: freezed == trendPrice
          ? _value.trendPrice
          : trendPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      avg1: freezed == avg1
          ? _value.avg1
          : avg1 // ignore: cast_nullable_to_non_nullable
              as double?,
      avg7: freezed == avg7
          ? _value.avg7
          : avg7 // ignore: cast_nullable_to_non_nullable
              as double?,
      avg30: freezed == avg30
          ? _value.avg30
          : avg30 // ignore: cast_nullable_to_non_nullable
              as double?,
      reverseHoloTrend: freezed == reverseHoloTrend
          ? _value.reverseHoloTrend
          : reverseHoloTrend // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardmarketPricesImpl implements _CardmarketPrices {
  const _$CardmarketPricesImpl(
      {this.averageSellPrice,
      this.lowPrice,
      this.trendPrice,
      this.avg1,
      this.avg7,
      this.avg30,
      this.reverseHoloTrend,
      this.updatedAt});

  factory _$CardmarketPricesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardmarketPricesImplFromJson(json);

  @override
  final double? averageSellPrice;
  @override
  final double? lowPrice;
  @override
  final double? trendPrice;
  @override
  final double? avg1;
  @override
  final double? avg7;
  @override
  final double? avg30;
  @override
  final double? reverseHoloTrend;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'CardmarketPrices(averageSellPrice: $averageSellPrice, lowPrice: $lowPrice, trendPrice: $trendPrice, avg1: $avg1, avg7: $avg7, avg30: $avg30, reverseHoloTrend: $reverseHoloTrend, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardmarketPricesImpl &&
            (identical(other.averageSellPrice, averageSellPrice) ||
                other.averageSellPrice == averageSellPrice) &&
            (identical(other.lowPrice, lowPrice) ||
                other.lowPrice == lowPrice) &&
            (identical(other.trendPrice, trendPrice) ||
                other.trendPrice == trendPrice) &&
            (identical(other.avg1, avg1) || other.avg1 == avg1) &&
            (identical(other.avg7, avg7) || other.avg7 == avg7) &&
            (identical(other.avg30, avg30) || other.avg30 == avg30) &&
            (identical(other.reverseHoloTrend, reverseHoloTrend) ||
                other.reverseHoloTrend == reverseHoloTrend) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, averageSellPrice, lowPrice,
      trendPrice, avg1, avg7, avg30, reverseHoloTrend, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardmarketPricesImplCopyWith<_$CardmarketPricesImpl> get copyWith =>
      __$$CardmarketPricesImplCopyWithImpl<_$CardmarketPricesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardmarketPricesImplToJson(
      this,
    );
  }
}

abstract class _CardmarketPrices implements CardmarketPrices {
  const factory _CardmarketPrices(
      {final double? averageSellPrice,
      final double? lowPrice,
      final double? trendPrice,
      final double? avg1,
      final double? avg7,
      final double? avg30,
      final double? reverseHoloTrend,
      final String? updatedAt}) = _$CardmarketPricesImpl;

  factory _CardmarketPrices.fromJson(Map<String, dynamic> json) =
      _$CardmarketPricesImpl.fromJson;

  @override
  double? get averageSellPrice;
  @override
  double? get lowPrice;
  @override
  double? get trendPrice;
  @override
  double? get avg1;
  @override
  double? get avg7;
  @override
  double? get avg30;
  @override
  double? get reverseHoloTrend;
  @override
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CardmarketPricesImplCopyWith<_$CardmarketPricesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceHistory _$PriceHistoryFromJson(Map<String, dynamic> json) {
  return _PriceHistory.fromJson(json);
}

/// @nodoc
mixin _$PriceHistory {
  DateTime get date => throw _privateConstructorUsedError;
  double get tcgMarket => throw _privateConstructorUsedError;
  double get cmTrend => throw _privateConstructorUsedError;
  double? get cmAvg7 => throw _privateConstructorUsedError;
  double? get cmAvg30 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceHistoryCopyWith<PriceHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceHistoryCopyWith<$Res> {
  factory $PriceHistoryCopyWith(
          PriceHistory value, $Res Function(PriceHistory) then) =
      _$PriceHistoryCopyWithImpl<$Res, PriceHistory>;
  @useResult
  $Res call(
      {DateTime date,
      double tcgMarket,
      double cmTrend,
      double? cmAvg7,
      double? cmAvg30});
}

/// @nodoc
class _$PriceHistoryCopyWithImpl<$Res, $Val extends PriceHistory>
    implements $PriceHistoryCopyWith<$Res> {
  _$PriceHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? tcgMarket = null,
    Object? cmTrend = null,
    Object? cmAvg7 = freezed,
    Object? cmAvg30 = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tcgMarket: null == tcgMarket
          ? _value.tcgMarket
          : tcgMarket // ignore: cast_nullable_to_non_nullable
              as double,
      cmTrend: null == cmTrend
          ? _value.cmTrend
          : cmTrend // ignore: cast_nullable_to_non_nullable
              as double,
      cmAvg7: freezed == cmAvg7
          ? _value.cmAvg7
          : cmAvg7 // ignore: cast_nullable_to_non_nullable
              as double?,
      cmAvg30: freezed == cmAvg30
          ? _value.cmAvg30
          : cmAvg30 // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceHistoryImplCopyWith<$Res>
    implements $PriceHistoryCopyWith<$Res> {
  factory _$$PriceHistoryImplCopyWith(
          _$PriceHistoryImpl value, $Res Function(_$PriceHistoryImpl) then) =
      __$$PriceHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      double tcgMarket,
      double cmTrend,
      double? cmAvg7,
      double? cmAvg30});
}

/// @nodoc
class __$$PriceHistoryImplCopyWithImpl<$Res>
    extends _$PriceHistoryCopyWithImpl<$Res, _$PriceHistoryImpl>
    implements _$$PriceHistoryImplCopyWith<$Res> {
  __$$PriceHistoryImplCopyWithImpl(
      _$PriceHistoryImpl _value, $Res Function(_$PriceHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? tcgMarket = null,
    Object? cmTrend = null,
    Object? cmAvg7 = freezed,
    Object? cmAvg30 = freezed,
  }) {
    return _then(_$PriceHistoryImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tcgMarket: null == tcgMarket
          ? _value.tcgMarket
          : tcgMarket // ignore: cast_nullable_to_non_nullable
              as double,
      cmTrend: null == cmTrend
          ? _value.cmTrend
          : cmTrend // ignore: cast_nullable_to_non_nullable
              as double,
      cmAvg7: freezed == cmAvg7
          ? _value.cmAvg7
          : cmAvg7 // ignore: cast_nullable_to_non_nullable
              as double?,
      cmAvg30: freezed == cmAvg30
          ? _value.cmAvg30
          : cmAvg30 // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceHistoryImpl implements _PriceHistory {
  const _$PriceHistoryImpl(
      {required this.date,
      required this.tcgMarket,
      required this.cmTrend,
      this.cmAvg7,
      this.cmAvg30});

  factory _$PriceHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceHistoryImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double tcgMarket;
  @override
  final double cmTrend;
  @override
  final double? cmAvg7;
  @override
  final double? cmAvg30;

  @override
  String toString() {
    return 'PriceHistory(date: $date, tcgMarket: $tcgMarket, cmTrend: $cmTrend, cmAvg7: $cmAvg7, cmAvg30: $cmAvg30)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceHistoryImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.tcgMarket, tcgMarket) ||
                other.tcgMarket == tcgMarket) &&
            (identical(other.cmTrend, cmTrend) || other.cmTrend == cmTrend) &&
            (identical(other.cmAvg7, cmAvg7) || other.cmAvg7 == cmAvg7) &&
            (identical(other.cmAvg30, cmAvg30) || other.cmAvg30 == cmAvg30));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, tcgMarket, cmTrend, cmAvg7, cmAvg30);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceHistoryImplCopyWith<_$PriceHistoryImpl> get copyWith =>
      __$$PriceHistoryImplCopyWithImpl<_$PriceHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceHistoryImplToJson(
      this,
    );
  }
}

abstract class _PriceHistory implements PriceHistory {
  const factory _PriceHistory(
      {required final DateTime date,
      required final double tcgMarket,
      required final double cmTrend,
      final double? cmAvg7,
      final double? cmAvg30}) = _$PriceHistoryImpl;

  factory _PriceHistory.fromJson(Map<String, dynamic> json) =
      _$PriceHistoryImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get tcgMarket;
  @override
  double get cmTrend;
  @override
  double? get cmAvg7;
  @override
  double? get cmAvg30;
  @override
  @JsonKey(ignore: true)
  _$$PriceHistoryImplCopyWith<_$PriceHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
