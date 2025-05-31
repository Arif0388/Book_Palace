import 'dart:convert';
import 'package:book_palacee/Wallet_Page/wallet_page.dart';
import 'package:book_palacee/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
class WalletPaymentController extends GetxController{

@override
void onInit(){
    super.onInit();
    getAmount();
}

  Map<String,dynamic>? paymentInt;
  final _stripe = Stripe.instance;
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
DateTime datetime = DateTime.now();

  Future<void> makePayment({required String amount})async{
    try{
      EasyLoading.show(
          status:'Please Wait....'
      );
      paymentInt =await createPaymentIntent(amount,'USD');
      await _stripe.initPaymentSheet(paymentSheetParameters:SetupPaymentSheetParameters(
        customFlow:true,
        merchantDisplayName:'The Coder Arif',
        paymentIntentClientSecret:paymentInt!['client_secret'],
        googlePay:const PaymentSheetGooglePay(merchantCountryCode:'IN',currencyCode:'USD',testEnv:true),
      ));
      await displayPaymentSheet(amount:amount);
      EasyLoading.dismiss();
    }catch(e){
      print('Error :${e}');
    }

  }

  createPaymentIntent(String amount,String currency)async{
    try{
      Map<String,dynamic> body = {
        'currency':currency,
        'amount':((int.parse(amount)) * 100).toString(),
        'payment_method_types[]':'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body:body,
          headers:{
            'Authorization':'Bearer $Secret_key',
            'Content-Type':'application/x-www-form-urlencoded'
          }
      );
      return jsonDecode(response.body);
    }catch(e){
      print('Error :${e}');
    }
  }

  displayPaymentSheet({required String amount})async{
    try{
      final data = await getAmount();
      isLoading.value = true;
      _stripe.presentPaymentSheet().then((value)async{
        await _stripe.confirmPaymentSheetPayment();
        await _db.collection('Users').doc(_auth.currentUser!.uid).update({
              'Wallet':(int.parse(amount)+int.parse(data)).toString(),
            });
        await _db.collection('Users').doc(_auth.currentUser!.uid).collection('PaymentHistory').doc().set({
          'amount':amount,
          'amount_date':DateFormat('dd').format(datetime),
          'amount_month':DateFormat('MMMM').format(datetime),
        });
        EasyLoading.dismiss();
        Fluttertoast.showToast(
            msg:'Payment Successful',
            backgroundColor:Colors.black,
            textColor:Colors.greenAccent,
            gravity:ToastGravity.CENTER,
            toastLength:Toast.LENGTH_LONG
        );
        isLoading.value =false;
      });
      paymentInt = null;
    }on StripeException catch(e){
      isLoading.value =false;
      Fluttertoast.showToast(
          msg:'$e',
          backgroundColor:Colors.black,
          textColor:Colors.greenAccent,
          gravity:ToastGravity.CENTER,
          toastLength:Toast.LENGTH_SHORT
      );
    }
    catch(e){
      isLoading.value =false;
      Fluttertoast.showToast(
          msg:'$e',
          backgroundColor:Colors.black,
          textColor:Colors.greenAccent,
          gravity:ToastGravity.CENTER,
          toastLength:Toast.LENGTH_SHORT
      );
    }
  }

  Future<String> getAmount()async{
    var snapshot =  await _db.collection('Users').doc(_auth.currentUser!.uid).get();
    print('Data : ${snapshot.data()!['Wallet']}');
    return snapshot.data()!['Wallet'];
  }

}