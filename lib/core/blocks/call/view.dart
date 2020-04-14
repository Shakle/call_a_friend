import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:callafriend/core/providers/video_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class View extends Bloc<List<int>, List<Widget>> {

  static View bloc(BuildContext context)
  => BlocProvider.of<View>(context);

  VideoCallProvider videoCallProvider = VideoCallProvider();

  Widget defaultView = AgoraRenderWidget(0, local: true, preview: true);

  @override
  List<Widget> get initialState => [
    defaultView,
  ];

  @override
  Stream<List<Widget>> mapEventToState(List<int> users) async* {
    yield getRenderViews(users);
  }

  List<Widget> getRenderViews(List<int> users) {
    List<Widget> list = [
      defaultView,
    ];

    for (int uid in users) {
      list.add(AgoraRenderWidget(uid, local: false, preview: true));
    }

    return list;
  }

}