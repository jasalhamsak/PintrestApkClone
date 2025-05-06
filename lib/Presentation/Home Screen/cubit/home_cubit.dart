import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;

import '../Resources/Models/FetchImageModel.dart';



part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()){
    FetchPhoto();
  }


  void FetchPhoto()async{
    emit(HomeLoading());
    final String url ="https://api.pexels.com/v1/curated?page=1&per_page=20";
    final response = await http.get(Uri.parse(url),
    headers: {"Authorization": "Y3pK9XNPGPLYvEe5Xk05RYoKkE3gFiNlnVe48JHz4jW0MNqNC9RQXTrg",
      "Accept": "application/json",}
    );

    if(response.statusCode == 200){
      final data = fetchImageModelFromJson(response.body);
      emit(HomeLoaded(data.photos));
      print(data);
    }else{
      emit(HomeError("error"));
    }
  }


}
