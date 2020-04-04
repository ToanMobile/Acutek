import 'package:flutter/material.dart';
import 'package:blendtv/res/colors.dart';
import 'package:blendtv/res/text_styles.dart';

class ChannelListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChannelListState();
}

class ChannelListState extends State<ChannelListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Text('MoviesPage', style: TextStylesUtils().styleMedium20TextSelect),
          )
        ],
      ),
    );
  }
}
