Future<void> safeBackEndCalls<T>(
    Future<T> apiRequest, {
      required Function(T) onSuccess,
      required Function(Object) onError,
    }) async {
  try {
    var result = await apiRequest;
    onSuccess.call(result);
  } catch (exception) {
    //todo parse api error format and map to custom errors
    onError.call(exception);
  }
}