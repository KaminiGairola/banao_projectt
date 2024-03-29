import 'dart:convert';
import 'package:banao_projectt/LessonsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LessonsViewAll extends StatefulWidget {
  String? Query;
  LessonsViewAll({required this.Query});

  @override
  State<LessonsViewAll> createState() => _LessonsViewAll();
}

class _LessonsViewAll extends State<LessonsViewAll> {
  List<LessonsQueryModel> lessonsModelList = <LessonsQueryModel>[];

  bool isLoading = true;
  getLessonsByQuery(String query) async {
    String url = "https://632017e19f82827dcf24a655.mockapi.io/api/$query";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["items"].forEach((element) {
        LessonsQueryModel lessonsQueryModel = new LessonsQueryModel();
        lessonsQueryModel = LessonsQueryModel.fromMap(element);
        lessonsModelList.add(lessonsQueryModel);
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    getLessonsByQuery("lessons");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Query.toString()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            isLoading
                ? Container(
              height: MediaQuery.of(context).size.height - 450,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
                : Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: lessonsModelList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: InkWell(
                        onTap: () {
                          //code here
                        },
                        child: Container(
                          height: 350,
                          margin: const EdgeInsets.all(15),
                          child: Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                  child: Image.asset(
                                    "assets/images/yoga.jpg",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
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
                                        width: MediaQuery.of(context).size.width - 50, // Adjust the width as needed
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
                                            width: 280,
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
    );
  }
}
