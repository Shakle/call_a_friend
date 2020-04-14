import 'package:callafriend/core/blocks/call/view.dart';
import 'package:callafriend/core/blocks/common/channel.dart';
import 'package:callafriend/view/components/call/toolbar.dart';
import 'package:callafriend/view/components/call/view_rows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => View(),
      child: BlocBuilder<Channel, String>(
        builder: (context, channel) => callLayout(channel, context),
      ),
    );
  }

  Widget callLayout(String channel, BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(channel),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: <Widget>[
            VideoViews(),
            ToolBar(),
          ],
        ),
      ),
    );
  }

}