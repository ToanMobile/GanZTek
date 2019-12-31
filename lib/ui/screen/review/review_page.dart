import 'package:flutter/material.dart';
import 'package:ganz_tek/res/colors.dart';
import 'package:ganz_tek/res/text_styles.dart';

class ReviewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ReviewState();
}

class ReviewState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.offWhite,
      body: Stack(
        children: <Widget>[
          Center(
            child: Text('ReviewPage', style: TextStylesUtils.styleAvenir20CoalGreyW600,),
          )
        ],
      ),
    );
  }
}
