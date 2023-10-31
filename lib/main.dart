import 'package:buckets/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // create with your config
  );
  final bucket = FirebaseStorage.instanceFor(
      bucket: 'second'); // create this bucket in your project
  await bucket.ref('test.txt').putString('hi mom!'); // succeeds
  await bucket
      .ref('test.txt')
      .getData(); // fails with 404 - except when FirebaseOptions.storageBucket is set to 'second'
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
