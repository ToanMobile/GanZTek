import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ganz_tek/generated/i18n.dart';
import 'package:ganz_tek/res/dimens.dart';
import 'package:ganz_tek/res/resources.dart';
import 'package:ganz_tek/res/sizebox.dart';
import 'package:ganz_tek/res/text_styles.dart';
import 'package:ganz_tek/ui/screen/widgetapp/bg_header_widget.dart';

class MorePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MoreState();
}

class MoreState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackgroundHeader(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[buildTextTitleMore(), SizeBoxUtils.hGap30, buildListMore()],
          ),
        ],
      ),
    );
  }

  Widget buildTextTitleMore() => Container(
        padding: EdgeInsets.only(top: DimensUtils.size100),
        child: Center(
          child: Text(S.of(context).tab_more, textAlign: TextAlign.center, style: TextStylesUtils.styleAvenir15BlackW600),
        ),
      );

  Widget buildListMore() {
    final image = [ImagesUtils.iconMoreNotification, ImagesUtils.iconMoreGift, ImagesUtils.iconMoreCrashBack];
    final titles = [S.of(context).tab_more_notification, S.of(context).tab_more_gift, S.of(context).tab_more_crash_back];
    final des = [S.of(context).tab_more_des_notification, S.of(context).tab_more_des_gift, S.of(context).tab_more_des_crash_back];
    return Expanded(
      flex: 1,
      child: ListView.builder(
        itemCount: titles.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: DimensUtils.size120,
            margin: EdgeInsets.only(bottom: DimensUtils.size16, right: DimensUtils.size16),
            padding: EdgeInsets.symmetric(vertical: DimensUtils.size8, horizontal: DimensUtils.size8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DimensUtils.size8),
              boxShadow: [BoxShadow(color: Color(0x1e000000), offset: Offset(0, 11), blurRadius: 36, spreadRadius: 0)],
            ),
            child: Row(
              children: <Widget>[
                Expanded(flex: 1, child: SvgPicture.asset(image[index])),
                SizeBoxUtils.wGap8,
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(titles[index], style: TextStylesUtils.styleAvenir12BlackW600),
                      SizeBoxUtils.hGap8,
                      Text(des[index], style: TextStylesUtils.styleAvenir9BrownGreyTwoW400),
                      SizeBoxUtils.hGap20,
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
