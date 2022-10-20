import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ltuc_portal/utility/utility.dart';
import 'screens/screens.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Ideal time to initialize
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges()
      //  MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   title: 'LTUC Portal',
      //   theme: theme.copyWith(
      //     colorScheme: theme.colorScheme.copyWith(
      //       primary: white,
      //     ),
      //     textTheme: defaultTextTheme,
      //   ),
      //   home: const WelcomeScreen(),
      // ),
    );
    // return StreamBuilder(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState != ConnectionState.active) {
    //       return const Center(child: CircularProgressIndicator());
    //     }
    //     final user = snapshot.data;
    //     return MaterialApp(
    //       routes: {
    //         // "SignUp": (context) => const SignUpScreen(),
    //         // "Store": (context) => const HomeScreen()
    //       },
    //       debugShowCheckedModeBanner: false,
    //       home: snapshot.connectionState != ConnectionState.active
    //           ? Center(
    //               child: CircularProgressIndicator(
    //                 backgroundColor: Colors.grey.shade900,
    //               ),
    //             )
    //           : user != null
    //               ? const LoginScreen()
    //               : const LoginScreen(),
    //     );
    //   },
    // );
  }
}
