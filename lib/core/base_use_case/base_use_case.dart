import 'package:dio/dio.dart';

abstract interface class BaseUseCaseInterface<T,P> {
  Future<Response<T>> call({P? p});
}
