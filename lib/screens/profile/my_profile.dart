// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:linkus/variables/Api_Control.dart';

import 'package:http/http.dart' as http;

import 'dropdown.dart';
import 'dropdown_tone.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((_) => MyProfileData());
      super.initState();
    });
  }

  var name;
  var employee;
  var gender;
  var mobile;
  var email;
  var designation;
  var department;
  var branchname;
  var photourl;
  var marital;

  MyProfileData() async {
    showDialog(
        context: context,
        builder: (bc) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });

    Map data = {
      "mobile": "8903725995",
    };
    print(data);
    String body = json.encode(data);
    print(body);

    var response = await http.post(
      Uri.parse(MyProfile_Api),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
    );
    print("result:${response.body}");

    if (response.statusCode == 200) {
      Future.delayed(const Duration(seconds: 1)).then((value) {
        Navigator.pop(context);
        var ProfileModel = json.decode(response.body);
        for (var i = 0; i < ProfileModel.length; i++) {
          employee = ProfileModel[i]["employee"].toString();

          name = ProfileModel[i]["username"].toString();
          gender = ProfileModel[i]["gender"].toString();
          mobile = ProfileModel[i]["mobile"].toString();
          email = ProfileModel[i]["email"] ?? ''.toString();
          designation = ProfileModel[i]["designation"].toString();
          department = ProfileModel[i]["department"].toString();
          branchname = ProfileModel[i]["branchname"].toString();
          photourl = ProfileModel[i]["photourl"].toString();
          marital = ProfileModel[i]["marital"].toString();
          if (marital == 'undefined') {
            marital = "select";
          } else {
            marital = marital;
          }
        }
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          leadingWidth: 30,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 25,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: const Color.fromRGBO(1, 123, 255, 1),
          title: const Text(" My Profile"),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 60,
                child: ClipOval(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: photourl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.person,
                      size: 22,
                    ),
                  ),
                ),
              ),
              // Center(
              //   child: CircleAvatar(
              //       radius: 60,
              //       backgroundColor: Colors.grey,
              //       backgroundImage: NetworkImage(photourl ?? '')),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                children: [
                  const Text(
                    "Employee Code :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    employee ?? ''.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  const Text(
                    "Name :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    name ?? ''.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  const Text(
                    "Gender :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    gender ?? ''.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    "Marital Status :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Dropdown_gender(
                    marital_status: marital,
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  const Text(
                    "Mobile :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    mobile ?? ''.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  const Text(
                    "Email :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    email ?? ''.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  const Text(
                    "Designation :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    designation ?? ''.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  const Text(
                    "Department :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    department ?? ''.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  const Text(
                    "Branch Name:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    branchname ?? ''.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: const [
                  Text(
                    "Change Tone :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  DropDownTone(),
                ],
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
            ],
          ),
        )));
  }
}
