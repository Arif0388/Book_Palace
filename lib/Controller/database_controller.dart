import 'package:book_palacee/Controller/authcontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController{
 AuthController authController = Get.put(AuthController());
  final _db = FirebaseFirestore.instance;


  Future<void> addHotels({required TextEditingController hotelName,required TextEditingController hotelAddress,required TextEditingController hotelPrice,required TextEditingController hotelDesc})async{
   try{
     authController.isLoading.value = true;
     await _db.collection('Hotels').doc().set({
       'HotelName':hotelName.text.trim(),
       'address':hotelAddress.text.trim(),
       'image':'',
       'HotelCharges':hotelPrice.text.trim(),
       'HotelDesc':hotelDesc.text.trim(),
       'wifi':authController.isCheck1.value,
       'hdtv':authController.isCheck2.value,
       'kitchen':authController.isCheck3.value,
       'bathroom':authController.isCheck4.value
     });
     hotelName.clear();
     hotelAddress.clear();
     hotelPrice.clear();
     hotelDesc.clear();
     authController.isCheck1.value = false;
     authController.isCheck2.value = false;
     authController.isCheck3.value = false;
     authController.isCheck4.value = false;
     Fluttertoast.showToast(
         msg:'Hotel Add Successful!',
       gravity:ToastGravity.CENTER,
       backgroundColor:Colors.black
     );
   }catch(e){
     authController.isLoading.value = false;
     Fluttertoast.showToast(msg:'$e');
   }
   authController.isLoading.value = false;
  }
}