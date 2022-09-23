import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scaner/src/pages/home_page.dart';
import 'package:qr_scaner/src/pages/mapa_page.dart';
import 'package:qr_scaner/src/providers/scan_list_provider.dart';
import 'package:qr_scaner/src/providers/ui_provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorPrimari = Colors.deepPurple;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> UiProvider()),
        ChangeNotifierProvider(create: (_)=> ScansListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'mapa': (_) => const MapaPage(),
        },
        theme: ThemeData.light().copyWith(
            primaryColor: colorPrimari,
            backgroundColor: colorPrimari ,
            appBarTheme: AppBarTheme(
                backgroundColor: colorPrimari
            ),
            navigationBarTheme:
            NavigationBarThemeData(backgroundColor: colorPrimari),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: colorPrimari)
        ),
      ),
    );
  }
}
