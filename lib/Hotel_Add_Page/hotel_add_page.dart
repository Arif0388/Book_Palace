
import 'package:book_palacee/Controller/authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelAddPage extends StatefulWidget {
  const HotelAddPage({super.key});

  @override
  State<HotelAddPage> createState() => _HotelAddPageState();
}

class _HotelAddPageState extends State<HotelAddPage> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blueAccent,
      body: Column(
        children: [
          const SizedBox(height:25),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Center(child: Text('Hotel Details',style:GoogleFonts.aleo(fontSize:20,color:Colors.white))),
            ],
          ),
          const SizedBox(height:30),
       Expanded(
         child: Container(
           decoration:const BoxDecoration(
             borderRadius:BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30)),
             color:Colors.white
           ),
           width:MediaQuery.of(context).size.width,
           child:SingleChildScrollView(
             child: Column(
               children: [
                 const SizedBox(height:15),
                 Container(
                   width:190,
                   height:190,
                   decoration:BoxDecoration(
                       borderRadius:BorderRadius.circular(10),
                       color:Colors.white,
                       border:const Border(
                         top:BorderSide(),
                         left:BorderSide(),
                         right:BorderSide(),
                         bottom:BorderSide(),
                       )
                   ),
                   child:const Icon(Icons.camera_alt),
                 ),
                 ListTile(
                   title:Text('Hotel Name',style:Theme.of(context).textTheme.bodyLarge),
                   subtitle:Container(
                     padding:const EdgeInsets.only(left:10),
                     width:MediaQuery.of(context).size.width,
                     height:50,
                     decoration:BoxDecoration(
                       borderRadius:BorderRadius.circular(8),
                       color:Colors.blueGrey[100],
                     ),
                     child:TextFormField(
                       style:Theme.of(context).textTheme.labelLarge,
                       decoration:InputDecoration(
                           hintText:'Enter Hotel Name',
                           border:InputBorder.none,
                           hintStyle:GoogleFonts.roboto(fontWeight:FontWeight.w800,fontSize:16)
                       ),
                     ),
                   ),
                 ),
                 ListTile(
                   title:Text('Hotel Room Charges',style:Theme.of(context).textTheme.bodyLarge),
                   subtitle:Container(
                     padding:const EdgeInsets.only(left:10),
                     width:MediaQuery.of(context).size.width,
                     height:50,
                     decoration:BoxDecoration(
                       borderRadius:BorderRadius.circular(8),
                       color:Colors.blueGrey[100],
                     ),
                     child:TextFormField(
                       style:Theme.of(context).textTheme.labelLarge,
                       decoration:InputDecoration(
                           hintText:'Enter Room Charges',
                           border:InputBorder.none,
                           hintStyle:GoogleFonts.roboto(fontWeight:FontWeight.w800,fontSize:16)
                       ),
                     ),
                   ),
                 ),
                 ListTile(
                   title:Text('Hotel Address',style:Theme.of(context).textTheme.bodyLarge),
                   subtitle:Container(
                     padding:const EdgeInsets.only(left:10),
                     width:MediaQuery.of(context).size.width,
                     height:50,
                     decoration:BoxDecoration(
                       borderRadius:BorderRadius.circular(8),
                       color:Colors.blueGrey[100],
                     ),
                     child:TextFormField(
                       style:Theme.of(context).textTheme.labelLarge,
                       decoration:InputDecoration(
                           hintText:'Enter Hotel Address',
                           border:InputBorder.none,
                           hintStyle:GoogleFonts.roboto(fontWeight:FontWeight.w800,fontSize:16)
                       ),
                     ),
                   ),
                 ),
                 Row(
                   children: [
                     Padding(
                        padding: const EdgeInsets.only(left:20,top:6),
                        child: Text('what service you want to offer?',style:GoogleFonts.aleo(fontSize:17,fontWeight:FontWeight.w600)),
                      ),
                   ],
                 ),
                 Obx(() => Row(
                  children: [
                    Checkbox(
                        value:authController.isCheck1.value,
                        onChanged:(value){
                         authController.isCheck1.value = value!;
                        }
                    ),
                    const Icon(Icons.wifi,color:Colors.blueAccent,size:25,),
                    const SizedBox(width:8),
                    Text('WiFi',style:GoogleFonts.aleo()),
                  ],
                )),
                 Obx(() => Row(
                   children: [
                     Checkbox(
                         value:authController.isCheck2.value,
                         onChanged:(value){
                           authController.isCheck2.value = value!;
                         }
                     ),
                     const Icon(Icons.tv,color:Colors.blueAccent,size:25,),
                     const SizedBox(width:8),
                     Text('HDTV',style:GoogleFonts.aleo()),
                   ],
                 )),
                 Obx(() => Row(
                   children: [
                     Checkbox(
                         value:authController.isCheck3.value,
                         onChanged:(value){
                           authController.isCheck3.value = value!;
                         }
                     ),
                     const Icon(Icons.kitchen,color:Colors.blueAccent,size:25,),
                     const SizedBox(width:8),
                     Text('Kitchen',style:GoogleFonts.aleo()),
                   ],
                 )),
                 Obx(() => Row(
                   children: [
                     Checkbox(
                         value:authController.isCheck4.value,
                         onChanged:(value){
                           authController.isCheck4.value = value!;
                         }
                     ),
                     const Icon(Icons.bathroom,color:Colors.blueAccent,size:25,),
                     const SizedBox(width:8),
                     Text('Bathroom',style:GoogleFonts.aleo()),
                   ],
                 )),
                 Row(
                   children: [
                     Text('Hotel Description',style:GoogleFonts.aleo(fontSize:18)),
                   ],
                 ),
                 Card(
                   elevation:2,
                   child: Container(
                     padding:const EdgeInsets.all(5),
                     width:MediaQuery.of(context).size.width,
                     height:200,
                     decoration:BoxDecoration(
                       borderRadius:BorderRadius.circular(15),
                       color:Colors.white,
                         border:const Border(
                           top:BorderSide(),
                           left:BorderSide(),
                           right:BorderSide(),
                           bottom:BorderSide(),
                         )
                     ),
                     child:Column(
                       children: [
                         Text('sjbsj skjffbsfjbs jsbjsf bs jsvbjsvb  jbfsj ib moisbs iophsnis oishniosbnc ioshiosbn ihfiofbsivb sidsiobs sbnoisbs  n oshnfsiobvnsoi oisbviosvbsv sibisobsi sibnoisbsoc sibsoibsoi sbcis  vif heello my namr  is arif hussain ',style:GoogleFonts.aleo())
                       ],
                     ),
                   ),
                 ),
                 Container(
                   width:200,
                   height:50,
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(15),
                  color:Colors.blueAccent,
                ),
                   child:Center(child:Text('Submit',style:GoogleFonts.aleo(fontSize:17,color:Colors.white)),),
                 ),
               ],
             ),
           ),
         ),
       ),
        ],
      ),
    );
  }
}
