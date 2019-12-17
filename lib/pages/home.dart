import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc_2/blocs/app_state.dart';
import 'package:flutter_webrtc_2/blocs/app_state_bloc.dart';
import 'package:flutter_webrtc_2/blocs/app_state_events.dart';
import 'package:flutter_webrtc_2/widgets/calling.dart';
import 'package:flutter_webrtc_2/widgets/in_calling.dart';
import 'package:flutter_webrtc_2/widgets/incomming.dart';
import 'package:flutter_webrtc_2/widgets/show_picker.dart';
import 'package:flutter_webrtc_2/widgets/connected.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appStateBloc = BlocProvider.of<AppStateBloc>(context);

    return Scaffold(
      body: Center(
        child: BlocBuilder<AppStateBloc, AppState>(
          builder: (BuildContext context, AppState state) {
            switch (state.status) {
              case Status.loading:
                return CupertinoActivityIndicator(radius: 15);
              case Status.showPicker:
                return ShowPicker();
              case Status.connected:
                return Connected();
              case Status.calling:
                return Calling();
              case Status.inCalling:
                return InCalling();
              case Status.incommig:
                return Incomming();
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
