import 'package:flutter/material.dart';

import '../Login Files/login_textfield.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var oldPassword = TextEditingController();
  var newPassword = TextEditingController();
  var cnfrmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 123, 255, 1),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
            
          },
        ),
        title: const Text("Change Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            MasterTextField(
              label: "Old Password",
              Controller: oldPassword,
              PrefixIcon: const Icon(
                Icons.key,
                color: Colors.grey,
              ),
              obscureText: false,
              keyboardType: null,
              contentPadding: const EdgeInsets.symmetric(vertical: 5),
              enabledborder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
              ),
              fillColor: null,
              filled: false,
              focusedborder: null,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            MasterTextField(
              label: "New Password",
              Controller: oldPassword,
              PrefixIcon: const Icon(
                Icons.key,
                color: Colors.grey,
              ),
              obscureText: false,
              keyboardType: null,
              contentPadding: const EdgeInsets.symmetric(vertical: 5),
              enabledborder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
              ),
              fillColor: null,
              filled: false,
              focusedborder: null,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            MasterTextField(
              label: "Confirm Password",
              Controller: oldPassword,
              PrefixIcon: const Icon(
                Icons.key_rounded,
                color: Colors.grey,
              ),
              obscureText: false,
              keyboardType: null,
              contentPadding: const EdgeInsets.symmetric(vertical: 5),
              enabledborder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
              ),
              fillColor: null,
              filled: false,
              focusedborder: null,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: Row(
                children: [
                  ElevatedButton(
                     
                          style: ButtonStyle(
             backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
               return  Color(0xff2b3d6b);
              return  Color(0xff2b3d6b);
            },),),
                      onPressed: () {},
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
