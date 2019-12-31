import 'package:flutter/material.dart';
import 'package:ganz_tek/res/colors.dart';
import 'package:ganz_tek/res/text_styles.dart';

class MorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MoreState();
}

class MoreState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.offWhite,
      body: Stack(
        children: <Widget>[
          Center(
            child: Text('MorePage', style: TextStylesUtils.styleAvenir20CoalGreyW600,),
          )
        ],
      ),
    );
  }
}
