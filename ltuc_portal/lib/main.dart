import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ltuc_portal/utility/utility.dart';

/// `main()` is the entry point of the app.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

/// If the user is logged in, show the HomeScreen, otherwise show the LoginScreen
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      debugShowCheckedModeBanner: false,
      title: 'LTUC Portal',
      home: AuthService().handleAuthState(),
    );
  }
}
