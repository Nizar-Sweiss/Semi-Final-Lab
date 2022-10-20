import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ltuc_portal/Screens/home_screen.dart';
import 'utility/firebase_options.dart';
import 'screens/screens.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MaterialApp(
    navigatorKey: navigatorKey,
    home: MyApp(),
  ));

//...
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Something went wrong ! "),
          );
        }
        final user = snapshot.data;
        return MaterialApp(
          routes: {
            // "SignUp": (context) => const SignUpScreen(),
            "Store": (context) => const HomeScreen()
          },
          debugShowCheckedModeBanner: false,
          home: snapshot.connectionState != ConnectionState.active
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey.shade900,
                  ),
                )
              : user != null
                  ? const HomeScreen()
                  : const LoginScreen(),
        );
      },
    );
  }
}
