import 'package:book_palacee/AuthPage/login_page.dart';
import 'package:book_palacee/AuthPage/sign_up_page.dart';
import 'package:book_palacee/bottom_navigation_bar/bottomnavigationbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  final _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxBool isCheck1 = false.obs;
  RxBool isCheck2 = false.obs;
  RxBool isCheck3 = false.obs;
  RxBool isCheck4 = false.obs;

  Future<void> signup(String email,String password,String name)async{
   try{
     isLoading.value=true;
     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.updateDisplayName(name);
      await userCredential.user!.reload();
       Get.to(const LoginPage());
   }catch(e){
     print('Erro :${e}');
      isLoading.value=false;
     Fluttertoast.showToast(msg:'$e',
     backgroundColor:Colors.greenAccent
     );
    }
   isLoading.value=false;
  }

  Future<void> login(String email,String password)async{
    try{
      isLoading.value=true;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.to(const Bottomnavigationbar());
    }catch(e){
      print('Erro :${e}');
      isLoading.value=false;
      Fluttertoast.showToast(msg:'$e',
          backgroundColor:Colors.greenAccent
      );
    }
    isLoading.value=false;
  }

  Future<void> signOut()async{
    await _auth.signOut();
    Get.to(const SignUpPage());
  }
}