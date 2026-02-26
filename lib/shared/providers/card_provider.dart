import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../models/pokemon_card.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'http://localhost:3000', // Backend URL (change for production)
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 15),
  ));
  return dio;
});

final cardDetailProvider =
    FutureProvider.family<PokemonCard, String>((ref, cardId) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.get('/api/cards/$cardId');
  return PokemonCard.fromJson(response.data as Map<String, dynamic>);
});

final cardSearchProvider =
    FutureProvider.family<List<PokemonCard>, String>((ref, query) async {
  if (query.isEmpty) return [];
  final dio = ref.watch(dioProvider);
  final response = await dio.get('/api/cards/search', queryParameters: {'q': query});
  final list = response.data as List;
  return list.map((e) => PokemonCard.fromJson(e as Map<String, dynamic>)).toList();
});

final collectionProvider =
    FutureProvider<List<PokemonCard>>((ref) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.get('/api/collection');
  final list = response.data as List;
  return list.map((e) => PokemonCard.fromJson(e as Map<String, dynamic>)).toList();
});

final marketTrendProvider =
    FutureProvider<List<PokemonCard>>((ref) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.get('/api/market/trending');
  final list = response.data as List;
  return list.map((e) => PokemonCard.fromJson(e as Map<String, dynamic>)).toList();
});
