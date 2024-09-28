import 'package:flutter/material.dart';
import 'package:shopHub/screen/home_page.dart';


void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage (),
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.system,
      // theme: ThemeData(
      //     primarySwatch: Colors.deepPurple,
      //     fontFamily: GoogleFonts.lato().fontFamily,
      //     appBarTheme: AppBarTheme(color: Colors.white)),
      // darkTheme: ThemeData(
      //     // brightness: Brightness.dark,
      //     ),
      // initialRoute: MyRoutes.homerRoute,
      // routes: {
      //   "/": (context) => LoginPage(),
      //   MyRoutes.homerRoute: (context) => HomePage(),
      //   MyRoutes.loginRoute: (context) => LoginPage(),
      //   MyRoutes.CartRoute: (context) => CartPage(),
      // },
    );
  }
}
