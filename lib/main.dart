import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/stripe/stripe_keys.dart';
import 'package:payment/ui/home_page.dart';

void main() {
  Stripe.publishableKey=Keys.publicKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Demo',
      theme: ThemeData(
        primaryColor: Color(0xff4caf50)
      ),
      home:  MyHomePage(),
    );
  }
}



