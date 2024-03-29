import 'dart:convert';
import 'package:banao_projectt/ProgramsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class ProgramsViewAll extends StatefulWidget {
  String? Query;
  ProgramsViewAll({required this.Query});

  @override
  State<ProgramsViewAll> createState() => _ProgramsViewAll();
}

class _ProgramsViewAll extends State<ProgramsViewAll> {
  List<ProgramsQueryModel> programModelList = <ProgramsQueryModel>[];

  bool isLoading = true;

  getProgramsByQuery(String query) async {
    String url = "https://632017e19f82827dcf24a655.mockapi.io/api/$query";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["items"].forEach((element) {
        ProgramsQueryModel programsQueryModel = ProgramsQueryModel.fromMap(element);
        programModelList.add(programsQueryModel);
        isLoading = false; // Move setState out of the loop
      });
    });
  }

  @override
  void initState() {
    getProgramsByQuery("programs");
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
            const SizedBox(height: 10,),
            isLoading
                ? Container(
              height: MediaQuery.of(context).size.height - 450,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
                : Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: programModelList.length,
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
                                  "assets/images/prog.jpg",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 200,
                                ),
                              ),
                              Positioned(
                                bottom: 30,
                                left: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      programModelList[index].programCategory,
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width - 50, // Adjust the width as needed
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
