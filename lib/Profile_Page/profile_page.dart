
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
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
               child:Image.asset('assets/Images/1.jpg',fit:BoxFit.cover,),
                         ),
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
            Card(
              elevation:2,
              child: ListTile(
                leading:const Icon(Icons.logout,color:Colors.greenAccent,size:30,),
               title:Text('LogOut',style:GoogleFonts.aleo()),
                trailing:const Icon(Icons.forward,color:Colors.greenAccent,),
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
