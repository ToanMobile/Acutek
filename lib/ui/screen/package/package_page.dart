import 'package:flutter/material.dart';
import 'package:blendtv/res/colors.dart';
import 'package:blendtv/res/text_styles.dart';

class PackagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PackageState();
}

class PackageState extends State<PackagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Text('PackageState', style: TextStylesUtils().styleMedium20TextSelect),
          )
        ],
      ),
    );
  }
}
