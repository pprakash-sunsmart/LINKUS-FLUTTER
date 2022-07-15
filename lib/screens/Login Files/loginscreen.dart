// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks, avoid_print, unnecessary_string_interpolations, use_build_context_synchronously, prefer_const_constructors

// import 'dart:convert';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:linkus/screens/Landing%20Files/LandingScreen.dart';
import 'package:localstorage/localstorage.dart';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../variables/Api_Control.dart';
import 'login_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotpswrdController = TextEditingController();
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool _showPassword = false;

  bool isChecked = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  Future<void> login_Func(String mobile, password) async {
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (bc) {
            return Center(
              child: CircularProgressIndicator(),
            );
          });
      Response response = await post(Uri.parse(Login_Api), body: {
        'mobile': int.parse(nameController.text.trim()).toString(),
        'password': "${passwordController.text}",
      }, headers: {
        "Content-type": "application/x-www-form-urlencoded",
        "Accept": "application/json",
        "charset": "utf-8"
      });
      print('Dataaaaa:${response.body}');

      // final LocalStorage storage = new LocalStorage('localstorage_app');
      // storage.setItem('mobileNumber', mobile_number);
      // storage.setItem('password', password);
      // storage.setItem('username', username);
      // storage.setItem('designation', designation);
      // storage.setItem('profilepic', profilepic);

      if (response.body != "Incorrect Username and Password") {
        // Future.delayed(const Duration(seconds: 1)).then((value) {
        // Navigator.pop(context);
        var data = await jsonDecode(response.body);
        var mobile_number = data[0]['mobile'];
        var password = data[0]['password'];
        var username = data[0]['username'];
        var designation = data[0]['designation'];
        var profilepic = data[0]['photourl'];
        print(mobile_number);
        final prefs = await SharedPreferences.getInstance();

        await prefs.setString('mobileNumber', mobile_number);
        await prefs.setString('password', password);
        await prefs.setString('username', username);
        await prefs.setString('designation', designation);
        await prefs.setString('profilepic', profilepic);

        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const landingPage(),
          ),
          (route) => false,
          //if you want to disable back feature set to false
        );

        ScaffoldMessenger.maybeOf(context)
            ?.showSnackBar(SnackBar(content: Text('Logged In Successfully')));

        print('Login successfully');
        // }
        // );
        // print('Logged in :- ${data.toString}');
        // final prefs = await SharedPreferences.getInstance();
        // prefs.setString('UserData', json.encode(data));

        // print()

      } else {
        print("Task Failed");

        AlertDialouge();
      }
    } catch (e) {
      print(e.toString());
    }
    return;
  }

  void AlertDialouge() {
    AlertDialog alert = AlertDialog(
      content: Text('Please Enter Valid Credentials'),
      title: Row(
        children: [Icon(Icons.error), Text('Error')],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('Ok')),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bool login = false;
  @override
  void initState() {
    super.initState();
    passwordController.addListener(() {
      setState(() {
        login = passwordController.text.isNotEmpty &&
            nameController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.%$
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalFormKey,
      child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            // backgroundColor: const Color.fromRGBO(1, 123, 255, 1),

            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/bgimage.png',
                      ),
                      fit: BoxFit.cover)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text("enchat.io",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white38,
                            color: Colors.white)),
                    const Text(
                      "Enterprise Collaboration Platform",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height / 18,
                                width: 30,
                                color: const Color.fromRGBO(56, 210, 0, 1),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                )),
                            Flexible(
                              flex: 1,
                              child: MasterTextField(
                                contentPadding: null,
                                hintText: "Mobile Number",
                                Controller: nameController,
                                PrefixIcon: null,
                                fillColor: Colors.white,
                                filled: true,
                                enabledborder: InputBorder.none,
                                focusedborder: InputBorder.none,
                                obscureText: false,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: 30,
                              decoration: const BoxDecoration(
                                  // borderRadius: BorderRadius.circular(4),
                                  color: Color.fromRGBO(56, 210, 0, 1)),
                              child: const Icon(
                                Icons.key,
                                color: Colors.white,
                              )),
                          Flexible(
                            child: MasterTextField(
                              contentPadding: null,
                              hintText: "Password",
                              PrefixIcon: null,
                              fillColor: Colors.white,
                              filled: true,
                              enabledborder: InputBorder.none,
                              focusedborder: InputBorder.none,
                              obscureText: _showPassword,
                              Controller: passwordController,
                              SuffixIcon: null,
                              keyboardType: null,
                            ),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height / 18,
                              width: 30,
                              decoration: const BoxDecoration(
                                  // borderRadius: BorderRadius.circular(4),
                                  color: Color.fromRGBO(56, 210, 0, 1)),
                              child: GestureDetector(
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  _togglevisibility();
                                },
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    nameController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isChecked = !isChecked;
                                    });
                                  },
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isChecked
                                          ? Colors.grey
                                          : Colors.white,
                                      // border: Border.all(width: 2, color: Colors.)
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: isChecked
                                            ? const Center(
                                                child: Icon(
                                                  Icons.check,
                                                  size: 15.0,
                                                  color: Colors.white,
                                                ),
                                              )
                                            : Container()),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  "Remember Password?",
                                  style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: ElevatedButton(
                        onPressed: login
                            ? () async {
                                if (globalFormKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')));

                                  login_Func(nameController.text,
                                      passwordController.text);
                                }
                              }
                            : null,
                        // onPressed: () {
                        //   Login_Func();
                        // },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                            if (states.contains(MaterialState.disabled)) {
                              return const Color.fromRGBO(56, 210, 0, 1)
                                  .withOpacity(0.55);
                            }
                            return const Color.fromRGBO(56, 210, 0, 1);
                          }),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    InkWell(
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: Colors.white54),
                        ),
                        onTap: () {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) {
                                return WillPopScope(
                                  onWillPop: () async => false,
                                  child: AlertDialog(
                                    title: const Text(
                                      'Please Enter Mobile Number',
                                      style: TextStyle(
                                          color: Colors.black26,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16),
                                    ),
                                    content: Form(
                                      key: globalFormKey,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: forgotpswrdController,
                                        validator: (value) {
                                          if ((value!.length > 5) &&
                                              value.isNotEmpty) {
                                            return "Number should contain more than 5 characters";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          labelText: "Mobile Number",
                                          labelStyle: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            // backgroundColor: Colors.grey,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12))),
                                        onPressed: () {
                                          if (globalFormKey.currentState!
                                              .validate()) {
                                            Navigator.pop(context);
                                          }
                                        },
                                        child: const Text('CANCEL'),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            // backgroundColor: Colors.grey,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12))),
                                        onPressed: () =>
                                            Navigator.pop(context, 'CONFIRM'),
                                        child: const Text('CONFIRM'),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }),
                  ]),
            ),
          )),
    );
  }
}
