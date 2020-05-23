import 'package:flutter/material.dart';

import 'package:newbiepets_flutter/commonwidgets/alert_dialog.dart';

class AndroidAlertDialog extends PlatformAlertDialog {
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
    );
  }
}