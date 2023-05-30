abstract class BaseUseCase<P extends BaseUseCaseParams, T>{
  Future<void> call({
    Function(T? model)? onSuccess,
    Function(String error)? onError,
    P? params
  });

}

abstract class BaseUseCaseParams{}