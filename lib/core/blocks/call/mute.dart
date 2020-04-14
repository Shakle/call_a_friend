import 'package:callafriend/core/providers/phone_modules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Mute extends Bloc<bool, bool> {
  PhoneModulesProvider phoneModulesProvider = PhoneModulesProvider();

  static Mute bloc(BuildContext context)
  => BlocProvider.of<Mute>(context);

  @override
  bool get initialState => false;

  @override
  Stream<bool> mapEventToState(bool muted) async* {
    phoneModulesProvider.switchAudioMuteState(muted);
    yield muted;
  }

}