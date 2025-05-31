
import 'package:book_palacee/Models/booking_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isIncoming=true.obs;
    RxBool isPast=false.obs;
    final _db = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading:false,
        centerTitle:true,
        title:Text('Booking',style:GoogleFonts.aleo(fontWeight:FontWeight.bold)),
      ),
      body:Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: [
                Obx(() =>
                  isIncoming.value?  Card(
                      elevation:20,
                      child: Container(
                        margin:const EdgeInsets.only(right:2),
                        padding:const EdgeInsets.all(5),
                        width:Get.width/2.8,
                        height:180,
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          color:Colors.blueAccent,
                        ),
                        child:Column(
                          children: [
                            ClipRRect(
                              borderRadius:BorderRadius.circular(55),
                              child: CircleAvatar(
                                radius:55,
                                child:Image.asset('assets/Images/incoming.jpg'),
                              ),
                            ),
                            Text('INCOMING',style:GoogleFonts.aleo(fontSize:20,fontWeight:FontWeight.w800,color:Colors.white)),
                            Text('BOOKING',style:GoogleFonts.akatab(fontWeight:FontWeight.w800)),
                          ],
                        ),
                      ),
                    ) : InkWell(onTap:(){
                      isPast.value = false;
                      isIncoming.value = true;
                    },
                      child: Container(
                              margin:const EdgeInsets.only(right:2),
                              padding:const EdgeInsets.all(5),
                              width:Get.width/2.8,
                              height:180,
                              decoration:BoxDecoration(
                                borderRadius:BorderRadius.circular(10),
                                color:const Color(0xfffa5bff5ff),
                              ),
                              child:Column(
                                children: [
                                  ClipRRect(
                                    borderRadius:BorderRadius.circular(55),
                                    child: CircleAvatar(
                                      radius:55,
                                      child:Image.asset('assets/Images/incoming.jpg'),
                                    ),
                                  ),
                                  Text('INCOMING',style:GoogleFonts.aleo(fontSize:20,fontWeight:FontWeight.w800,color:Colors.blueGrey)),
                                  Text('BOOKING',style:GoogleFonts.akatab(fontWeight:FontWeight.w800)),
                                ],
                              ),
                            ),)),
                Obx(() =>
                  isPast.value? Card(
                      elevation:30,
                      child: Container(
                        margin:const EdgeInsets.only(right:2),
                        padding:const EdgeInsets.all(5),
                        width:Get.width/2.8,
                        height:180,
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          color:Colors.blueAccent,
                        ),
                        child:Column(
                          children: [
                            ClipRRect(
                              borderRadius:BorderRadius.circular(55),
                              child: CircleAvatar(
                                radius:55,
                                child:Image.asset('assets/Images/past.jpg'),
                              ),
                            ),
                            Text('PAST',style:GoogleFonts.aleo(fontSize:20,fontWeight:FontWeight.w800,color:Colors.white)),
                            Text('BOOKING',style:GoogleFonts.akatab(fontWeight:FontWeight.w800)),
                          ],
                        ),
                      ),
                    ) : InkWell(onTap:(){
                      isIncoming.value = false;
                      isPast.value = true;
                    },child: Container(
                         margin:const EdgeInsets.only(right:2),
                        padding:const EdgeInsets.all(5),
                        width:Get.width/2.8,
                        height:180,
                        decoration:BoxDecoration(
                        borderRadius:BorderRadius.circular(10),
                        color:const Color(0xfffa5bff5ff),
                        ),
                        child:Column(
                        children: [
                        ClipRRect(
                        borderRadius:BorderRadius.circular(55),
                        child: CircleAvatar(
                        radius:55,
                        child:Image.asset('assets/Images/past.jpg'),
                        ),
                        ),
                        Text('PAST',style:GoogleFonts.aleo(fontSize:20,fontWeight:FontWeight.w800,color:Colors.blueGrey)),
                        Text('BOOKING',style:GoogleFonts.akatab(fontWeight:FontWeight.w800)),
                        ],
                        ),
                        ),),),
              ],
            ),
            const SizedBox(height:20),
           Obx(() => isPast.value? Expanded(
             child: StreamBuilder(
               stream:_db.collection('Users').doc(user!.uid).collection('Booking').snapshots(),
               builder:(context, snapshot) {
                 if(snapshot.connectionState==ConnectionState.waiting){
                   return const CupertinoActivityIndicator();
                 }else if(snapshot.hasError){
                   return Text('Error : ${snapshot.hasError}');
                 }else if(!snapshot.hasData ||  snapshot.data!.docs.isEmpty){
                   return Center(child: Text('NO BOOKING AVAILABLE',style:GoogleFonts.aleo(color:Colors.redAccent,fontSize:20)));
                 }else if(snapshot.data !=null){
                   return ListView.builder(
                     shrinkWrap:true,
                     itemCount:snapshot.data!.docs.length,
                     itemBuilder:(context, index) {
                       var data = snapshot.data!.docs[index];
                       BookingModel bookingModel = BookingModel(
                         hotelDesc:data['hotelDesc'],
                         hotelAddress: data['hotelAddress'],
                         hotelName:data['hotelName'],
                         hotelImage:data['hotelImage'],
                         hotelPrice: data['hotelPrice'],
                         isBathroom: data['isBathroom'],
                         isHdtv: data['isHdtv'],
                         isKitchen: data['isKitchen'],
                         isWifi: data['isWifi'],
                         hotelId: data.id,
                         Check_in_date: data['check_in_date'],
                         Check_out_date: data['check_out_date'],
                         guest:data['guest'],
                         amount:data['payAmount'].toString(),
                       );
                       return Card(
                         child: Container(
                           padding:const EdgeInsets.all(5),
                           width:Get.width,
                           height:Get.height/6,
                           decoration:BoxDecoration(
                             borderRadius:BorderRadius.circular(10),
                             color:const Color(0xfffa5bff5ff),
                           ),
                           child:Row(
                             children: [
                               Container(
                                 width:150,
                                 height:150,
                                 decoration:BoxDecoration(
                                   borderRadius:BorderRadius.circular(10),
                                   color:Colors.blueGrey,
                                 ),
                                 child:ClipRRect(
                                     borderRadius:BorderRadius.circular(10),
                                     child:CachedNetworkImage(imageUrl:bookingModel.hotelImage,fit:BoxFit.cover,)),
                               ),
                               const SizedBox(width:10),
                               Column(
                                 crossAxisAlignment:CrossAxisAlignment.start,
                                 mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                 children: [
                                   Text('Name : ${bookingModel.hotelName}',style:GoogleFonts.aleo()),
                                   Text('Check_in_date : ${bookingModel.Check_in_date}',style:GoogleFonts.aleo()),
                                   Text('Check_out_date : ${bookingModel.Check_out_date}',style:GoogleFonts.aleo()),
                                   Row(
                                     children: [
                                       const Icon(Icons.group,color:Colors.blue,),
                                       Text(' : ${bookingModel.guest}',style:GoogleFonts.aleo()),
                                     ],
                                   ),
                                   Row(
                                     children: [
                                       const Icon(Icons.monetization_on,color:Colors.green),
                                       Text(' : ${bookingModel.amount}',style:GoogleFonts.aleo()),
                                     ],
                                   ),
                                 ],
                               )
                             ],
                           ),
                         ),
                       );
                     },
                   );
                 }
                 return const SizedBox();
               },
             ),
           ) : const SizedBox.shrink(),)
          ],
        ),
      ),
    );
  }
}
