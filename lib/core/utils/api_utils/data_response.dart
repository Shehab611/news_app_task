import 'package:equatable/equatable.dart';

final class Response<T> extends Equatable {
  final String? error;
  final T? data;

  const Response({this.error, this.data});

  const Response.withError(String this.error) : data = null;

  const Response.withSuccess(T this.data) : error = null;

  @override
  List<Object?> get props => [error, data];
}
