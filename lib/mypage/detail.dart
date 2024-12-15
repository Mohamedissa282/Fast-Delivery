import 'package:appflutter/generated/l10n.dart';
import 'package:appflutter/mypage/detail2.dart';
import 'package:flutter/material.dart';

class detail extends StatelessWidget {
  const detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
    title: Text(S.of(context).T1, style: TextStyle(
      color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold
    ),),
    backgroundColor: Colors.orange,
    centerTitle: true,
  ),
  body: SingleChildScrollView( 
    child: Column(
      children: [
        detail2(txtname: '1', txtname2:S.of(context).T2 , txtname3: S.of(context).T6),
        detail2(txtname: '2', txtname2: S.of(context).T3, txtname3: S.of(context).T7),
        detail2(txtname: '3', txtname2: S.of(context).T4, txtname3: S.of(context).T8),
        detail2(txtname: '4', txtname2: S.of(context).T5, txtname3: S.of(context).T9)
      ],
    ),
  ),
    );
  }
}