import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyperboliq/core/constants.dart';
import 'package:hyperboliq/core/locator.dart';
import 'package:hyperboliq/generated/l10n.dart';
import 'package:hyperboliq/presentation/base_classes/base_state.dart';
import 'package:hyperboliq/presentation/features/image_swap/image_swap_page_bloc/image_swap_page_event.dart';
import 'package:hyperboliq/presentation/features/image_swap/image_swap_page_bloc/image_swap_page_state.dart';
import 'package:hyperboliq/presentation/features/image_swap/widgets/image_view.dart';
import 'package:image_picker/image_picker.dart';
import '../../base_classes/base_page.dart';
import 'image_swap_page_bloc/image_swap_page_bloc.dart';
import 'package:image/image.dart' as img;


class ImageSwapPage extends BasePage{
  const ImageSwapPage({Key? key}) : super(key: key);

  static MaterialPageRoute<dynamic> route(){
    return MaterialPageRoute(
      builder: (_) => const ImageSwapPage(),
      settings: const RouteSettings(name: PageNames.imageSwapPage),
    );
  }


  @override
  _ImageSwapPageState createState() => _ImageSwapPageState();

}

class _ImageSwapPageState extends
BasePageState<ImageSwapPage,ImageSwapPageBloc>{

  @override
  PreferredSizeWidget? buildAppBar(){
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text('Hyperboliq', style: TextStyle(color: Colors.white),),
      centerTitle: true,

    );
  }

  @override
  Widget buildView(BuildContext context){
    return BlocConsumer<ImageSwapPageBloc,ImageSwapPageState>(
builder: (context, state){
  return SingleChildScrollView(
    child: Column(
      children: [
        if (state is ImageSwapPageImageSuccessState)
          ImageView(imagePath: state.file?.path.toString()??ImageAssets.hyperboliqLogo),

        if (state is ImageSwapPageImageFailureState)
            Container(
              padding: const EdgeInsets.all(20),
              width: 500,
              height: 500,
              child: const Center(child: Text('Error loading image'),)
          ),

          if (state is ImageSwapPageImageLoadingState)
                     Container(
              padding: const EdgeInsets.all(20),
              width: 500,
              height: 500,
              child: const Center(
                child: CircularProgressIndicator(color: Colors.black,),),),


          if(state is ImageSwapPageLoadDataState)
            if(state.dataState == DataState.loading)
            Container(
              padding: const EdgeInsets.all(20),
              width: 500,
              height: 500,
              child: const Center(
                child: CircularProgressIndicator(color: Colors.black,),),),

          if(state is ImageSwapPageLoadDataState)
            if(state.dataState == DataState.success)
             
            Container(
              padding: const EdgeInsets.all(20),
              width: 500,
              height: 500,
              child:  Center(
                child:  
                 Image.memory(
                        Uint8List.fromList(img.encodePng(state.image)),
                     ),),),

          if(state is ImageSwapPageLoadDataFailedState)
              Container(
              padding: const EdgeInsets.all(20),
              width: 500,
              height: 500,
              child: const Center(child: Text('Error loading split image'),)
          ),

              
          
          if(state is ImageSwapPageLoadDataInitState)
            Container(
              padding: const EdgeInsets.all(20),
              width: 500,
              height: 500,
              child: const Center(child:Text('Click button below to load image'),
          ),
            )
          
      ],
    ),
  );} ,
listener: (context, state){}
    
    );
  }
  
  @override
  ImageSwapPageBloc initBloc() {
    return locator<ImageSwapPageBloc>();
  }

  @override
  Widget? floatingActionButton() {
    return BlocConsumer<ImageSwapPageBloc,ImageSwapPageState>(
      builder:(context, state){
        
        return GestureDetector(
          child: Card(
      color: Colors.black,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: 11,
      child:  SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width -50,
        child: Center(
          child :
        Text(AppLocalizations.of(context).clickToUploadPicture, style: const TextStyle(color: Colors.white),),),)
    
    ),
    onTap: (){
      if(state is ImageSwapPageImageSuccessState){
          getBloc().add(ImageSwapPageSwapImageEvent( imageFile: state.file));
        }else
        {
          getBloc().add(ImageSwapPageSelectImageEvent());
        }
        
    },
        );

    }, listener: (context, state){}); 
  }
  

}

