import 'package:database_example/Controller/data_access_class.dart';
import 'package:database_example/Model/student_model.dart';
import 'package:database_example/View/display_student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentRegisterationForm extends StatefulWidget {
  const StudentRegisterationForm({Key? key}) : super(key: key);

  @override
  State<StudentRegisterationForm> createState() =>
      _StudentRegisterationFormState();
}

String? gender = "";
TextEditingController fnamecntrolr = TextEditingController();
TextEditingController lnamecntrolr = TextEditingController();
TextEditingController citycntrolr = TextEditingController();
TextEditingController agecntrolr = TextEditingController();
TextEditingController gendercntrolr = TextEditingController();

class _StudentRegisterationFormState extends State<StudentRegisterationForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registration Form",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.white,
                // border: Border.all(color: Colors.black, width: 1),
              ),
              child: const Center(
                child: Text(
                  "Registration",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 80,
                    width: 185,
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Center(
                      child: TextField(
                        controller: fnamecntrolr,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: "First Name",
                            hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.white,
                            )),
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 80,
                  width: 185,
                  decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Center(
                    child: TextField(
                      controller: lnamecntrolr,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "Last Name",
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                          prefixIcon: Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Center(
                  child: TextField(
                    controller: agecntrolr,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Your Age",
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          Icons.calendar_month,
                          size: 30,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: TextField(
                    controller: citycntrolr,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Your City",
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        prefixIcon: Icon(
                          Icons.location_city,
                          size: 30,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.blueAccent,
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Radio(
                      value: "Male",
                      groupValue: gender,
                      onChanged: (Value) {
                        gender = Value.toString();
                        //gendercntrolr.text = gender.toString();
                        setState(() {
                          print(gender);
                        });
                      },
                      activeColor: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Male",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Radio(
                      value: "Female",
                      groupValue: gender,
                      onChanged: (Value) {
                        gender = Value.toString();
                        //gendercntrolr.text = gender.toString();
                        setState(() {
                          print(gender);
                        });
                      },
                      activeColor: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Female",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.blueAccent,
              ),
              child: Center(
                child: TextButton(
                  onPressed: () async {
                    DBhelper db = DBhelper.instance;
                    Student std = Student();
                    std.fname = fnamecntrolr.text;
                    std.lname = lnamecntrolr.text;
                    std.city = citycntrolr.text;
                    std.age = int.parse(agecntrolr.text);
                    std.gender = gender.toString();
                    await db.insert(std);
                    Get.to(const ShowAllStudent());
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
