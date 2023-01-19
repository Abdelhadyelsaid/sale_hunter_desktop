import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sale_hunter/modules/Home/myStore.dart';
import 'package:sale_hunter/modules/create_Store/Create_Store.dart';
import 'package:sale_hunter/modules/settings/language.dart';
import 'package:sale_hunter/modules/sign_in/sign_in.dart';
import 'package:sale_hunter/providers/storeData.dart';
import 'package:sale_hunter/providers/userData.dart';
import 'package:sale_hunter/shared/components/MenuItems.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'modules/splash/splash.dart';
import 'package:window_size/window_size.dart';

int initScreen;
String token;
int Store_id;
bool darkMode = false;

Future<void> main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString("Authorize");
  initScreen = prefs.getInt("initScreen");
  Store_id = prefs.getInt("store_id");
  prefs.setInt("initScreen", 1);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

  if (Platform.isWindows) {
    setWindowMaxSize(const Size(1920, 1080));
    setWindowMinSize(const Size(1700, 960));
    Future.delayed(Duration(seconds: 1), () {
      setWindowFrame(
          Rect.fromCenter(center: Offset(600, 400), width: 1050, height: 750));
    });
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Language>(
      create: (context) =>
          Language(ThemeData.light().copyWith(primaryColorLight: Colors.white)),
      child: SaleHunter(),
    );
  }
}

class SaleHunter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<Language>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileData()),
        ChangeNotifierProvider(create: (_) => Storedatato()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: initScreen == 0 || initScreen == null
            ? "Splash"
            : token == null
                ? "Sign In"
                : Store_id == null
                    ? "Crate Store"
                    : "Home",
        routes: {
          "Sign In": (context) => Sign_In_Screen(),
          "Splash": (context) => Splash_screen(),
          "Home": (context) => MenuItems(),
          "Crate Store": (context) => Create_Store(),
        },
        theme: theme.getTheme(),
      ),
    );
  }
}
