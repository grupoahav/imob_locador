import 'package:flutter/widgets.dart';

class ImobOptionsListItem {
  String title;
  Widget? leading;
  Widget? pageToOpen;

  ImobOptionsListItem(this.title, {
    this.leading,
    this.pageToOpen,
  });
}