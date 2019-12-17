import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webrtc/webrtc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc_2/blocs/app_state.dart';
import 'package:flutter_webrtc_2/blocs/app_state_bloc.dart';
import 'package:flutter_webrtc_2/blocs/app_state_events.dart';

class InCalling extends StatelessWidget {
  const InCalling({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appStateBloc = BlocProvider.of<AppStateBloc>(context);
    return BlocBuilder<AppStateBloc, AppState>(
      builder: (context, state) {
        return Stack(
          children: <Widget>[
            Positioned.fill(
              child: Transform.scale(
                scale: 2,
                alignment: Alignment.center,
                child: RTCVideoView(appStateBloc.remoteRenderer),
              ),
            ),
            Positioned(
                left: 20,
                bottom: 100,
                child: SafeArea(
                  child: Transform.scale(
                    scale: 0.3,
                    alignment: Alignment.bottomLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 480,
                        height: 640,
                        color: Color(0xffcccccc),
                        child: RTCVideoView(appStateBloc.localRenderer),
                      ),
                    ),
                  ),
                )),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: () {
                        appStateBloc.add(MuteEvent(!state.mute));
                      },
                      heroTag: 'mic',
                      backgroundColor: Colors.blueAccent.withOpacity(state.mute?0.3:1),
                      child: Icon(state.mute ? Icons.mic_off : Icons.mic),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        appStateBloc.add(FinishCallEvent());
                      },
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.redAccent,
                      child: Icon(
                        Icons.call,
                        size: 40,
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        appStateBloc
                            .add(SwitchCameraEvent(!state.isFrontCamera));
                      },
                      heroTag: 'cam',
                      child: Icon(state.isFrontCamera
                          ? Icons.camera_front
                          : Icons.camera_rear),
                    )
                  ],
                ),
              ),
            )
          ],
          alignment: Alignment.center,
        );
      },
    );
  }
}
