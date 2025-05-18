
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

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
                    child:Image.asset('assets/Images/1.jpg',fit:BoxFit.cover,),
                  ),
                ),
                Padding(
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
              ],
            ),
            const SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.only(left:5),
              child: Text('Hotel Beach',style:GoogleFonts.abel(fontSize:25,fontWeight:FontWeight.w600)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:5),
              child: Text('\$20',style:GoogleFonts.abel(fontSize:20,fontWeight:FontWeight.w600)
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
                     Row(
                       children: [
                         const Icon(Icons.wifi,color:Colors.blue,),
                         const SizedBox(width:10),
                         Text('WiFi',style:GoogleFonts.sansita(
                             fontSize:20,
                             fontWeight:FontWeight.w400
                         )),
                       ],
                     ),
                     const SizedBox(height:10),
                     Row(
                       children: [
                         const Icon(Icons.tv,color:Colors.blue,),
                         const SizedBox(width:10),
                         Text('HDTV',style:GoogleFonts.sansita(
                             fontSize:20,
                             fontWeight:FontWeight.w400
                         )
                         ),
                       ],
                     ),
                     const SizedBox(height:10),
                     Row(
                       children: [
                         const Icon(Icons.kitchen,color:Colors.blue,),
                         const SizedBox(width:10),
                         Text('Kitchen',style:GoogleFonts.sansita(
                             fontSize:20,
                             fontWeight:FontWeight.w400
                         )
                         ),
                       ],
                     ),
                     const SizedBox(height:10),
                     Row(
                       children: [
                         const Icon(Icons.bathroom,color:Colors.blue,),
                         const SizedBox(width:10),
                         Text('Bathroom',style:GoogleFonts.sansita(
                             fontSize:20,
                             fontWeight:FontWeight.w400
                         )
                         ),
                       ],
                     ),
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
                    Text('About this place whats going there , no nothing going here oh sorry for disturbing, its okk my friends okk can you repeat that oh okk i repeating that okk now i am start and doing very well and also my name is arif hussain and your name is abdullah About this place whats going there , no nothing going here oh sorry for disturbing, its okk my friends okk can you repeat that oh okk i repeating that okk now ',style:GoogleFonts.poppins(fontSize:14)),
                  ],
                ),
              ),
            ),
             Card(
                child: Container(
                  padding:const EdgeInsets.all(2),
                    margin:const EdgeInsets.all(5),
                    child: Text('\$200 for 5 nights',style:GoogleFonts.poppins(fontSize:16,fontWeight:FontWeight.w800))
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
                child:const Row(
                  children: [
                    Icon(Icons.calendar_month,color:Colors.blue,size:30,),
                    SizedBox(width:10),
                    Text('02-05-2025'),
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
                child:const Row(
                  children: [
                    Icon(Icons.calendar_month,color:Colors.blue,size:30,),
                    SizedBox(width:10),
                    Text('09-05-2025'),
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
              child: Container(
                padding:const EdgeInsets.all(8),
                child :Row(
                  children: [
                      Text('5',style:GoogleFonts.poppins(fontSize:15,fontWeight:FontWeight.w600))
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
}
