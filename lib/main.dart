import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/blocks/common/channel.dart';
import 'core/blocks/common/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );

  return runApp(CallAFriendApp());
}

class CallAFriendApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return applicationBuilder();
  }

  Widget applicationBuilder() {
    return MultiBlocProvider(
        providers: [
          BlocProvider<Channel>(create: (_) => Channel()),
          BlocProvider<Navigation>(create: (_) => Navigation()),
        ],
        child: application(),
    );
  }
  
  Widget application() {
    return MaterialApp(
      title: 'Call a friend',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: screen(),
    );
  }

  Widget screen() {
    return BlocConsumer<Channel, String>(
      listener: (BuildContext context, String channel) {
        Navigation.bloc(context).add(channel);
      },
      builder: (BuildContext context, String screen) {
        return Navigation.bloc(context).state;
      },
    );
  }
}
