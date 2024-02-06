import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../data/dataSourse/remote/ApiDioServices.dart';
import '../data/dataSourse/remote/constants.dart';
import '../data/model/newsModel.dart';
import 'myClasses.dart';

class CategoryDetailsPage extends StatefulWidget {
  final YourCategory category;

  CategoryDetailsPage({required this.category});

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  List<bool> isActiveFav = [];
  dynamic newImage = "";
  dynamic newTitle = "";
  dynamic newPublichAt = "";
  Box box = Hive.box("favorites");

  @override
  Widget build(BuildContext context) {
    var category = widget.category.title;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.teal,
          title: Center(
            child: Text(
              category,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: FutureBuilder(
          future: ApiDioServises.api.fetchNewsData('${widget.category.title}'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              NewsResponse newsResponse = snapshot.data!;
              return Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Color(0xFFCBC7C7), blurRadius: 72),
                ]),
                child: ListView.builder(
                  itemCount: newsResponse.articles!.length,
                  itemBuilder: (context, index) {
                    isActiveFav.add(false); // Initialize all items as not active

                    newImage = newsResponse.articles![index].urlToImage;
                    newTitle = newsResponse.articles![index].title;
                    newPublichAt = newsResponse.articles![index].publishedAt;

                    return InkWell(
                      onTap: () {
                        // Handle item click
                      },
                      child: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFBFBFBF)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xf3fdfcfc),
                              blurRadius: 15,
                              offset: Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              child: newsResponse.articles![index].urlToImage !=
                                  null
                                  ? Image.network(
                                '${newsResponse.articles![index].urlToImage}',
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              )
                                  : Image.network(
                                '${imageUrl_}',
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${newsResponse.articles![index].title}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${newsResponse.articles![index].publishedAt}',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      IconButton(
                                        iconSize: 30,
                                        icon: isActiveFav[index]
                                            ? Icon(Icons.bookmark_outlined)
                                            : Icon(Icons.bookmark_outline_sharp),
                                        onPressed: () {
                                          setState(() {
                                            // Toggle the active state for the tapped item
                                            isActiveFav[index] = !isActiveFav[index];

                                            if (isActiveFav[index]) {
                                              _saveData(
                                                newsResponse.articles![index]
                                                    .urlToImage,
                                                newsResponse.articles![index].title,
                                                newsResponse.articles![index]
                                                    .publishedAt,
                                              );
                                            } else {
                                              // Handle removing from favorites
                                            }
                                          });
                                        },
                                      ),
                                    ],
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
      ),
    );
  }


void _saveData(dynamic image, dynamic title, dynamic publichAt) {
    Box box = Hive.box("favorites");
    box.put("image", image);
    box.put("title", title);
    box.put("publichAt", publichAt);

    print(box.values);
  }

}
