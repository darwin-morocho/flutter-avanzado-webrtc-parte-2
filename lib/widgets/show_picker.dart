import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc_2/blocs/app_state.dart';
import 'package:flutter_webrtc_2/blocs/app_state_bloc.dart';
import 'package:flutter_webrtc_2/blocs/app_state_events.dart';

class ShowPicker extends StatelessWidget {
  const ShowPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appStateBloc = BlocProvider.of<AppStateBloc>(context);
    return BlocBuilder<AppStateBloc, AppState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Selecciona tu heroe",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10),
            Wrap(
              children: state.heroes.values.map((hero) {
                return AbsorbPointer(
                  absorbing: hero.isTaken,
                  child: Opacity(
                    opacity: hero.isTaken ? 0.3 : 1,
                    child: CupertinoButton(
                      onPressed: () {
                        appStateBloc.add(PickHeroEvent(hero.name));
                      },
                      padding: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          hero.avatar,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        );
      },
    );
  }
}
