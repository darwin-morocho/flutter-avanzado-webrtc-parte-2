import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc_2/blocs/app_state.dart';
import 'package:flutter_webrtc_2/blocs/app_state_bloc.dart';
import 'package:flutter_webrtc_2/blocs/app_state_events.dart';

class Incomming extends StatelessWidget {
  const Incomming({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appStateBloc = BlocProvider.of<AppStateBloc>(context);
    return BlocBuilder<AppStateBloc, AppState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                state.him.avatar,
                width: 100,
              ),
            ),
            SizedBox(height: 10),
            Text("Llamada entrante"),
            Text(state.him.name),
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    appStateBloc.add(AcceptOrDeclineEvent(true));
                  },
                  backgroundColor: Colors.green,
                  child: Icon(Icons.call),
                ),
                SizedBox(width: 80),
                FloatingActionButton(
                  onPressed: () {
                    appStateBloc.add(AcceptOrDeclineEvent(false));
                  },
                  backgroundColor: Colors.redAccent,
                  child: Icon(Icons.call_end),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
