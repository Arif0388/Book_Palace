
import 'package:book_palacee/Details_Page/details_page.dart';
import 'package:book_palacee/Models/hotel_model.dart';
import 'package:book_palacee/Models/place_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final _db = FirebaseFirestore.instance;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 3.5,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      child: Image.asset(
                        'assets/Images/1.jpg', fit: BoxFit.cover,)
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 3.5,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                      color: Colors.black45
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.white,),
                      const SizedBox(width: 10),
                      Text('India, Delhi', style:GoogleFonts.abel( color:Colors.white,fontWeight:FontWeight.w600)
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 15),
                  child: Text('Hey, Arif! Tell us where you want to go',
                      style:GoogleFonts.aboreto(fontSize:22,fontWeight:FontWeight.w600,color:Colors.white)
                  )
                ),
                Positioned(
                  bottom:25,
                  left:15,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.1,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white54,
                    ),
                    child: TextFormField(
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelLarge,
                      decoration: const InputDecoration(
                        hintText: 'Search Places......',
                        prefixIcon: Icon(Icons.search_rounded),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height:20),
            Row(
              children: [
                Text('The most relevant',style:GoogleFonts.openSans(
                  fontSize:20,
                    fontWeight:FontWeight.w600
                )),
              ],
            ),
            const SizedBox(height:5),
            StreamBuilder(
                stream:_db.collection('Hotels').snapshots(),
                builder:(context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return const CupertinoActivityIndicator(color:Colors.black,);
                  }else if(snapshot.hasError){
                  return Text('Error :${snapshot.hasError}');
                  }else if(!snapshot.hasData){
                    return const Text('NO DATA FOUND');
                  }else if(snapshot.data !=null){
                  return SizedBox(
                    height:252,
                    child: ListView.builder(
                      itemCount:snapshot.data!.docs.length,
                      shrinkWrap:true,
                      scrollDirection:Axis.horizontal,
                      itemBuilder:(context, index) {
                        var data = snapshot.data!.docs[index];
                        HotelModel hotelmodel = HotelModel(
                            hotelDesc:data['HotelDesc'],
                            hotelAddress:data['Address'],
                            hotelName:data['HotelName'],
                            hotelImage:data['Image'],
                            hotelPrice:data['HotelCharges'],
                            isBathroom:data['Bathroom'],
                            isHdtv:data['Hdtv'],
                            isKitchen:data['Kitchen'],
                            isWifi:data['Wifi']
                            );
                        return InkWell(
                          onTap:(){
                            Get.to(DetailsPage(hotelModel:hotelmodel));
                          },
                          child: Card(
                            elevation:10,
                            child: Container(
                              padding:const EdgeInsets.all(4),
                              margin:const EdgeInsets.only(right:20),
                              width:230,
                              height:100,
                              child:Column(
                                children: [
                                  SizedBox(
                                    width:250,
                                    height:155,
                                    child:ClipRRect(
                                        borderRadius:BorderRadius.circular(10),
                                        child:CachedNetworkImage(imageUrl:hotelmodel.hotelImage,fit:BoxFit.cover,)),
                                  ),
                                  const SizedBox(height:20),
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(hotelmodel.hotelName,style:GoogleFonts.abel( fontWeight:FontWeight.w600)),
                                      Text('\$${hotelmodel.hotelPrice}',style:GoogleFonts.abel( fontWeight:FontWeight.w600)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(hotelmodel.hotelAddress,overflow:TextOverflow.ellipsis,style:GoogleFonts.abel( fontWeight:FontWeight.w600)),
                                      const Icon(Icons.location_on,color:Colors.blue,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                  }
                  return Container();
                },
            ),
            const SizedBox(height:20),
            Row(
              children: [
                Text('Discover new places',style:GoogleFonts.openSans(
                  fontSize:20,
                  fontWeight:FontWeight.w600
                )),
              ],
            ),
            const SizedBox(height:10),
            StreamBuilder(
                stream:_db.collection('Places').snapshots(),
                builder:(context, snapshot) {
                 if(snapshot.connectionState==ConnectionState.waiting){
                   return const CupertinoActivityIndicator();
                 }else if(snapshot.hasError){
                   return Text('Error :${snapshot.hasError}');
                 }else if(!snapshot.hasData){
                   return const Text('NO DATA FOUND');
                 }else if(snapshot.data !=null){
                   return SizedBox(
                     height:235,
                     child: ListView.builder(
                       itemCount:snapshot.data!.docs.length,
                       shrinkWrap:true,
                       scrollDirection:Axis.horizontal,
                       itemBuilder:(context, index) {
                         var data = snapshot.data!.docs[index];
                         PlaceModel placemodel = PlaceModel(
                             hotels:data['hotels'],
                             placeImage:data['Image'],
                             placeName: data['placeName']
                         );
                         return Card(
                           elevation:10,
                           child: Container(
                             padding:const EdgeInsets.only(left:15,top:5),
                             margin:const EdgeInsets.only(right:15),
                             width:130,
                             height:100,
                             child:Column(
                               children: [
                                 SizedBox(
                                   width:150,
                                   height:155,
                                   child:ClipRRect(
                                       borderRadius:BorderRadius.circular(10),
                                       child:CachedNetworkImage(fit:BoxFit.cover, imageUrl:placemodel.placeImage)),
                                 ),
                                 const SizedBox(height:20),
                                 Row(
                                   children: [
                                     Text(placemodel.placeName,style:GoogleFonts.abel( fontWeight:FontWeight.w600)),
                                   ],
                                 ),
                                 Row(
                                   children: [
                                     const Icon(Icons.hotel,color:Colors.blue,),
                                     const SizedBox(width:10),
                                     Text('${placemodel.hotels} Hotels',style:GoogleFonts.abel( fontWeight:FontWeight.w600)),
                                   ],
                                 ),
                               ],
                             ),
                           ),
                         );
                       },
                     ),
                   );
                 }
                 return Container();
                },
            ),
          ],
        ),
      ),
    );
  }
}

