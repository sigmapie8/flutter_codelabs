import 'package:flutter/material.dart';
import 'package:flutter_codelabs/inherited-widget-workshop/my_store_page.dart';
import 'package:flutter_codelabs/patterns-codelab/document_app.dart';
import 'package:flutter_codelabs/sliver-workshop/horizon_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // sliver-workshop
    // return const HorizonApp();
    //
    // patterns-codelab
    // return const DocumentApp();
    //
    // inherited-widget-workshop
    return const MyStorePage();
  }
}
