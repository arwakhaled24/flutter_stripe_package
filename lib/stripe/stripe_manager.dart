import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/stripe/stripe_keys.dart';

class StipeManager{
  static payment(int mony , String currency )async {
    try{
      String clientSecret =await getClientSecret((mony*100).toString(), currency);
      await paymentSheetInitalize(clientSecret);
      await Stripe.instance.presentPaymentSheet();
    }catch(e){
      throw Exception(e).toString();
    }
  }
  static getClientSecret( String amount , String currency) async{
    Dio dio= Dio();
     var response = await dio.post("https://api.stripe.com/v1/payment_intents", options: Options(
      headers: {
        'Authorization': 'Bearer ${Keys.secretKey}',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    ),
      data: {
        'amount': amount,
        'currency': currency,
      },

    );
    return response.data["client_secret"];
    
  }
  static paymentSheetInitalize( String clientSecret) async {
     await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: clientSecret,
      merchantDisplayName: "arwa"
    ));
  }
}