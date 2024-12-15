import 'package:appflutter/generated/l10n.dart';
import 'package:appflutter/login/login.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class textfield extends StatelessWidget {
  final TextEditingController mycontroller;
 
  const textfield({super.key, required this.mycontroller});
  
  
  @override
  Widget build(BuildContext context) {
    
    return 
              IntlPhoneField(
                textAlign: isArabic() ? TextAlign.right : TextAlign.left,
                invalidNumberMessage: S.of(context).title9,
                keyboardType:TextInputType.number,
                initialCountryCode: 'MR',
                controller:mycontroller ,
                showCursor: false,
                decoration: InputDecoration(
                  hintText: S.of(context).title10,
                  
                
                  contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 22),
                  
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 3)
                  )
                
                ),
               
               
              );
            
  }
}

