import 'package:flutter/material.dart';

class listTile extends StatelessWidget {
 final EdgeInsetsGeometry? margin;
 final void Function()? onTap;
 final IconData icon;
 final String txt;
  const listTile({super.key, this.margin, this.onTap, required this.icon, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        margin:margin ,
        child: InkWell(
          onTap: onTap,
          child: ListTile(
            leading: Icon(icon, size: 23, color: Colors.white,),
            title: Text(txt, style: TextStyle(
              color: Colors.white, fontSize: 14.5, fontWeight: FontWeight.bold
            ),),
          ),
        ),
      ),
    );
  }
}