
import 'package:book_palacee/HomePage/HomePage.dart';
import 'package:book_palacee/Models/hotel_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.hotelModel});
  final HotelModel hotelModel;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  DateTime datetime = DateTime.now();
  DateTime datetime2 = DateTime.now();
  final TextEditingController guestController = TextEditingController();
  var money;
  var date=1;
  int numberOfGuests = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection:Axis.vertical,
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height/3,
                  child:ClipRRect(
                    borderRadius:const BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight:Radius.circular(30)),
                    child:CachedNetworkImage(fit:BoxFit.cover, imageUrl:widget.hotelModel.hotelImage,),
                  ),
                ),
                InkWell(
                  onTap:()=>Get.to(const Homepage()),
                  child: Padding(
                    padding: const EdgeInsets.only(top:35,left:4),
                    child: Container(
                        width:40,
                        height:40,
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(25),
                          color:Colors.black54,
                        ),
                        child: const Icon(Icons.arrow_back_rounded,size:28,color:Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.only(left:5),
              child: Text(widget.hotelModel.hotelName,style:GoogleFonts.abel(fontSize:25,fontWeight:FontWeight.w600)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:5),
              child: Text('\$${widget.hotelModel.hotelPrice}',style:GoogleFonts.abel(fontSize:20,fontWeight:FontWeight.w600)
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left:5),
              child: Text('what this place offers',style:GoogleFonts.abel(fontSize:25,fontWeight:FontWeight.w600)
              ),
            ),
             Card(
               elevation:2,
               child: Container(
                 padding:const EdgeInsets.all(5),
                 child:Column(
                   children: [
                  widget.hotelModel.isWifi?Row(
                       children: [
                         const Icon(Icons.wifi,color:Colors.blue,),
                         const SizedBox(width:10),
                         Text('WiFi',style:GoogleFonts.sansita(
                             fontSize:20,
                             fontWeight:FontWeight.w400
                         )),
                       ],
                     ) : const SizedBox.shrink(),
                     const SizedBox(height:10),
                     widget.hotelModel.isHdtv?Row(
                       children: [
                         const Icon(Icons.tv,color:Colors.blue,),
                         const SizedBox(width:10),
                         Text('HDTV',style:GoogleFonts.sansita(
                             fontSize:20,
                             fontWeight:FontWeight.w400
                         )),
                       ],
                     ) : const SizedBox.shrink(),
                     const SizedBox(height:10),
                     widget.hotelModel.isKitchen? Row(
                       children: [
                         const Icon(Icons.kitchen,color:Colors.blue,),
                         const SizedBox(width:10),
                         Text('Kitchen',style:GoogleFonts.sansita(fontSize:20, fontWeight:FontWeight.w400)),
                       ],
                     ) : const SizedBox.shrink(),
                     const SizedBox(height:10),
                     widget.hotelModel.isBathroom? Row(
                       children: [
                         const Icon(Icons.bathroom,color:Colors.blue,),
                         const SizedBox(width:10),
                         Text('Bathroom',style:GoogleFonts.sansita(fontSize:20, fontWeight:FontWeight.w400)),
                       ],
                     ) : const SizedBox.shrink(),
                   ],
                 ),
               ),
             ),
             Card(
              elevation:2,
              child: Container(
                padding:const EdgeInsets.only(left:10),
                width:MediaQuery.of(context).size.width,
                height:220,
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(15),
                color:Colors.white,
              ),
                child:Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text('About this place',style:GoogleFonts.aleo(
                        fontSize:22,
                        fontWeight:FontWeight.w500
                    )),
                    Text(widget.hotelModel.hotelDesc,style:GoogleFonts.poppins(fontSize:14)),
                  ],
                ),
              ),
            ),
             Card(
                child: Container(
                  padding:const EdgeInsets.all(2),
                    margin:const EdgeInsets.all(5),
                    child: Text('\$${money==null?'20':money} for $date nights',style:GoogleFonts.poppins(fontSize:16,fontWeight:FontWeight.w800))
                ),
              ),
             const SizedBox(height:10),
             Padding(
              padding: const EdgeInsets.only(left:8),
              child: Text('Check-in Date',style:GoogleFonts.poppins(fontSize:16,fontWeight:FontWeight.w600)),
            ),
             Card(
              child: Container(
                padding:const EdgeInsets.all(5),
                child:Row(
                  children: [
                    InkWell(
                        onTap:()async{
                            var date =await showDatePicker(
                                context: context,
                                firstDate:DateTime(2000),
                                lastDate:DateTime(2026),
                            );
                            if(date !=null){
                              setState(() {
                                datetime = date;
                              });
                              DateDiff();
                            }
                            else{
                              print('Null Date');
                          }
                        },
                        child: const Icon(Icons.calendar_month,color:Colors.blue,size:30,)),
                    const SizedBox(width:10),
                    Text(DateFormat('dd-MM-yyyy').format(datetime)),
                  ],
                ),
              ),
            ),
             const SizedBox(height:10),
             Padding(
              padding: const EdgeInsets.only(left:8),
              child: Text('Check-out Date',style:GoogleFonts.poppins(fontSize:16,fontWeight:FontWeight.w600)),
            ),
             Card(
              child: Container(
                padding:const EdgeInsets.all(5),
                child:Row(
                  children: [
                    InkWell(
                        onTap:()async{
                          var date = await showDatePicker(
                              context: context,
                              firstDate:DateTime(2000), 
                              lastDate:DateTime(2026),
                          );
                          if(date !=null){
                            setState(() {
                              datetime2 = date;
                            });
                            DateDiff();
                          }else{
                            print('Null Date');
                          }
                        },
                        child: const Icon(Icons.calendar_month,color:Colors.blue,size:30,)),
                    const SizedBox(width:10),
                    Text(DateFormat('dd-MM-yyyy').format(datetime2)),
                  ],
                ),
              ),
            ),
            const SizedBox(height:10),
            Padding(
              padding: const EdgeInsets.only(left:8),
              child: Text('Number of Guests',style:GoogleFonts.poppins(fontSize:16,fontWeight:FontWeight.w600)),
            ),
            Card(
              elevation:2,
              child: Container(
                padding:const EdgeInsets.all(8),
                child : Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType:TextInputType.number,
                        controller:guestController,
                        decoration: InputDecoration(
                          border:InputBorder.none,
                          hintText:'number of guest....',
                          hintStyle:GoogleFonts.aleo(fontSize:15),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap:(){
                       setState(() {
                         if(guestController.text.isNotEmpty){
                           numberOfGuests = int.tryParse(guestController.text) ?? 1;
                           money = date * numberOfGuests * 20;
                         }
                       });
                      },
                      child: Container(
                        width:MediaQuery.of(context).size.width/5,
                        height:40,
                        decoration:BoxDecoration(
                          color:Colors.blueAccent,
                          borderRadius:BorderRadius.circular(10),
                        ),
                        child:Center(child:Text('Check',style:GoogleFonts.aleo(color:Colors.white)),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin:const EdgeInsets.only(left:45,bottom:50,top:10),
              width:MediaQuery.of(context).size.width/1.3,
              height:50,
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                color:Colors.blue[300],
              ),
              child:Center(child: Text('Book Now',style:GoogleFonts.poppins(fontSize:18,color:Colors.white,fontWeight:FontWeight.w600))),
            ),
          ],
        ),
      ),
    );
  }

  void DateDiff(){
    Duration diff = datetime2.difference(datetime);
    setState(() {
      date=diff.inDays;
      money = (date*20);
    });
    print('Money : $money');
    print('Money : $date');
  }

}
