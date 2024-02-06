// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../page/search.dart';
// import '../theme/theme_provider.dart';
// import 'CategoryDetailsPage.dart';
// import 'RecentDetailsPage.dart';
// import 'myClasses.dart';
// import 'myLists.dart';
//
// class MyHome extends StatefulWidget {
//   const MyHome({super.key});
//
//   @override
//   State<MyHome> createState() => _MyHomeState();
// }
//
// class _MyHomeState extends State<MyHome> {
//   int _currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     final themeState=Provider.of<ThemeProvider>(context);
//     var myContext = context;
//     double screenWidth = MediaQuery.of(context).size.width;
//     double containerWidth = screenWidth - 2 * 10.0;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.teal[800],
//           title: Text(
//             'News App',
//             style: TextStyle(color: Colors.white),
//           ),
//             iconTheme: IconThemeData(color: Colors.white),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(builder: (v){return Search();
//                 }));
//               },
//               icon: Icon(Icons.search),
//               color: Colors.white,
//             ),
//
//
//           ],
//         ),
//         drawer: Drawer(
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.grey
//             ),
//             child: SwitchListTile(
//               title: Text('Theme',
//                   style:TextStyle(
//                       color: themeState.getDarkTheme ? Colors.white :Colors.black
//                   )),
//               secondary: Icon(themeState.getDarkTheme ? Icons.dark_mode_outlined :Icons.light_mode_outlined,
//                 color:themeState.getDarkTheme ? Colors.white :Colors.black ,
//               ),
//               value: themeState.getDarkTheme,
//               onChanged: (bool value){
//                 setState(() {
//                   themeState.setDarkTheme=value;
//                 });
//               },
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 10.0),
//               height: 200.0,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: myListData.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DetailsPage(
//                             myListItem: myListData[index],
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       //width: MediaQuery.of(context).size.width,
//                       width: containerWidth,
//                       margin: EdgeInsets.only(left: 10.0),
//                       padding: EdgeInsets.symmetric(horizontal: 10),
//                       decoration: BoxDecoration(
//                         color: Colors.teal[300],
//                         borderRadius: BorderRadius.circular(15.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 2,
//                             blurRadius: 5,
//                             offset: Offset(0, 3), //shadow from bottom-right
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             myListData[index].img!,
//                             height: 100.0,
//                             width: containerWidth,
//                             fit: BoxFit.fill,
//                           ),
//                           SizedBox(height: 10.0),
//                           Text(
//                             myListData[index].title!,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 25,
//                                 color: Colors.white),
//                           ),
//                           SizedBox(height: 5.0),
//                           Center(
//                             child: Text(
//                               myListData[index].subtitle!,
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 5.0),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Center(
//                   child: Text(
//                     'Categories',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 25.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10.0),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: (yourCategories.length / 2).ceil(),
//                 itemBuilder: (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: buildCategoryStack(
//                               context, yourCategories[index * 2]),
//                         ),
//                         SizedBox(width: 15.0),
//                         Expanded(
//                           child: index * 2 + 1 < yourCategories.length
//                               ? buildCategoryStack(
//                                   context, yourCategories[index * 2 + 1])
//                               : Container(),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Widget buildCategoryStack(BuildContext context, YourCategory category) {
//   return GestureDetector(
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => CategoryDetailsPage(category: category),
//         ),
//       );
//     },
//     child: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.teal.withOpacity(0.4),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
//             child: Image.asset(
//               category.img,
//               height: 150.0,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Center(
//               child: Text(
//                 category.title,
//                 style: TextStyle(
//                   color:Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16.0,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
//

//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../page/search.dart';
// import '../theme/theme_provider.dart';
// import 'CategoryDetailsPage.dart';
// import 'RecentDetailsPage.dart';
// import 'myClasses.dart';
// import 'myLists.dart';
//
// class MyHome extends StatefulWidget {
//   const MyHome({Key? key}) : super(key: key);
//
//   @override
//   State<MyHome> createState() => _MyHomeState();
// }
//
// class _MyHomeState extends State<MyHome> {
//   int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final themeState = Provider.of<ThemeProvider>(context);
//     var myContext = context;
//     double screenWidth = MediaQuery.of(context).size.width;
//     double containerWidth = screenWidth - 2 * 10.0;
//
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.teal[800],
//           title: Text(
//             'News App',
//             style: TextStyle(color: Colors.white),
//           ),
//           iconTheme: IconThemeData(color: Colors.white),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (v) {
//                     return Search();
//                   },
//                 ));
//               },
//               icon: Icon(Icons.search),
//               color: Colors.white,
//             ),
//           ],
//         ),
//         drawer: Drawer(
//           child: Container(
//             decoration: BoxDecoration(color: Colors.grey),
//             child: SwitchListTile(
//               title: Text('Theme',
//                   style: TextStyle(
//                       color: themeState.getDarkTheme ? Colors.white : Colors.black)),
//               secondary: Icon(
//                 themeState.getDarkTheme
//                     ? Icons.dark_mode_outlined
//                     : Icons.light_mode_outlined,
//                 color: themeState.getDarkTheme ? Colors.white : Colors.black,
//               ),
//               value: themeState.getDarkTheme,
//               onChanged: (bool value) {
//                 setState(() {
//                   themeState.setDarkTheme = value;
//                 });
//               },
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 10.0),
//               height: 200.0,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: myListData.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DetailsPage(
//                             myListItem: myListData[index],
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       width: containerWidth,
//                       margin: EdgeInsets.only(left: 10.0),
//                       padding: EdgeInsets.symmetric(horizontal: 10),
//                       decoration: BoxDecoration(
//                         color: Colors.teal[300],
//                         borderRadius: BorderRadius.circular(15.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 2,
//                             blurRadius: 5,
//                             offset: Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             myListData[index].img!,
//                             height: 100.0,
//                             width: containerWidth,
//                             fit: BoxFit.fill,
//                           ),
//                           SizedBox(height: 10.0),
//                           Text(
//                             myListData[index].title!,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 25,
//                                 color: Colors.white),
//                           ),
//                           SizedBox(height: 5.0),
//                           Center(
//                             child: Text(
//                               myListData[index].subtitle!,
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 5.0),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Center(
//                   child: Text(
//                     'Categories',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 25.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10.0),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: (yourCategories.length / 2).ceil(),
//                 itemBuilder: (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: buildCategoryStack(
//                               context, yourCategories[index * 2]),
//                         ),
//                         SizedBox(width: 15.0),
//                         Expanded(
//                           child: index * 2 + 1 < yourCategories.length
//                               ? buildCategoryStack(
//                               context, yourCategories[index * 2 + 1])
//                               : Container(),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite),
//               label: 'Favorite',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildCategoryStack(BuildContext context, YourCategory category) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => CategoryDetailsPage(category: category),
//           ),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.teal.withOpacity(0.4),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
//               child: Image.asset(
//                 category.img,
//                 height: 150.0,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Center(
//                 child: Text(
//                   category.title,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16.0,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../page/search.dart';
import '../theme/theme_provider.dart';
import 'CategoryDetailsPage.dart';
import 'RecentDetailsPage.dart';
import 'favorite.dart';
import 'myClasses.dart';
import 'myLists.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentIndex = 0;
  String _appBarTitle = 'News App';

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeProvider>(context);
    var myContext = context;
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth - 2 * 10.0;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            _appBarTitle,
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (v) {
                    return Search();
                  },
                ));
              },
              icon: Icon(Icons.search),
              color: Colors.white,
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(color: Colors.teal),
            child: SwitchListTile(
              title: Text('Theme',
                  style: TextStyle(
                      color: themeState.getDarkTheme
                          ? Colors.white
                          : Colors.black)),
              secondary: Icon(
                themeState.getDarkTheme
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                color: themeState.getDarkTheme ? Colors.white : Colors.black,
              ),
              value: themeState.getDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  themeState.setDarkTheme = value;
                });
              },
            ),
          ),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            // Home Page Content
            buildHomePage(containerWidth),
            // Favorite Page Content
            FavoritePage(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.teal,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                iconSize: 35.0,
                color: (_currentIndex == 0) ? Colors.white : Colors.blueGrey[700],
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                    _appBarTitle = 'News App';
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.bookmark_outlined),
                iconSize: 35.0,
                color: (_currentIndex == 1) ? Colors.white : Colors.blueGrey[700],
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                    _appBarTitle = 'Your Savings';
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHomePage(double containerWidth) {
    return Column(
      children: [
      /*  Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: myListData.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        myListItem: myListData[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: containerWidth,
                  margin: EdgeInsets.only(left: 10.0),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color(0xff5185cd),
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        myListData[index].img!,
                        height: 100.0,
                        width: containerWidth,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        myListData[index].title!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      SizedBox(height: 5.0),
                      Center(
                        child: Text(
                          myListData[index].subtitle!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),*/
        SizedBox(height: 5.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Center(
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Expanded(
          child: ListView.builder(
            itemCount: (yourCategories.length / 2).ceil(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: buildCategoryStack(
                          context, yourCategories[index * 2]),
                    ),
                    SizedBox(width: 15.0),
                    Expanded(
                      child: index * 2 + 1 < yourCategories.length
                          ? buildCategoryStack(
                              context, yourCategories[index * 2 + 1])
                          : Container(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget buildCategoryStack(BuildContext context, YourCategory category) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetailsPage(category: category),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xff62E2D3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.asset(
                category.img,
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  category.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
