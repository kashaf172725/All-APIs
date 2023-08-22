import 'dart:developer';

import 'package:flutter/material.dart';
import '../utils/const.dart';



Widget CustomText({
  var text,
  var fontSize,
  var fontWeight,
  var color,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
       
      ),
    ),
  );
}



Widget box(var heading,var controller, {isObsecure = false}) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: MyColors.white,
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 18,
          child: TextField(
            controller:  controller,
            obscureText: isObsecure,
            decoration: InputDecoration(
              hintText:heading,
              border: InputBorder.none,
            ),
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        )
      ]),
    ),
  );
}



 Widget CustomButton(
  
{  
  var text,
  var height ,
   var fontcolor,
  var color,
  var onPressed}
){
  return  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: color,
              ),
              height: height,
            width: 200,
              child: TextButton(
                onPressed: 
                onPressed,
               
                child: CustomText(text: text,fontSize: 20,fontWeight: FontWeight.bold,color: fontcolor)
              ),
            ),
  );
}



showSnack(context, text, {isSuccess = false}) {
  
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(text.toString()),
          backgroundColor: isSuccess ? MyColors.lightGreen : MyColors.red,
        ));


      }



class CustomFormField extends StatefulWidget {
  final Color color;
  final String hintText;
  final IconData icon;
  final double border;
  final bool isPasswordField;
  final TextEditingController controller;
  final bool? isOutlinedBorder;
  final String? Function(String?)? validator;
  CustomFormField({
    required this.color,
    required this.hintText,
    required this.icon,
    required this.border,
    this.isOutlinedBorder = true,
    this.isPasswordField = false,
    required this.controller,
    this.validator,
  });
  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.border),
      borderSide: BorderSide(
        color: Colors.black.withOpacity(0.4),
      ),
    );
    final focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.border),
      borderSide: const BorderSide(
        color: Colors.black,
      ),
    );

    final underlineBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black.withOpacity(0.4),
      ),
    );
    final enableBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black.withOpacity(0.4),
      ),
    );

    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPasswordField ? _obscureText : false,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.border),
            borderSide: BorderSide(
              color: Colors.red.withOpacity(0.4),
            )),
        enabledBorder:
            widget.isOutlinedBorder! ? outlineBorder : underlineBorder,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.border),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.4),
            )),
        fillColor: widget.color,
        filled: true,
        hintText: widget.hintText,
        suffixIcon: widget.isPasswordField
            ? _buildPasswordFieldVisibilityToggle()
            : null,
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.border),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.black,
        ),
      ),
      validator: widget.validator,
    );
  }

  Widget _buildPasswordFieldVisibilityToggle() {
    return IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
        color: Colors.black45,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}
