import 'package:database_example/Controller/data_access_class.dart';
import 'package:database_example/Model/student_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowAllStudent extends StatefulWidget {
  const ShowAllStudent({Key? key}) : super(key: key);

  @override
  State<ShowAllStudent> createState() => _ShowAllStudentState();
}

DBhelper db = DBhelper.instance;
List<Map<String, dynamic>> slist = [];
List<Student> sslist = [];
String? fname, lname, city, gender;
int? age, id;

class _ShowAllStudentState extends State<ShowAllStudent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    slist = await db.read();
    print(slist);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Show All Student",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: slist.isNotEmpty
          ? ListView.builder(
              itemCount: slist.length,
              itemBuilder: (context, index) {
                // id = int.parse(slist[index]['id'].toString());
                // fname = slist[index]['fname'].toString();
                // lname = slist[index]['lname'].toString();
                // city = slist[index]['city'].toString();
                // gender = slist[index]['gender'].toString();
                // age = int.parse(slist[index]['age'].toString());
                // /////////////////////////////////////////////////////////////////
                // ///
                // addData(Student std){
                //   std.fname=slist[index]['fname'].toString();
                //   std.lname=slist[index]['lname'].toString();
                // }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onLongPress: () async {
                      print("Long Pressed");
                      await db
                          .delete(int.parse(slist[index]['age'].toString()));
                      getData();
                      setState(() {});
                    },
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  "${slist[index]['fname'].toString()} ${slist[index]['lname'].toString()}",
                                  style: const TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  slist[index]['city'].toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 5.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Gender : ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  slist[index]['gender'].toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, top: 5.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Age :",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  slist[index]['age'].toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  "0300-1234567",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
                backgroundColor: Colors.black12,
              ),
            ),
    );
  }
}
