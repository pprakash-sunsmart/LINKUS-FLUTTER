// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

class MasterTextField extends StatefulWidget {
  String label;
  dynamic Controller;
  dynamic PrefixIcon;
  dynamic SuffixIcon;
  bool obscureText;
  //final Validate;
  dynamic keyboardType;
  dynamic focusedborder;
  dynamic enabledborder;
  dynamic fillColor;
  bool filled;
  dynamic contentPadding;

  MasterTextField(
      {Key? key,
      required this.label,
      required this.Controller,
      required this.PrefixIcon,
      this.SuffixIcon,
      required this.enabledborder,
      required this.focusedborder,
      required this.fillColor,
      required this.filled,
      required this.obscureText,
      required this.contentPadding,
      required this.keyboardType})
      : super(key: key);

  @override
  State<MasterTextField> createState() => _MasterTextFieldState();
}

class _MasterTextFieldState extends State<MasterTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 20,
              child: TextFormField(
                //keyboardType: widget.keyboardType,

                obscureText: widget.obscureText,
                controller: widget.Controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: widget.keyboardType,
                //validator: widget.Validate,
                decoration: InputDecoration(
                  contentPadding: widget.contentPadding,
                  focusedBorder: widget.focusedborder,
                  enabledBorder: widget.enabledborder,
                  fillColor: widget.fillColor,
                  filled: widget.filled,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: widget.PrefixIcon,
                  suffixIcon: widget.SuffixIcon,
                  hintText: widget.label,
                  hintStyle: const TextStyle(fontSize: 15),
                ),
                //obscureText: widget.obscureText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
