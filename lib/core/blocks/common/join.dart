import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JoinAvailability extends Bloc<String, String> {

  static JoinAvailability bloc(BuildContext context)
  => BlocProvider.of<JoinAvailability>(context);

  @override
  String get initialState => "";

  @override
  Stream<String> mapEventToState(String channelName) async* {
    yield channelName;
  }

}