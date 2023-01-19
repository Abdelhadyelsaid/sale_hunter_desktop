import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Icon_Text_Field extends StatefulWidget {
  final String hintText;
  final TextInputType keyboard;
  final ValueChanged<String> onChanged;
  final IconData icon;


  const Icon_Text_Field({
    this.keyboard,
     this.hintText,
     this.onChanged,
     this.icon,

  });

  @override
  State<Icon_Text_Field> createState() => _Icon_Text_FieldState();
}

class _Icon_Text_FieldState extends State<Icon_Text_Field> {

  bool ishidden=false;
  bool value=false;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 368,
      height: 56,
      child: TextFormField(
        keyboardType: widget.keyboard,
        obscureText: ishidden,
        style: const TextStyle(
          fontFamily: 'Montserrat',
          color: Color(0xff9b9ca8),
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        decoration:  InputDecoration(
          hintText: widget.hintText,
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
          suffixIcon: InkWell(
            onTap: toggle,
            child: Icon(
              ishidden
              ?Icons.visibility
                  : Icons.visibility_off,
            ),
          ),

        ),
        onChanged: widget.onChanged,
      ),
    );
  }

  void toggle() {
    setState(() {
      ishidden = !ishidden;
    });
  }

}

