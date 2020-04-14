import 'package:callafriend/core/blocks/common/join.dart';
import 'package:callafriend/view/components/home/channel_text_field.dart';
import 'package:callafriend/view/components/home/description_text.dart';
import 'package:callafriend/view/components/home/join_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.all(15),
        child: BlocProvider<JoinAvailability>(
            create: (_) => JoinAvailability(),
            child: idleLayout(),
        ),
      ),
    );
  }

  Widget idleLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TextBlock(),
        ChannelTextField(),
        SizedBox(height: 5),
        JoinButton(),
      ],
    );
  }


}
