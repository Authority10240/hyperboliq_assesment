import 'package:hyperboliq/data/back_end/back_end_calls.dart';
import 'package:hyperboliq/data/sources/local/image_swap_load_data_source/image_swap_load_data_source.dart';
import 'package:hyperboliq/data/sources/local/image_swap_load_data_source/image_swap_load_data_source_impl.dart';
import 'package:hyperboliq/domain/repositories/image_swap/image_swap_load_data_repository.dart';

class ImageSwapLoadDataRepositoryimpl implements ImageSwapLoadDataRepository{
  ImageSwapLoadDataSource imageSwapLoadDataSourceimpl;

  ImageSwapLoadDataRepositoryimpl({required this.imageSwapLoadDataSourceimpl});
  @override
  Future<void> loadData(
    Function(dynamic model)? onSuccess, 
    Function(String error)? onError) async{
   await safeBackEndCalls(
    imageSwapLoadDataSourceimpl.loadData(),
     onSuccess: (success)=> onSuccess?.call(success),
      onError: (error)=> onError?.call(error.toString()));
  }
  

}