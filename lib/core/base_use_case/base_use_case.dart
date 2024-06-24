import 'package:news_app_task/core/utils/api_utils/data_response.dart';

abstract interface class BaseUseCaseInterface<T,P> {
  Future<DataResponse<T>> call(P p);
}
