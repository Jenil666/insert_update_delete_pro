import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insert_update_delete_pro/insert_update_delete/provider/insert_update_delete_provider.dart';
import 'package:insert_update_delete_pro/insert_update_delete/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => studentdata_provider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => HomeScreen(),
        },
      ),
    ),
  );
}
