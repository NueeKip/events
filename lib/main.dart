import 'package:events/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/signIn.dart';
import 'auth/signUp.dart';
import 'firebase_options.dart';

void main() async {
  initFirebase();
  runApp(MyApp());
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignUp(),
        routes: <String, WidgetBuilder>{
          Home.id: (BuildContext context) => Home(),
          Welcome.id: (BuildContext context) => Welcome(),
          SignIn.id: (BuildContext context) => SignIn(),
          SignUp.id: (BuildContext context) => SignUp(),
        });
  }
}

class Welcome extends StatefulWidget {
  static String id = 'Welcome';

  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
