import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:callafriend/core/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VideoCallProvider {

  static ValueNotifier<List<int>> channelUsers = ValueNotifier([]);

  // Initializes channel stream
  Future<void> initChannel(String channelName) async {
    await initAgoraRtcEngine();
    _addAgoraEventHandlers();
    await AgoraRtcEngine.enableWebSdkInteroperability(true);
    await AgoraRtcEngine.setParameters(
        '''{\"che.video.lowBitRateStreamParameter\":{\"width\":320,\"height\":180,\"frameRate\":15,\"bitRate\":140}}''');
    await AgoraRtcEngine.joinChannel(null, channelName, null, 0);
  }

  // Cancels channel stream
  void disposeChannel() {
    channelUsers.value = [];
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    channelUsers.notifyListeners();
    AgoraRtcEngine.leaveChannel();
    AgoraRtcEngine.destroy();
  }

  /// Create agora sdk instance and initialize
  Future<void> initAgoraRtcEngine() async {
    await AgoraRtcEngine.create(Settings.agoraId);
    await AgoraRtcEngine.enableVideo();
  }
  /// Add agora event handlers
  void _addAgoraEventHandlers() {
    AgoraRtcEngine.onError = (dynamic code) {
      Fluttertoast.showToast(msg: 'error: $code');
    };

    AgoraRtcEngine.onUserJoined = (int uid, int elapsed) {
      channelUsers.value.add(uid);
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      channelUsers.notifyListeners();
    };

    AgoraRtcEngine.onLeaveChannel = () {
      channelUsers.value.clear();
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      channelUsers.notifyListeners();
    };


    AgoraRtcEngine.onUserOffline = (int uid, int reason) {
      channelUsers.value.remove(uid);
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      channelUsers.notifyListeners();
    };

  }

}