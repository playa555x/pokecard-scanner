import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../shared/models/pokemon_card.dart';

part 'scan_state.freezed.dart';

@freezed
class ScanState with _$ScanState {
  const factory ScanState.idle() = _Idle;
  const factory ScanState.scanning() = _Scanning;
  const factory ScanState.found(PokemonCard card) = _Found;
  const factory ScanState.notFound() = _NotFound;
  const factory ScanState.error(String message) = _Error;
}
