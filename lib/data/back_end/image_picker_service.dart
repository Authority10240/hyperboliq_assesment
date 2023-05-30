import 'package:image_picker/image_picker.dart';

class ImageVideoPickerService{

final ImagePicker imagePicker;

ImageVideoPickerService({
  required this.imagePicker});

  Future<XFile> getFileFromLocalStorage() async{
    
      final file = await imagePicker.pickImage(source: ImageSource.gallery);
      return file ?? XFile('/Users/gra-10/StudioProjects/Hyperboliq/assets/hyperboliq_logo.jpeg');
   
  }

  Future<XFile?> getFileFromLocalCamera() async{
      final file = await imagePicker.pickImage(source: ImageSource.camera);
      return file;
  }

}