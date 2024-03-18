import 'package:banao_projectt/Home.dart';
import 'package:banao_projectt/colors.dart';
import 'package:flutter/material.dart';

class sideMenuBar extends StatefulWidget {
  const sideMenuBar({super.key});

  @override
  State<sideMenuBar> createState() => _sideMenuBarState();
}

class _sideMenuBarState extends State<sideMenuBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(color: Colors.grey),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: const Text(
                    "Banao",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  )),
              Divider(
                color: white.withOpacity(0.3),
              ),
              sectionTwo(),
              const SizedBox(
                height: 5,
              ),
              sectionSetting()
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTwo() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50))))),
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(
                Icons.archive_outlined,
                size: 25,
                color: white.withOpacity(0.7),
              ),
              const SizedBox(
                width: 27,
              ),
              Text(
                "Archive",
                style: TextStyle(
                    color: white.withOpacity(0.7),
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionSetting() {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50))))),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(
                Icons.settings_outlined,
                size: 25,
                color: white.withOpacity(0.7),
              ),
              const SizedBox(
                width: 27,
              ),
              Text(
                "Settings",
                style: TextStyle(color: white.withOpacity(0.7), fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
