import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settle_loans/Screens/Client/client_data.dart';
import 'package:settle_loans/Screens/Client/services.dart';
import '/Constrains/colors.dart';
import '/Screens/splashscreen.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting();
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settle Loans',
      theme: ThemeData(
        primarySwatch: PrimaryColor(),
        scaffoldBackgroundColor: bg_Yellow,
        // useMaterial3: true,
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: Colors.yellow,
        //   // ···
        //   brightness: Brightness.light,
        // ),
        fontFamily: GoogleFonts.rubik().fontFamily,
      ),
      home: SplashScreen(),
      // home: ServicesPage(),
      // home: ClientDataScreen1(),
    );
  }
}
