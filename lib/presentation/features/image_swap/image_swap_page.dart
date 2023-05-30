import 'package:flutter/material.dart';
import '../../base_classes/base_page.dart';
import 'image_swap_page_bloc/image_swap_page_bloc.dart';


class ImageSwapPage extends BasePage{
  ImageSwapPage({Key? key}) : super(key: key);

  @override
  _ImageSwapPageState createState() => _ImageSwapPageState();

}

class _ImageSwapPageState extends
BasePageState<ImageSwapPage,ImageSwapPageBloc>{

  @override
  PreferredSizeWidget? buildAppBar(){
    return AppBar(
      backgroundColor: Colors.black,
      title: Text('Hyperboliq', style: TextStyle(color: Colors.white),),
      centerTitle: true,

    )
  }

  @override
  Widget buildView(BuildContext context){
    return BlocConsumer<ImageSwapPageBloc,ImageSwapPageState>{
      listner:(context, state){},
      buider: (context, state){
        return Container(
        child: state is,
        )

    }
    }
  }
}

