import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Rounded_Bottom extends StatelessWidget {
  final String hintText;
  final Function func;


  const Rounded_Bottom({
    this.hintText,
    this.func,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 56,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Color(0xff8743ff), Color(0xff4136f1)],
          stops: [0, 1],
          begin: Alignment(1.00, -0.00),
          end: Alignment(-1.00, 0.00),
        ),
        boxShadow: [
          BoxShadow(
              color: Color(0x291466cc),
              offset: Offset(0, 15),
              blurRadius: 30,
              spreadRadius: 0)
        ],
      ),
      child: TextButton(
        onPressed: func,
        child: Text( hintText,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Color(0xffffffff),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }

}
