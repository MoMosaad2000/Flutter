import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/dataSourse/remote/ApiDioServices.dart';
import '../data/dataSourse/remote/constants.dart';
import '../data/model/newsModel.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Search_State();
  }
}

class Search_State extends State<Search> {
  late TextEditingController _titleEditingController;
  late String data = "n";

  @override
  void initState() {
    super.initState();
    _titleEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _titleEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<NewsResponse>(
        future: ApiDioServises.api.SearchData(data),
        builder: (context, AsyncSnapshot<NewsResponse> snapshot) {
          if (snapshot.hasData) {
            NewsResponse? searchData = snapshot.data;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _titleEditingController,
                    validator: (value) =>
                    value?.isEmpty ?? true ? "This field is required" : null,
                    decoration: InputDecoration(
                      labelText: "Search",
                      focusColor: Color(0xfff6c797),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff532602)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        data = value;
                      });
                      print(data);
                    },
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: ListView.builder(
                    itemCount: searchData!.articles!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFBFBFBF)),
                          borderRadius: BorderRadius.circular(12),
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
                              child: searchData.articles![index].urlToImage != null
                                  ? Image.network(
                                "${searchData.articles![index].urlToImage}",
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              )
                                  : Image.network(
                                "${imageUrl_}",
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${searchData.articles![index].title}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    '${searchData.articles![index].publishedAt}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 1),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
