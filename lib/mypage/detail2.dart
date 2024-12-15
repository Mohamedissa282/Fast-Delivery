import 'package:flutter/material.dart';
class detail2 extends StatelessWidget {
  final String txtname;
  final String txtname2;
  final String txtname3;
  const detail2({super.key, required this.txtname, required this.txtname2, required this.txtname3});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(9.0),
        child: Card(child: ListTile(
          leading: Text(txtname, style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),),
          title: Text(txtname2,style: TextStyle(color: Colors.grey[800], fontSize: 18, fontWeight: FontWeight.bold),),
          subtitle: Text(txtname3,
          style: TextStyle(color: Colors.grey[750], fontSize: 13.5, fontWeight: FontWeight.bold),),
          
        ),),
      );
  }
}