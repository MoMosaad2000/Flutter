import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}


class _FavoritePageState extends State<FavoritePage> {
  Box box = Hive.box("favorites");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder<Box>(
            valueListenable: Hive.box("favorites").listenable(),
            builder: (context, box, child) {
              // List posts = List.from(box.values);

              return ListView.builder(
                  itemCount:1,
                  itemBuilder: (context, index) {
                    return
                      Container(
                        margin: EdgeInsets.all(.8),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(
                                  0xFFBFBFBF,
                                )),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xf3fdfcfc),
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
                                topRight: Radius.circular(12),
                              ),
                              child: Image.network(
                                '${box.get("image")}',
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
                                    '${box.get("title")}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${box.get('publichAt')}',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );}
              );
            }));
  }
}