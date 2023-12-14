import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@Freezed(genericArgumentFactories: true)
class PaginationResponse<T> with _$PaginationResponse<T> {
  const factory PaginationResponse({
    int? count,
    String? next,
    String? previous,
    List<T>? results,
  }) = _PaginationResponse;

  factory PaginationResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PaginationResponseFromJson(json, fromJsonT);
}
