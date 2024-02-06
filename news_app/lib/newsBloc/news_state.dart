
import '../data/model/newsModel.dart';

abstract class NewsState{}
class loadingState extends NewsState{}
class SuccessState extends NewsState{
  NewsResponse?response;
  SuccessState(this.response);
}
class ErrorState extends NewsState{
  String?message;
  ErrorState(this.message);
}
/*loading
data
error
* */