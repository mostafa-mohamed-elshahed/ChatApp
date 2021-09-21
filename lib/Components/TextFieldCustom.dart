import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String hint;
  final Function onSaved;
  final bool obscureText ;
  CustomTextField({@required this.hint ,@required this.onSaved, this.obscureText,});


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onSaved: onSaved,
      style: TextStyle(color: Colors.white ),
      validator: (value)
      {
      if(value.isEmpty)
        {
          return "this field is empty";
        }else{
        return null ;
      }
      },
      decoration: InputDecoration(
errorBorder:  OutlineInputBorder (
  borderSide: BorderSide(
    color: Colors.red,
  ),),
        focusedErrorBorder: OutlineInputBorder (
          borderSide: BorderSide(
          color: Colors.red,
        ),),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintStyle: TextStyle(color: Colors.white),
          hintText: hint,
      ),
      obscureText: obscureText!= null,
    );
  }
}
