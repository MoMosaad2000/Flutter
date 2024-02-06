import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'newsBloc/news_bloc.dart';
import 'splash_screen.dart';
import 'theme/styles.dart';
import 'theme/theme_provider.dart';

String FAVOURITES_BOX = "favourites_box";
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Directory dir =  await getApplicationDocumentsDirectory();
  // await Hive.initFlutter(dir.path);
  // await Hive.openBox<FavoritePage>("favourites");
  // Hive.registerAdapter(NewsModel());
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // Hive.registerAdapter(ArticlesAdapter());
  //
  await Hive.initFlutter();
  await Hive.openBox('favorites');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider=ThemeProvider();

  void getCurrentTheme()async{
    themeChangeProvider.setDarkTheme= await themeChangeProvider.themePref.getTheme();
  }
  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme=false;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_){
          return themeChangeProvider;
        })
      ],
      child: Consumer<ThemeProvider>(
          builder: (context , themeProvider ,child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: Styles.themeData(themeProvider.getDarkTheme, context),
              home:BlocProvider<NewsBloc>(
                  create: (context)=>NewsBloc(),
                  child: SplashScreen()) ,
            );
          }
      ),
    );
  }
}