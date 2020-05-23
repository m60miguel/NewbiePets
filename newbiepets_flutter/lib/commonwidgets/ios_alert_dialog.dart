import 'package:flutter/cupertino.dart';

import 'package:newbiepets_flutter/commonwidgets/alert_dialog.dart';

class IosAlertDialog extends PlatformAlertDialog {
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
    );
  }
}