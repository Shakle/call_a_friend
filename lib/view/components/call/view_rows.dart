import 'package:callafriend/core/blocks/call/view.dart';
import 'package:callafriend/core/providers/video_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoViews extends StatefulWidget {
  @override
  _VideoViewsState createState() => _VideoViewsState();
}

class _VideoViewsState extends State<VideoViews> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,() {
      VideoCallProvider.channelUsers.addListener(manageUsers);
    });
  }

  void manageUsers() {
    if (context != null) {
      View.bloc(context).add(VideoCallProvider.channelUsers.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<View, List<Widget>>(
      builder: (context, views) {
        return viewRows(views);
      }
    );
  }

  Widget viewRows(List<Widget> views) {
    return Container(
      child: Column(
        children: getViews(views),
      ),
    );
  }

  List<Widget> getViews(List<Widget> views) {
    int firstUser = 0;
    int secondUser = 1;
    int thirdUser = 2;
    int fourthUser = 3;
    int fifthUser = 4;

    switch (views.length) {
      case 1: return <Widget>[
        videoView(views[firstUser])
      ];
      case 2: return <Widget>[
        expandedVideoRow([views[firstUser]]),
        expandedVideoRow([views[secondUser]]),
      ];
      case 3: return <Widget>[
        expandedVideoRow(views.sublist(firstUser, thirdUser)),
        expandedVideoRow(views.sublist(thirdUser, fourthUser))
      ];
      case 4: return <Widget>[
        expandedVideoRow(views.sublist(firstUser, thirdUser)),
        expandedVideoRow(views.sublist(thirdUser, fifthUser))
      ];
      default: return <Widget>[];
    }
  }

  /// Video view wrapper
  Widget videoView(view) {
    return Expanded(
        child: Container(child: view),
    );
  }

  /// Video view row wrapper
  Widget expandedVideoRow(List<Widget> views) {
    final List<Widget> wrappedViews = views.map<Widget>(videoView).toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }
}
