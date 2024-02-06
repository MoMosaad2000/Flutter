import 'package:flutter/material.dart';

import '../data/dataSourse/remote/ApiDioServices.dart';
import '../data/model/newsModel.dart';

// Assuming you have these imports for your model classes
// import 'api_dio_servises.dart';
// import 'news_response.dart';

class News extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsState();
  }
}

class NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("News App"),
      ),
      body: FutureBuilder(
        future: ApiDioServises.api.fetchNewsData('general'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            NewsResponse newsResponse = snapshot.data!;
            return Container(
              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0xFFCBC7C7), blurRadius: 72)]),
              child: ListView.builder(
                itemCount: newsResponse.articles!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                     /* String? url = newsResponse.articles![index].url;
                      if (url != null && url.isNotEmpty) {
                        _launchURL(url);
                      } else {
                        // Handle the case when the URL is not available
                        // You might show a message or take appropriate action
                        print('URL is not available for this article.');
                      }*/
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFBFBFBF)),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Color(0xf3fdfcfc), blurRadius: 15, offset: Offset(4, 4))],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                            child: Image.network(
                              '${newsResponse.articles![index].urlToImage}',
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${newsResponse.articles![index].title}',
                                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '${newsResponse.articles![index].publishedAt}',
                                  style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
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
