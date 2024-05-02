import 'package:flutter/material.dart';

import '../stripe/stripe_manager.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "Stripe Payment Gitway "

        ),
         centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                StipeManager.payment(20, "USD");
              },
                  child: Text("pay 20 \$"),
              style:ButtonStyle(
                alignment: Alignment.center
              ) ,),
            ],
          )
        ],
      ),
    );
  }
}
