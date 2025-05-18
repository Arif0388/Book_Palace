import 'package:book_palacee/Booking_Page/booking_page.dart';
import 'package:book_palacee/HomePage/HomePage.dart';
import 'package:book_palacee/Profile_Page/profile_page.dart';
import 'package:book_palacee/Wallet_Page/wallet_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({super.key});

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {

  List pages = [
    // const HotelAddPage(),
    const Homepage(),
    const BookingPage(),
    const WalletPage(),
    const ProfilePage(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:CurvedNavigationBar(
          animationDuration:const Duration(milliseconds:500),
          backgroundColor:Colors.white,
          color:Colors.black,
          onTap:(index){
          setState(() {
            selectedIndex = index;
          });
          },
          items:const [
            Icon(Icons.home,color:Colors.white,size:30,),
            Icon(Icons.shopping_bag,color:Colors.white,size:30,),
            Icon(Icons.wallet,color:Colors.white,size:30,),
            Icon(Icons.person,color:Colors.white,size:30,),
          ]
      ),
      body:pages[selectedIndex],
    );
  }
}
