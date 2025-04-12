import 'dart:io';

import 'package:expense_tracker/Expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 177, 75, 210),
);


var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 177, 75, 210),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized(); // makes sure that locking the orientation and then running the app works as intended
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation
  //       .portraitUp, // setPreferredOrientations it is of type future which demands a value that would be recieved in future it dalso demands chaining of then function which requires another function in it and we would be passing the runapp function in this to lock the orientation of the app to potrait mode
  // ]).then((fn) {
    runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
          cardTheme: CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            elevation: 10,
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
          ),
        ),

        theme: ThemeData.light().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),

          cardTheme: CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            elevation: 10,
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),

          //   textTheme: TextTheme().copyWith(
          //    titleLarge: TextStyle(fontWeight: FontWeight.bold,color:kColorScheme.onSecondaryContainer)

          //  )
        ),

        //themeMode: ThemeMode.system,// it is the default setting in every app , but we can hardcode the app theme if we want it dark or light
        debugShowCheckedModeBanner: false,
        home: Expenses(),
      ),
    );
  // });
}
