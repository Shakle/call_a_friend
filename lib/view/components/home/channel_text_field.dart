
import 'package:callafriend/core/blocks/common/channel.dart';
import 'package:callafriend/core/blocks/common/join.dart';
import 'package:flutter/material.dart';

class ChannelTextField extends StatefulWidget {
  @override
  _ChannelTextFieldState createState() => _ChannelTextFieldState();
}

class _ChannelTextFieldState extends State<ChannelTextField> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return channelTextField(context);
  }

  Widget channelTextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.2,
      ),
      child: TextField(
        textAlign: TextAlign.center,
        maxLength: 10,
        controller: textEditingController,
        onChanged: (String text) {
          String channelName = text.trim();
          if (channelName.isEmpty) {
            textEditingController.text = "";
          }
          JoinAvailability.bloc(context).add(channelName);
        },
        onSubmitted: (String text) => Channel.bloc(context).add(text.trim()),
        decoration: InputDecoration(
          labelText: "Channel",
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          counterText: "",
        ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
