import 'package:flutter/material.dart';

class mybouton extends StatelessWidget {
  final void Function()? onTap;
  final Color color;
  final String txtname;
  const mybouton({super.key, required this.color, required this.txtname, this.onTap});

  @override
  Widget build(BuildContext context) {
    return 
            InkWell(
              onTap: onTap,
              child: Container(
                height: 46,
                width: 270,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(15)
              ),
            child: 
                  Align( alignment: Alignment.center,
                    child: Text(txtname, style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18
                    ),)),
                    
                
              ),
            );
          
        
      
    
  }
}