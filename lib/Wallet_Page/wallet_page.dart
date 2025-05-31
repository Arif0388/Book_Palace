import 'package:book_palacee/Controller/wallet_payment_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletPage extends StatelessWidget {
  const WalletPage ({super.key});

  @override
  Widget build(BuildContext context) {
   String walletImage = 'https://img.freepik.com/premium-photo/wallet-rupee-coin-3d-icon-isolated-white-background_1108860-1753.jpg?uid=R134077398&ga=GA1.1.1344545188.1728141412&semt=ais_items_boosted&w=740';
    WalletPaymentController walletPaymentController = WalletPaymentController();
    final _db = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
    appBar:AppBar(
      centerTitle:true,
      automaticallyImplyLeading: false,
      title:Text('Wallet',style:GoogleFonts.aleo(fontWeight:FontWeight.bold)),
    ),
      body:Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          Container(),
          Card(
            elevation:2,
            child: Container(
              padding:const EdgeInsets.all(5),
              width:Get.width/1.2,
              height:Get.height/9.6,
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(10),
              color:Colors.white,
            ),
              child:Row(
                children: [
                 CachedNetworkImage(imageUrl:walletImage),
                  const SizedBox(width:30),
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height:10),
                          Text('Your Wallet',style:GoogleFonts.aleo(fontSize:16)),
                          StreamBuilder(
                              stream:_db.collection('Users').doc(user!.uid).snapshots(),
                              builder:(context, snapshot) {
                                if(snapshot.connectionState==ConnectionState.waiting){
                                  return const CupertinoActivityIndicator();
                                }
                                else if(snapshot.hasError){
                                  return Text('${snapshot.hasError}');
                                }
                                else if(!snapshot.hasData){
                                  return const Text('DATA NOT FOUND');
                                }else if(snapshot.data !=null){
                                  return Text('\$${snapshot.data!['Wallet']}',style:GoogleFonts.aleo(fontSize:26,fontWeight:FontWeight.bold));
                                }
                                return Container();
                              },
                          ),
                        ],
                      )
                ],
              ),
            ),
          ),
          const SizedBox(height:10),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                hoverColor:Colors.transparent,
                focusColor:Colors.transparent,
                highlightColor:Colors.transparent,
                splashColor:Colors.transparent,
                onTap:()async{
                  await walletPaymentController.makePayment(amount:'${50}');
                },
                child: Card(
                  elevation:2,
                  child: Container(
                    width:80,
                    height:35,
                   decoration:BoxDecoration(
                     borderRadius:BorderRadius.circular(8),
                     color:Colors.blueAccent[100],
                   ),
                    child: Center(child: Text('50',style:GoogleFonts.aleo(fontSize:18,color:Colors.white,fontWeight:FontWeight.bold))),
                  ),
                ),
              ),
              InkWell(
                hoverColor:Colors.transparent,
                focusColor:Colors.transparent,
                highlightColor:Colors.transparent,
                splashColor:Colors.transparent,
                onTap:()async{
                  await walletPaymentController.makePayment(amount:'${100}');
                },
                child: Card(
                  elevation:2,
                  child: Container(
                    width:80,
                    height:35,
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(8),
                      color:Colors.blueAccent[100],
                    ),
                    child: Center(child: Text('100',style:GoogleFonts.aleo(fontSize:18,color:Colors.white,fontWeight:FontWeight.bold))),
                  ),
                ),
              ),
              InkWell(
                hoverColor:Colors.transparent,
                focusColor:Colors.transparent,
                highlightColor:Colors.transparent,
                splashColor:Colors.transparent,
                onTap:()async{
                  await walletPaymentController.makePayment(amount:'${200}');
                },
                child: Card(
                  elevation:2,
                  child: Container(
                    width:80,
                    height:35,
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(8),
                      color:Colors.blueAccent[100],
                    ),
                    child: Center(child: Text('200',style:GoogleFonts.aleo(fontSize:18,color:Colors.white,fontWeight:FontWeight.bold))),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height:20),
          Expanded(
            child: StreamBuilder(
              stream:_db.collection('Users').doc(user!.uid).collection('PaymentHistory').snapshots(),
              builder:(context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator());
                }else if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
                  return Center(child: Text('No transactions yet.',style:GoogleFonts.aleo(fontSize:20)));
                }else if(snapshot.hasError){
                  return Text('Error : ${snapshot.hasError}');
                }else if(snapshot.data !=null){
                  return ListView.builder(
                    itemCount:snapshot.data!.docs.length,
                      itemBuilder:(context, index) {
                      var data = snapshot.data!.docs[index];
                        return Card(
                          elevation:2,
                          child: Container(
                            margin:const EdgeInsets.only(top:5),
                            padding:const EdgeInsets.all(5),
                            width:Get.width/1.2,
                            height:Get.height/9.6,
                            decoration:BoxDecoration(
                              borderRadius:BorderRadius.circular(10),
                              color:Colors.white,
                            ),
                            child:Row(
                              children: [
                                Container(
                                  padding:const EdgeInsets.all(5),
                                  width:80,
                                  height:100,
                                  decoration:const BoxDecoration(
                                    borderRadius:BorderRadius.only(topLeft:Radius.circular(10),bottomLeft:Radius.circular(10)),
                                    color:Colors.black,
                                  ),
                                  child:Column(
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children: [
                                      Text(data['amount_date'],style:GoogleFonts.aleo(fontSize:20,color:Colors.white,fontWeight:FontWeight.bold)),
                                      Text(data['amount_month'],style:GoogleFonts.aleo(fontSize:20,color:Colors.white,fontWeight:FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                const SizedBox(width:30),
                                Column(
                                  crossAxisAlignment:CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height:10),
                                    Text('Amount Added',style:GoogleFonts.aleo(fontSize:16)),
                                    Text('\$${data['amount']}',style:GoogleFonts.aleo(fontSize:25,fontWeight:FontWeight.bold))
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
