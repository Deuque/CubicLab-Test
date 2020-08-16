import 'package:cubiclab_test/first_screen_adobexd.dart';
import 'package:cubiclab_test/second_screen_sketch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auxilliary.dart';
class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          pages(icon: 'assets/xd.png', name: 'Adobe Design', destination: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>FirstScreen()))),
          pages(icon: 'assets/wireframe.png', name: 'Wireframe Sketch', destination: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>SecondScreen()))),
        ],
      ),
    );
  }

  Widget pages({@required icon, @required name, @required destination}){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 26,vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: white,
          boxShadow: [
            BoxShadow(
                color: aux3.withOpacity(0.6),
                spreadRadius: 5,
                blurRadius: 8,
                offset: Offset(0, 5)),
          ]),
      child: InkWell(
        onTap: destination,
        child: ListTile(
          leading: Image.asset(icon,height: 25,width: 25,),
          title: Text(
            name,
            style: GoogleFonts.roboto(
                fontSize: 16, fontWeight: FontWeight.w400, color: aux4.withOpacity(.8)),
          ),
          trailing: Icon(Icons.chevron_right,color: aux5.withOpacity(.8),),
        ),
      ),
    );
  }
}
