import 'package:flutter/material.dart';
import 'package:flutter_codelabs/patterns-codelab/document_app.dart';

void main() {
  // if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   setWindowMinSize(const Size(800, 500));
  // }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DocumentApp(),
    );
  }
}
