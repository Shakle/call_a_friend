import 'package:agora_rtc_engine/agora_rtc_engine.dart';

class PhoneModulesProvider {

  void switchAudioMuteState(bool muted) {
    AgoraRtcEngine.muteLocalAudioStream(muted);
  }

  void switchCameraView() {
    AgoraRtcEngine.switchCamera();
  }
}