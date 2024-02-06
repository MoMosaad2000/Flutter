import '../data/dataSourse/local/category.dart';

abstract class NewsEvent{}
class FetchNews extends NewsEvent{
  String category=categories[0];
  FetchNews(this.category);
}
/*  abstaract class NewsEvent{}
class fetchdata etxends NewsEvent{
}

 */


