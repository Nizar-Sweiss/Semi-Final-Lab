import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ltuc_portal/screens/screens.dart';
import 'package:ltuc_portal/utility/google_provider.dart';
import 'package:ltuc_portal/utility/utility.dart';
import 'package:provider/provider.dart';

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
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        }
        final user = snapshot.data;
        return ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: snapshot.connectionState != ConnectionState.active
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : user != null
                    ? const HomeScreen()
                    : const LoginScreen(),
          ),
        );
      },
    );
  }
}
