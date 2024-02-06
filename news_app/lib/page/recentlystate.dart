// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/newsBloc/news_bloc.dart';
// import 'package:news_app/newsBloc/news_state.dart';
// import 'package:news_app/page/recently.dart';
//
//
//
// class News extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.brown,
//         title: Text("News App"),
//       ),
//       body: BlocBuilder<NewsBloc, News_state>(builder: (context, state) {
//         if (state is SuccessState) {
//           return ListView.builder(
//               itemCount: 12, //newsResponse.articles!.length,
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: () {
//                     /* if (await canLaunch(state.response!.news)) {
//             await launch(state.response!.news);
//             } else {
//             // Handle error, e.g., show an error message.
//             }*/
//                   },
//                   child: Container(
//                     margin: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                         border: Border.all(
//                             color: Color(
//                           0xFFBFBFBF,
//                         )),
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Color(0xf3fdfcfc),
//                               blurRadius: 15,
//                               offset: Offset(4, 4))
//                         ]),
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           ClipRRect(
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(12),
//                                 topRight: Radius.circular(12),
//                               ),
//                               child: Image.network(
//                                 '${state.response!.news}',
//                                 height: 180,
//                                 width: double.infinity,
//                                 fit: BoxFit.fill,
//                               )),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 8, horizontal: 8),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   '${newsResponse.articles![index].title}',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold),
//                                   maxLines: 3,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                                 SizedBox(
//                                   height: 4,
//                                 ),
//                                 Text(
//                                   '${newsResponse.articles![index].publishedAt}',
//                                   style: TextStyle(
//                                       color: Colors.grey,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold),
//                                   maxLines: 3,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 2,
//                           ),
//                         ]),
//                   ),
//                 );
//               });
//         }
//       }),
//     );
//   }
// /*void _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }*/
// }
