abstract class ImageSwapLoadDataRepository {

  Future<void> loadData(
    Function(dynamic model)? onSuccess,
    Function(String error)? onError
  );
}