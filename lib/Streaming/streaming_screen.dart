
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

class LivePage extends StatelessWidget {
  final String liveID;
  final bool isHost;

  // ignore: use_super_parameters
  const LivePage({Key? key, required this.liveID, this.isHost = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random rand = Random();
    const List<String> names = ['John', 'Jessie', 'Daniel', 'Brown', 'Doe', 'Saad', 'Saleem'];
    final String userName = names[rand.nextInt(6)];
    final int userID = rand.nextInt(3000000);
    const int appID = 0;
    const String appSign = 'Your app Sign in';
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: appID,// Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: appSign,// Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: userID.toString(),
        userName: userName,
        liveID: liveID,
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
        events: ZegoUIKitPrebuiltLiveStreamingEvents(
          onError: (error) => debugPrint('Streaming Error : $error')
        ),
      ),
    );
  }
}