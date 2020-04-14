import 'package:callafriend/core/blocks/common/channel.dart';
import 'package:callafriend/core/blocks/common/join.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JoinButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JoinAvailability, String>(
        builder: (context, channel) => roundButton(context, channel),
    );
  }

  Widget roundButton(BuildContext context, String channel) {
    return Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
            backgroundColor: Colors.white,
            child: icon(channel),
            onPressed: channel.isNotEmpty
                ? () => enableChannel(context, channel)
                : null,
        ),
    );
  }

  Widget icon(String channel) {
    return Icon(
      Icons.video_call,
      color: channel.isNotEmpty ? Colors.green : Colors.grey,
      size: 28,
    );
  }

  void enableChannel(BuildContext context, String channel) {
    Channel.bloc(context).add(channel);
  }
}

