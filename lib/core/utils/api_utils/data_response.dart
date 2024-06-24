import 'package:equatable/equatable.dart';

final class DataResponse<T> extends Equatable {
  final String? error;
  final T? data;

  const DataResponse({this.error, this.data});

  const DataResponse.withError(String this.error) : data = null;

  const DataResponse.withSuccess(T this.data) : error = null;

  @override
  List<Object?> get props => [error, data];
}
