import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return News_state();
  }

}
class News_state extends State<News>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.brown ,
          title: Text("News App"),
        ),
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 60,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: Container(

                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(border:Border.all(color: Color(0xFFBFBFBF,)),borderRadius: BorderRadius.circular(12),),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            ClipRRect(
                                borderRadius: BorderRadius.only(topLeft:Radius.circular(12),topRight:Radius.circular(12) ,),
                                child: Image.network("https://images.pexels.com/photos/36753/flower-purple-lical-blosso.jpg?cs=srgb&dl=pexels-pixabay-36753.jpg&fm=jpg",height: 180,fit: BoxFit.fill,)),

                            Container(
                                margin: EdgeInsets.only(top: 8),
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('title of any thing title of any thing title of any thing title of any thing title of any thing title of any thing',
                                      style: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),
                                      maxLines: 3,overflow: TextOverflow.ellipsis,),SizedBox(height: 2,),
                                    Text('date 12-4-2024',style: TextStyle(color:Colors.grey,fontSize: 14,fontWeight: FontWeight.bold ),),
                                  ],
                                )),
                            SizedBox(height: 1,),

                          ]),
                    ),
                  ),
                  Expanded(
                    child:
                    Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(border:Border.all(color: Color(0xFFBFBFBF,)),borderRadius: BorderRadius.circular(12),),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            ClipRRect(
                                borderRadius: BorderRadius.only(topLeft:Radius.circular(12),topRight:Radius.circular(12) ,),
                                child: Image.network("https://images.pexels.com/photos/36753/flower-purple-lical-blosso.jpg?cs=srgb&dl=pexels-pixabay-36753.jpg&fm=jpg",height: 180,fit: BoxFit.fill,)),

                            Container(
                                margin: EdgeInsets.only(top: 8),
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('title of any thing title of any thing title of any thing title of any thing title of any thing title of any thing',
                                      style: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold ),
                                      maxLines: 3,overflow: TextOverflow.ellipsis,),SizedBox(height: 2,),
                                    Text('date 12-4-2024',style: TextStyle(color:Colors.grey,fontSize: 14,fontWeight: FontWeight.bold ),),
                                  ],
                                )),
                            SizedBox(height: 1,),

                          ]),
                    ),
                  ),

                ],
              );}
        )
    );
  }

}