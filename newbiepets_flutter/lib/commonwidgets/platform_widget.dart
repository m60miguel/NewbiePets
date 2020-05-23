import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newbiepets_flutter/commonwidgets/android_alert_dialog.dart';
import 'package:newbiepets_flutter/commonwidgets/ios_alert_dialog.dart';

abstract class PlatformWidget extends StatelessWidget {
  //Widget buildCupertinoWidget(BuildContext context);
  //Widget buildMaterialWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      //return buildCupertinoWidget(context);
      return AndroidAlertDialog();
    } else {
      //return buildMaterialWidget(context);
      return IosAlertDialog();
    }
  }
}
