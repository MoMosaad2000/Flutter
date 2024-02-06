import 'package:flutter/material.dart';
import 'myClasses.dart';


class DetailsPage extends StatelessWidget {
  final MyList myListItem;

  DetailsPage({Key? key, required this.myListItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF77a4ce),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Center(
              child: Text(
            'DetailsPage',
            style: TextStyle(color: Colors.white),
          )),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                myListItem.img!,
                fit: BoxFit.fill,
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        myListItem.title!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Center(
                        child: Text(
                      myListItem.subtitle!,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'my_list.dart';
//
// class DetailsPage extends StatelessWidget {
//   final MyList myListItem;
//
//   DetailsPage({Key? key, required this.myListItem}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('تفاصيل العنصر'),
//       ),
//       body: Column(
//         children: [
//           // الصورة في الجزء العلوي
//           Image.asset(
//             myListItem.img!,
//             fit: BoxFit.cover,
//             height: 200.0, // ارتفاع الصورة
//             width: MediaQuery.of(context).size.width,
//           ),
//           // الـ Column الذي سيتم التمرير أسفل الصورة
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       myListItem.title!,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25,
//                       ),
//                     ),
//                     SizedBox(height: 8.0),
//                     Text(myListItem.subtitle!,style: TextStyle(
//                       fontSize: 25,
//                     ),),
//                     // يمكنك إضافة المزيد من التفاصيل هنا حسب الحاجة
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
