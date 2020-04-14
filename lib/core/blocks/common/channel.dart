import 'package:callafriend/core/providers/video_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Channel extends Bloc<String, String> {

  static Channel bloc(BuildContext context)
  => BlocProvider.of<Channel>(context);

  VideoCallProvider videoCallProvider = VideoCallProvider();

  @override
  String get initialState => "";

  @override
  Stream<String> mapEventToState(String channelName) async* {
    if (channelName.isNotEmpty) {
      await videoCallProvider.initChannel(channelName);
    } else {
      videoCallProvider.disposeChannel();
    }

    yield channelName;
  }

}