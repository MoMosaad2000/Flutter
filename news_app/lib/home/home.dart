import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    final themeState=Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar:AppBar(
        title:Text("NewsApp"),
      ),
      body: Center(
        child: SwitchListTile(
         title: Text('Theme',
         style:TextStyle(
           color: themeState.getDarkTheme ? Colors.white :Colors.black
         )),
          secondary: Icon(themeState.getDarkTheme ? Icons.dark_mode_outlined :Icons.light_mode_outlined,
          color:themeState.getDarkTheme ? Colors.white :Colors.black ,
          ),
          value: themeState.getDarkTheme,
          onChanged: (bool value){
            setState(() {
            themeState.setDarkTheme=value;
            });
          },
        ),
      ),
    );
  }
}
