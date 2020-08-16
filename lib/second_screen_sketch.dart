import 'package:cubiclab_test/auxilliary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading:   Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: ()=>Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              size: 17,
              color: aux4.withOpacity(0.7),
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Image.asset('assets/user.png',height: 40,width: 40,),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(14),
        children: <Widget>[
          Container(
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: DecorationImage(
                image: AssetImage('assets/rome.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          SizedBox(height: 14,),
          itemLyout(title: 'Description', body: 'Rome is the capital city and a special comune of Italy (named Comune di Roma Capitale) as well as the capital of the Lazio region. The city has been a major human settlement for over two millennia. With 2,860,009 residents in 1,285 km2 (496.1 sq mi)'),
          itemLyout(title: 'Popular Cities', body: 'Collevecchio, Genzano di Roma, Viterbo, Capranica, Castel Gandolfo, Fiuggi, Ponza, Rieti, Sermoneta, Sutri, Tarquinia, Valentano'),
          itemLyout(title: 'Food and Culture', body: 'The main Roman ingredients in dishes were wheat, wine, meat and fish, bread, and sauces and spices. The richer Romans had very luxurious lives, and sometimes hosted banquets or feasts.')
        ],
      ),
    );
  }

  Widget itemLyout({@required title, @required body}){
    return Card(
      margin: EdgeInsets.only(bottom: 10,top: 10),
      elevation: 3,
      shadowColor: aux5.withOpacity(.5),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            Text(
              title,
              style: GoogleFonts.roboto(
                  fontSize: 16, fontWeight: FontWeight.w700, color: aux4),
            ),
            Divider(),
            SizedBox(
              height: 4,
            ),
            Text(
              body,
              style: GoogleFonts.roboto(
                  fontSize: 15, fontWeight: FontWeight.w400, color: aux4.withOpacity(.8)),
            ),
          ]
        ),
      ),
    );
  }
}
