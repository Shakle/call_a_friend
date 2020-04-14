import 'package:callafriend/view/screens/call.dart';
import 'package:callafriend/view/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class Navigation extends Bloc<String, Widget> {

  static Navigation bloc(BuildContext context)
  => BlocProvider.of<Navigation>(context);

  @override
  Widget get initialState => HomeScreen();

  @override
  Stream<Widget> mapEventToState(String channel) async* {
    if (channel == null || channel.isEmpty) yield HomeScreen();
    else yield CallScreen();
  }

}