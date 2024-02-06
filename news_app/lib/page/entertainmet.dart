import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/dataSourse/remote/ApiDioServices.dart';
import '../data/dataSourse/remote/constants.dart';
import '../data/model/newsModel.dart';
import '../newsBloc/news_bloc.dart';
import '../newsBloc/news_event.dart';
import '../newsBloc/news_state.dart';

class News_entertainment extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return News_entertainment_state();
  }
}
class News_entertainment_state extends State<News_entertainment>{

  @override
  Widget build(BuildContext context) {
    var s = context.read<NewsBloc>().add(FetchNews('Entertainment'));

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.brown ,
        title: Text("News App"),
      ),
      body:
      BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is SuccessState) {
              return /*Text('${state.response?.articles![0].title}');
}
else{
  return Text('enable to fetch data');
}
        }));}}*/
                ListView.builder(
                    itemCount:state.response?.articles?.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          /* if (await canLaunch(state.response!.news)) {
            await launch(state.response!.news);
            } else {
            // Handle error, e.g., show an error message.
            }*/
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFBFBFBF,)),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [BoxShadow(color: Color(0xf3fdfcfc),
                                  blurRadius: 15,
                                  offset: Offset(4, 4))
                              ]),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),),
                                    child: Image.network(
                                      '${state.response?.articles![0].urlToImage}', height: 180,
                                      width: double.infinity,
                                      fit: BoxFit.fill,)),


                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text('${state.response?.articles![index].title}',
                                        style: TextStyle(color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,),
                                      SizedBox(height: 4,),
                                      Text('${state.response?.articles![index].publishedAt}', style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 2,),

                              ]),
                        ),
                      );
                    }
                );
            }
            if(state is loadingState){
              return Center(child: CircularProgressIndicator());
            }
            else{
              return Text('error to fetch data');
            }
          }),


    );
  }
/*void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }*/




}