import 'dart:convert';
import 'package:banao_projectt/LessonsModel.dart';
import 'package:banao_projectt/ProgramsModel.dart';
import 'package:banao_projectt/LessonsViewAll.dart';
import 'package:banao_projectt/ProgramsViewAll.dart';
import 'package:banao_projectt/sidemenubar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Lessons for api

  List<LessonsQueryModel> lessonsModelList = <LessonsQueryModel>[];

  bool isLoading = true;

  Future<void> getLessonsByQuery(String query) async {
    Map element;
    int i = 0;

    String url = "https://632017e19f82827dcf24a655.mockapi.io/api/$query";

    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      for (element in data["items"]) {
        try {
          i++;
          LessonsQueryModel newsQueryModel = new LessonsQueryModel();
          newsQueryModel = LessonsQueryModel.fromMap(element);
          lessonsModelList.add(newsQueryModel);
          setState(() {
            isLoading = false;
          });
          if (i == 5) {
            break;
          }
          //newsModelList.sublist(0,5);
        } catch (e) {
          print(e);
        }
      }
    });
  }

  List<ProgramsQueryModel> programModelList = [];

  Future<void> getProgramsByQuery(String query) async {
    Map element;
    int i = 0;
    String url = "https://632017e19f82827dcf24a655.mockapi.io/api/$query";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);

    for (element in data["items"]) {
      try {
        i++;
        ProgramsQueryModel programModel = ProgramsQueryModel();
        programModel = ProgramsQueryModel.fromMap(element);
        programModelList.add(programModel);
        setState(() {
          isLoading = false;
        });
        if (i == 5) {
          break;
        }
      } catch (e) {
        print(e);
      }
    }
  }
  @override
  void initState() {
    getLessonsByQuery("lessons");
    getProgramsByQuery("programs");
    super.initState();
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List EventCatList = [
    {
      "imgUrl":
          "https://online.anahatayoga.in/wp-content/uploads/2021/06/young-woman-doing-natarajasana-exercise_1163-5070.jpg",
      "heading": "BABYCARE",
      "content": "Understanding of human \nbehaviour",
      "date": "13 Feb, Sunday",
      "buttonContent": "Book"
    },
    {
      "imgUrl":
          "https://online.anahatayoga.in/wp-content/uploads/2021/06/young-woman-doing-natarajasana-exercise_1163-5070.jpg",
      "heading": "BABYCARE",
      "content": "Understanding of human \nbehaviour",
      "date": "13 Feb, Sunday",
      ''
          ''
          "buttonContent": "Book"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawerEnableOpenDragGesture: true,
        key: _drawerKey,
        drawer: const sideMenuBar(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 330,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEF3FD),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                onPressed: () {
                                  //code here
                                  _drawerKey.currentState!.openDrawer();
                                },
                                icon: const Icon(Icons.menu),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    //code here
                                  },
                                  icon: const Icon(Icons.forum_outlined)),
                              IconButton(
                                  onPressed: () {
                                    //code here
                                  },
                                  icon: const Icon(Icons.notifications_none))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Hello, Priya!",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "What do you wanna learn today?",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  //code
                                },
                                label: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    "Programs",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                icon: Image.asset("assets/images/bookmark.png"),
                                //const Icon(Icons.book_rounded, color: Colors.blue,),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  side: const BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  //code
                                },
                                label: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    "Get Help",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.help,
                                  color: Colors.blue,
                                ),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  side: const BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  //code
                                },
                                label: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    "Learn",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                icon: Image.asset("assets/images/learn.png"),
                                //const Icon(Icons.menu_book, color: Colors.blue,),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  side: const BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  //code
                                },
                                label: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    "DD Tracker",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                icon: Image.asset("assets/images/dd.png"),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  side: const BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                // first container of program
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Programs for you",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProgramsViewAll( Query: "programs",)));
                        },
                        child: const Text(
                          "View all",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        size: 22,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                isLoading
                    ? Container(
                  height: MediaQuery.of(context).size.height - 450,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
                    : Container(
                  height: 400,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: programModelList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          child: InkWell(
                            onTap: () {
                              //code here
                            },
                            child: Container(
                              margin: const EdgeInsets.all(15),
                              child: Material(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 10,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                      child: Image.asset("assets/images/prog.jpg",
                                        fit: BoxFit.cover,
                                        width: 250,
                                        height: 200,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 30,
                                      left: 10,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            programModelList[index].programCategory,
                                            style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width - 200, // Adjust the width as needed
                                            child: Text(
                                              programModelList[index].programName,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "${programModelList[index].programLesson} lessons",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),

                //second container

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Events and experiences",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          //code here
                        },
                        child: const Text(
                          "View all",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        size: 22,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 400,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: EventCatList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          child: InkWell(
                            onTap: () {
                              //code here
                            },
                            child: Container(
                              margin: const EdgeInsets.all(15),
                              child: Material(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 10,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                      child: Image.network(
                                        EventCatList[index]["imgUrl"],
                                        fit: BoxFit.cover,
                                        width: 250,
                                        height: 200,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 15,
                                      left: 10,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            EventCatList[index]["heading"],
                                            style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            EventCatList[index]["content"],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                EventCatList[index]["date"],
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              OutlinedButton(
                                                onPressed: () {
                                                  //code here
                                                },
                                                child: Text(EventCatList[index]
                                                    ["buttonContent"]),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),

                //third Container

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Lessons for you",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LessonsViewAll( Query: "lessons",)));
                        },
                        child: const Text(
                          "View all",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        size: 22,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                isLoading
                    ? Container(
                        height: MediaQuery.of(context).size.height - 450,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Container(
                        height: 400,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: lessonsModelList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                child: InkWell(
                                  onTap: () {
                                    //code here
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(15),
                                    child: Material(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      elevation: 10,
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                            ),
                                            child: Image.asset(
                                              "assets/images/yoga.jpg",
                                              fit: BoxFit.cover,
                                              width: 250,
                                              height: 200,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 15,
                                            left: 10,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  lessonsModelList[index]
                                                      .lessonsCategory
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width - 200, // Adjust the width as needed
                                                  child: Text(
                                                    lessonsModelList[index].lessonsName.toString(),
                                                    overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 35,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "${lessonsModelList[index].lessonsDuration.toString()} min",
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 150,
                                                    ),
                                                    const Icon(Icons.lock)
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
