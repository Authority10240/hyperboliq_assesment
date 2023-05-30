import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hyperboliq/domain/usecases/base_usecase.dart';
import 'package:hyperboliq/domain/usecases/image_swap/image_swap_load_data_usecase.dart';
import 'package:hyperboliq/domain/usecases/image_swap/image_swap_select_image_usecase.dart';
import 'package:hyperboliq/presentation/base_classes/base_state.dart';
import 'package:hyperboliq/presentation/features/image_swap/image_swap_page_bloc/image_swap_page_bloc.dart';
import 'package:hyperboliq/presentation/features/image_swap/image_swap_page_bloc/image_swap_page_event.dart';
import 'package:hyperboliq/presentation/features/image_swap/image_swap_page_bloc/image_swap_page_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

void main() {

  mainBloc();
}

void mainBloc(){

  group('Testing the image swap bloc', () {
    late final fakeImageSwapPageUseCase;
    late ImageSwapPageBloc imageSwapPageBloc;
    XFile? file ;

    setUp(() {
        fakeImageSwapPageUseCase = FakeImageSwapSelectImageUseCase();
        imageSwapPageBloc =ImageSwapPageBloc(imageSwapSelectImageUseCase: fakeImageSwapPageUseCase);
         file = XFile('assets/hyperboliq_logo.jpeg');
    });
    
    blocTest('return image selected state when'
    'ImageswapSelectImageUseCase is called and an image is returned', 
    setUp: () {
    },
    build:(){
        when(fakeImageSwapPageUseCase().call())
        .thenAnswer((realInvocation) => ImageSwapPageImageState(file: file ));
        return ImageSwapPageBloc(
          imageSwapSelectImageUseCase: FakeImageSwapSelectImageUseCase(),
          imageSwaptLoadDataUseCase: FakeImageSwapLoadDataUseCase());
    },
    act: (bloc) => bloc.add(ImageSwapPageSelectImageEvent()),
    expect:()=>ImageSwapPageImageState(file: file));
    
  });

  blocTest('return data set',
  setUp: (){},
   build: (){
    when(FakeImageSwapLoadDataUseCase().call())
    .thenAnswer((realInvocation) => ImageSwapPageLoadDataState(file: file));
    return ImageSwapPageBloc(
          imageSwapSelectImageUseCase: FakeImageSwapSelectImageUseCase(),
          imageSwaptLoadDataUseCase: FakeImageSwapLoadDataUseCase());
   },
   act: (bloc) => bloc.add(ImageSwapPageLoadDataEvent()),
  expect: ()=> ImageSwapPageImageState(file: )
   ),
}



class FakeImageSwapSelectImageUseCase extends Fake implements ImageSwapSelectImageUseCase{
}

class FakeImageSwapLoadDataUseCase extends Fake implements ImageSwapLoadDataUseCase{

}