import 'package:banao_projectt/Chat.dart';
import 'package:banao_projectt/Home.dart';
import 'package:banao_projectt/Hub.dart';
import 'package:banao_projectt/Learn.dart';
import 'package:banao_projectt/Profile.dart';
import 'package:flutter/material.dart';

class Bottom_Nav extends StatefulWidget {
  const Bottom_Nav({super.key});

  @override
  State<Bottom_Nav> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<Bottom_Nav> {
  int currentIndexValue=0;
  List screenList= [
    const Home(),const Learn(),const Hub(),const Chat(),const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[currentIndexValue],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndexValue ,
        onTap: (index){
          setState(() {
            currentIndexValue=index;
          });
        },
        elevation: 100,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home ),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_sharp,),label: "Learn"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined),label: "Hub"),
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
      ),
    );
  }
}