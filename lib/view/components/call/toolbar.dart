import 'package:callafriend/core/blocks/call/mute.dart';
import 'package:callafriend/core/blocks/common/channel.dart';
import 'package:callafriend/core/providers/phone_modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToolBar extends StatelessWidget {
  final PhoneModulesProvider phoneModulesController = PhoneModulesProvider();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Mute(),
      child: toolbar(context),
    );
  }

  Widget toolbar(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          muteButton(),
          endCallButton(context),
          cameraSwitch(),
        ],
      ),
    );
  }

  Widget muteButton() {
    return BlocBuilder<Mute, bool>(
      builder: (BuildContext context, muted) {
        return RawMaterialButton(
          onPressed: () => Mute.bloc(context).add(muted = !muted),
          child: Icon(
            muted ? Icons.mic_off : Icons.mic,
            color: muted ? Colors.white : Colors.blueAccent,
            size: 20.0,
          ),
          shape: CircleBorder(),
          elevation: 2.0,
          fillColor: muted ? Colors.blueAccent : Colors.white,
          padding: const EdgeInsets.all(12.0),
        );
      },
    );
  }

  Widget endCallButton(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => Channel.bloc(context).add(""),
      child: Icon(
        Icons.call_end,
        color: Colors.white,
        size: 35.0,
      ),
      shape: CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.redAccent,
      padding: const EdgeInsets.all(15.0),
    );
  }

  Widget cameraSwitch() {
    return RawMaterialButton(
      onPressed: () => phoneModulesController.switchCameraView(),
      child: Icon(
        Icons.switch_camera,
        color: Colors.blueAccent,
        size: 20.0,
      ),
      shape: CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(12.0),
    );
  }

}
