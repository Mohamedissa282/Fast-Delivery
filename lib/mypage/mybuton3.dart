import 'package:flutter/material.dart';

class myboton3 extends StatelessWidget {
   final void Function()? onTap;
  final Color color;
  final String txtname;
  const myboton3({super.key, this.onTap, required this.color, required this.txtname});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
              onTap: onTap,
              child: Container(
                height: 46,
                width: 270,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(15)
              ),
            child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align( alignment: Alignment.center,
                        child: Text(txtname, style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18
                        ),)),
                        SizedBox(width: 4,),
                        Icon(Icons.arrow_right_alt_outlined,size: 35, color: const Color.fromRGBO(255, 255, 255, 1),),
                    ],
                  ),
                    
                
              ),
            );;
  }
}