
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final List hotelList = [
      {
        'name':'Hotel Sangam',
        'location':'Near Main Market, Mumbai',
        'price':'25',
        'image':'assets/Images/2.jpg',
      },
      {
        'name':'Hotel Raj',
        'location':'Near Main Market, Delhi',
        'price':'30',
        'image':'assets/Images/3.jpg',
      },
      {
        'name':'Hotel Sangam',
        'location':'Near Main Market, Karnataka',
        'price':'40',
        'image':'assets/Images/4.jpg',
      },
      {
        'name':'Hotel H.S',
        'location':'Near Main Market, Gujarat',
        'price':'36',
        'image':'assets/Images/5.jpg',
      },
      {
        'name':'Hotel Entertainment',
        'location':'Near Main Market, Kolkata',
        'price':'15',
        'image':'assets/Images/6.jpg',
      },
      {
        'name':'Hotel Arif',
        'location':'Near Main Market, Kashmir',
        'price':'45',
        'image':'assets/Images/7.jpg',
      },
      {
        'name':'Hotel Abdullah',
        'location':'Near Main Market, Mohammed Ali',
        'price':'23',
        'image':'assets/Images/8.jpg',
      },
      {
        'name':'Hotel Arslan',
        'location':'Near Main Market, Patna',
        'price':'50',
        'image':'assets/Images/9.jpg',
      },
      {
        'name':'Hotel Crupper',
        'location':'Near Main Market, Edisa',
        'price':'80',
        'image':'assets/Images/1.jpg',
      },
    ];
    final List placeList = [
      {
        'name':'Russia',
        'hotel':'10',
        'image':'assets/Images/russia.jpg'
      },
      {
        'name':'Dubai',
        'hotel':'12',
        'image':'assets/Images/dubai.jpg'
      },
      {
        'name':'Bangkok',
        'hotel':'15',
        'image':'assets/Images/bangkok.jpg'
      },
      {
        'name':'China',
        'hotel':'10',
        'image':'assets/Images/china.jpg'
      },
      {
        'name':'France',
        'hotel':'8',
        'image':'assets/Images/france.jpg'
      },
      {
        'name':'Bali',
        'hotel':'19',
        'image':'assets/Images/bali.jpg'
      },
      {
        'name':'New York',
        'hotel':'20',
        'image':'assets/Images/newyork.jpg'
      },
      {
        'name':'India',
        'hotel':'6',
        'image':'assets/Images/india.jpg'
      },
    ];
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
            SizedBox(
              height:252,
              child: ListView.builder(
                itemCount:hotelList.length,
                shrinkWrap:true,
                scrollDirection:Axis.horizontal,
                itemBuilder:(context, index) {
               return Card(
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
                             child: Image.asset(hotelList[index]['image'],fit:BoxFit.cover,)),
                       ),
                       const SizedBox(height:20),
                       Row(
                         mainAxisAlignment:MainAxisAlignment.spaceBetween,
                         children: [
                           Text(hotelList[index]['name'],style:GoogleFonts.abel( fontWeight:FontWeight.w600)),
                           Text('\$${hotelList[index]['price']}',style:GoogleFonts.abel( fontWeight:FontWeight.w600)),
                         ],
                       ),
                       Row(
                         children: [
                           Text(hotelList[index]['location'],overflow:TextOverflow.ellipsis,style:GoogleFonts.abel( fontWeight:FontWeight.w600)),
                           const Icon(Icons.location_on,color:Colors.blue,),
                         ],
                       ),
                     ],
                   ),
                 ),
               );
              },
              ),
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
            SizedBox(
              height:235,
              child: ListView.builder(
                itemCount:placeList.length,
                shrinkWrap:true,
                scrollDirection:Axis.horizontal,
                itemBuilder:(context, index) {
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
                                child: Image.asset(placeList[index]['image'],fit:BoxFit.cover,)),
                          ),
                          const SizedBox(height:20),
                          Row(
                            children: [
                              Text(placeList[index]['name'],style:GoogleFonts.abel( fontWeight:FontWeight.w600)),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.hotel,color:Colors.blue,),
                              const SizedBox(width:10),
                              Text(placeList[index]['hotel'],style:GoogleFonts.abel( fontWeight:FontWeight.w600)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

