import 'package:cubiclab_test/models/med_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auxilliary.dart';
import 'models/bottomAppBar.dart';
import 'models/date.dart';

class FirstScreen extends StatelessWidget {
  List dates = [
    Date(dayNum: '8', dayText: 'Mon'),
    Date(dayNum: '9', dayText: 'Tue'),
    Date(dayNum: '10', dayText: 'Wed'),
    Date(dayNum: '11', dayText: 'Thur')
  ];

  List Medications = [
    MedItem(
        icon: 'assets/injection.png',
        name: 'Zoloft',
        quantity: '50 mg',
        time: '7:00 AM'),
    MedItem(
        icon: 'assets/drug.png',
        name: 'Ativan',
        quantity: '20 mg',
        time: '7:00 AM'),
    MedItem(
        icon: 'assets/injection.png',
        name: 'Metropolol',
        quantity: '100 mg',
        time: '7:00 AM'),
  ];
  double dpadd = 18.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: <Widget>[
          Container(
            height: 190,
            color: aux1,
            padding: EdgeInsets.only(top: 48, left: 11, right: 6, bottom: 11),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: ()=>Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 18.5,
                        color: white.withOpacity(0.85),
                      ),
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'My Reminders',
                        style: GoogleFonts.roboto(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: white.withOpacity(0.85)),
                      ),
                    ))
                  ],
                ),
                Expanded(
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      for (final item in dates)
                        if (dates.indexOf(item) == 1)
                          DateWidget(date: item, isSelected: true)
                        else
                          DateWidget(date: item, isSelected: false),
                      Icon(
                        Icons.chevron_right,
                        color: white,
                        size: 19,
                      ),
                    ],
                  )),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 30),
              children: <Widget>[
                MedLabel(icon: 'assets/sun.png', label: 'Before Breakfast'),
                MedLayout(medItem: Medications[0]),
                SizedBox(
                  height: 25,
                ),
                MedLabel(
                    icon: 'assets/breakfast.png', label: 'After Breakfast'),
                MedLayout(medItem: Medications[1]),
                MedLayout(medItem: Medications[2]),
                SizedBox(
                  height: 15,
                ),
                AddMed()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: FABBottomAppBar(
        selectedColor: aux1,
        backgroundColor: white,
        color: aux5.withOpacity(0.7),
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: (value) {},
        items: [
          FABBottomAppBarItem(iconData: 'assets/home.png', text: 'Home'),
          FABBottomAppBarItem(
              iconData: 'assets/reminder.png', text: 'Reminder'),
          FABBottomAppBarItem(
              iconData: 'assets/prescribe.png', text: 'Prescription'),
          FABBottomAppBarItem(
              iconData: 'assets/profile.png', text: 'My Account'),
        ],
      ),
    );
  }

  Widget DateWidget({@required Date date, @required bool isSelected}) {
    return Material(
      borderRadius: BorderRadius.circular(7),
      color: isSelected ? aux3 : white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              date.dayNum,
              style: GoogleFonts.roboto(
                  fontSize: 20, fontWeight: FontWeight.w800, color: aux4),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              date.dayText,
              style: GoogleFonts.roboto(
                  fontSize: 14, fontWeight: FontWeight.w500, color: aux5),
            ),
          ],
        ),
      ),
    );
  }

  Widget MedLabel({@required icon, @required label}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dpadd, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            icon,
            height: 18,
            width: 18,
          ),
          SizedBox(
            width: 9,
          ),
          Text(
            label,
            style: GoogleFonts.roboto(
                fontSize: 18, fontWeight: FontWeight.w400, color: aux4),
          ),
          Spacer(),
          addButton()
        ],
      ),
    );
  }

  Widget MedLayout({@required MedItem medItem}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: dpadd, vertical: 10),
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
      child: ListTile(
        leading: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              medItem.icon,
              height: 30,
              width: 30,
            )
          ],
        ),
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: medItem.name + ' ',
              style: GoogleFonts.roboto(
                  fontSize: 16, fontWeight: FontWeight.w600, color: aux4),
            ),
            TextSpan(
              text: medItem.quantity,
              style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: aux5.withOpacity(0.85)),
            )
          ]),
        ),
        subtitle: Text(
          medItem.time,
          style: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.w600, color: aux2),
        ),
      ),
    );
  }

  Widget AddMed() {
    return Center(
      child: Column(
        children: <Widget>[
          addButton(),
          SizedBox(
            height: 7,
          ),
          Text(
            'Add Medication',
            style: GoogleFonts.roboto(
                fontSize: 17, fontWeight: FontWeight.w600, color: aux1),
          ),
        ],
      ),
    );
  }

  Widget addButton() {
    return Material(
      color: aux3,
      borderRadius: BorderRadius.circular(5),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Icon(
          Icons.add,
          color: aux1,
          size: 16.5,
        ),
      ),
    );
  }
}
