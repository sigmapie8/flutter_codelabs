import 'package:flutter/material.dart';
import 'package:flutter_codelabs/patterns-codelab/data.dart';
import 'package:flutter_codelabs/patterns-codelab/document_screen.dart';

class DocumentApp extends StatelessWidget {
  const DocumentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: DocumentScreen(
        document: Document(),
      ),
    );
  }
}
