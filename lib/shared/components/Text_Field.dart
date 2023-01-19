import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final bool visibiltiy;
  final TextInputType keyboard;
  final ValueChanged<String> onChanged;


  const RoundedInputField({
     this.keyboard,
     this.hintText,
     this.visibiltiy,
     this.onChanged,

  });
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 368,
      height: 56,
      child: TextFormField(
        keyboardType: keyboard,
        obscureText: visibiltiy,
        style: const TextStyle(
          fontFamily: 'Montserrat',
          color: Color(0xff9b9ca8),
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        decoration:  InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
            counter: Offstage(),
            filled: true,
            fillColor: Color(0x07000000),
            focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                  width: 1, color: Color(0xff8743ff)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white, width: 0.0),
            ),
            ),
          onChanged: onChanged,
        ),
    );
  }

}
