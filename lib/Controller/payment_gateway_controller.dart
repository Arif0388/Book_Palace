import 'dart:convert';
import 'package:book_palacee/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class PaymentController extends GetxController{

  Map<String,dynamic>? paymentInt;
  final _stripe = Stripe.instance;
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  Future<void> makePayment({required String amount,required Map<String,dynamic> userInfo,required String id,required Map<String,dynamic> hotelInfo})async{
   try{
     paymentInt =await createPaymentIntent(amount,'USD');
     await _stripe.initPaymentSheet(paymentSheetParameters:SetupPaymentSheetParameters(
           customFlow:true,
           merchantDisplayName:'The Coder Arif',
           paymentIntentClientSecret:paymentInt!['client_secret'],
           googlePay:const PaymentSheetGooglePay(merchantCountryCode:'IN',currencyCode:'USD',testEnv:true),
         ));
     await displayPaymentSheet(userInfo:userInfo, id:id, hotelInfo:hotelInfo);
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

  displayPaymentSheet({required Map<String,dynamic> userInfo ,required String id,required Map<String,dynamic> hotelInfo})async{
    try{
      isLoading.value = true;
    _stripe.presentPaymentSheet().then((value)async{
     await _stripe.confirmPaymentSheetPayment();

        EasyLoading.show(
       status:'Please Wait....'
     );

          await _db.collection('Hotels').doc(id).collection('Booking').doc().set(userInfo);
          // await _db.collection('Users').doc(_auth.currentUser!.uid).collection('Booking').doc().set(hotelInfo)  ;


         await _db.collection('Places').doc(id).collection('Booking').doc().set(userInfo);
         await _db.collection('Users').doc(_auth.currentUser!.uid).collection('Booking').doc().set(hotelInfo);

     EasyLoading.dismiss();
     Fluttertoast.showToast(
         msg:'Payment Successful',
       backgroundColor:Colors.black,
       textColor:Colors.greenAccent,
       gravity:ToastGravity.CENTER,
       toastLength:Toast.LENGTH_LONG
     );
     Fluttertoast.showToast(
         msg:'Booking Successful',
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

}