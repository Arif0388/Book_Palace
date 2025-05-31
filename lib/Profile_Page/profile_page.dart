
import 'package:book_palacee/Controller/authcontroller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String profileImage = 'https://cdn-icons-png.flaticon.com/128/17948/17948614.png';
    User? user = FirebaseAuth.instance.currentUser;
    AuthController authController = Get.put(AuthController());
    return  Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Container(),
            Text('PROFILE',style:GoogleFonts.aleo(fontSize:20,fontWeight:FontWeight.w600)),
            const SizedBox(height:30),
            ClipRRect(
              borderRadius:BorderRadius.circular(15),
              child: CircleAvatar(
               radius:70,
               child:CachedNetworkImage(imageUrl:profileImage)),
            ),
            const SizedBox(height:15),
            Card(
              elevation:2,
              child: ListTile(
                leading:const Icon(Icons.person,color:Colors.greenAccent,size:30,),
                title:Text('Name',style:GoogleFonts.aleo()),
                subtitle: Text(user!.displayName!,style:GoogleFonts.aleo(fontSize:15,fontWeight:FontWeight.w800)),
              ),
            ),
            const SizedBox(height:15),
            Card(
              elevation:2,
              child: ListTile(
                leading:const Icon(Icons.email_outlined,color:Colors.greenAccent,size:30,),
                title:Text('Email',style:GoogleFonts.aleo()),
                subtitle: Text(user.email!,style:GoogleFonts.aleo(fontSize:15,fontWeight:FontWeight.w800)),
              ),
            ),
            const SizedBox(height:15),
                InkWell(
                  onTap:()async{
                    await authController.signOut();
                  },
                  child: Card(
                    elevation:2,
                    child: ListTile(
                      leading:const Icon(Icons.logout,color:Colors.greenAccent,size:30,),
                      title:Text('LogOut',style:GoogleFonts.aleo()),
                      trailing:const Icon(Icons.forward,color:Colors.greenAccent,),
                    ),
                  ),
                ),
            const SizedBox(height:15),
            Card(
              elevation:2,
              child: ListTile(
                leading:const Icon(Icons.delete,color:Colors.greenAccent,size:30,),
               title:Text('Delete',style:GoogleFonts.aleo()),
                trailing:const Icon(Icons.forward,color:Colors.greenAccent,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
