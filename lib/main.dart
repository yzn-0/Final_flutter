import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/movie_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xultcljpygbrvroxorjt.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh1bHRjbGpweWdicnZyb3hvcmp0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY1MzAzMjIsImV4cCI6MjA1MjEwNjMyMn0.F-iNDGfoYVqXgT2kKVBv59EZeYoWTNgqgR7r_oeXSNQ',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, 
        scaffoldBackgroundColor: Colors.white, 
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/movies': (context) => MovieListScreen(),
      },
    );
  }
}
