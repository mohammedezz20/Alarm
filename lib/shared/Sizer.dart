import 'package:flutter/cupertino.dart';

double getWidth(BuildContext context, double percentage) {
  var w=percentage/360;
  return MediaQuery.of(context).size.width * w;

}

double getHeight(BuildContext context, double percentage) {
  var h=percentage/780;
  return MediaQuery.of(context).size.height * h;
}