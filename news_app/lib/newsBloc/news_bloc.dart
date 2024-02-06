import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/dataSourse/remote/ApiDioServices.dart';
import '../data/model/newsModel.dart';
import 'news_event.dart';
import 'news_state.dart';


class NewsBloc extends Bloc<NewsEvent,NewsState>{
  NewsBloc():super(loadingState())
  {
    on<FetchNews>((event, emit) {
      fetchNewsData(event.category);
    });
  }


  Future<void> fetchNewsData(String s) async {

    NewsResponse newsResponse=await ApiDioServises.api.fetchNewsData(s);
    if(newsResponse!=null){
      emit(SuccessState(newsResponse));
    }else{
      emit(ErrorState('unable to fetch'));
    }
  }
}