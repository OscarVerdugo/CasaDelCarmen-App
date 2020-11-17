import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController userController;
  final bool obscureText;
  final TextInputType inputType;

  CustomTextField({
    @required this.userController,
    @required this.hintText,
    @required this.icon,
    @required this.obscureText,
    @required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .90,
      // margin: EdgeInsets.all(30),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueGrey.withOpacity(0.5),
      ),
      child: TextFormField(
        keyboardType: inputType,
        obscureText: !obscureText,
        style: TextStyle(
          color: Colors.white,
        ),
        controller: userController,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(.6),
          ),
          hintText: hintText,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          focusColor: Colors.white,
          hoverColor: Colors.white,
        ),
        cursorColor: Colors.white,
      ),
    );
  }
}
