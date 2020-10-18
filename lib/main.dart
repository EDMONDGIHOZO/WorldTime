import 'package:flutter/material.dart';
import 'package:meteo_rwanda/pages/choose_location.dart';
import 'package:meteo_rwanda/pages/home.dart';
import 'package:meteo_rwanda/pages/loading.dart';

void main () => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home': (context) =>  Home(),
      '/location': (context) => ChooseLocation(),
    },
));

