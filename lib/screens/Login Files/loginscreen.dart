// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:linkus/screens/Landing%20Files/LandingScreen.dart';

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
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Scaffold(
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
                  MasterTextField(
                    contentPadding: const EdgeInsets.all(10),
                    label: "Mobile Number",
                    Controller: nameController,
                    PrefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: const BoxDecoration(

                            // borderRadius: BorderRadius.circular(4),
                            color: Color.fromRGBO(56, 210, 0, 1)),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledborder: InputBorder.none,
                    focusedborder: InputBorder.none,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  MasterTextField(
                    contentPadding: const EdgeInsets.all(10),
                    label: "Password",
                    PrefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                          decoration: const BoxDecoration(
                              // borderRadius: BorderRadius.circular(4),
                              color: Color.fromRGBO(56, 210, 0, 1)),
                          child: const Icon(
                            Icons.key,
                            color: Colors.white,
                          )),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledborder: InputBorder.none,
                    focusedborder: InputBorder.none,
                    obscureText: _showPassword,
                    Controller: passwordController,
                    SuffixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
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
                          )),
                    ),
                    keyboardType: null,
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
                                    color:
                                        isChecked ? Colors.grey : Colors.white,
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
                                width: 5,
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
                          ? () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const landingPage()));
                            }
                          : null,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
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
        ));
  }
}
