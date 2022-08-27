import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:live_pokemon_type_grid/Data/FocusTypeState.dart';
import 'package:live_pokemon_type_grid/Parts/TypesLableColumn.dart';

import '../Data/BattleSide.dart';
import '../Parts/MatchupGrid.dart';

const AXIS_TITLE_BAR_SIZE_FRACTION_LONG = 0.8;

const ATTACK_COLOR = Colors.red;
const DEFENDING_COLOR = Colors.blue;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusTypeState focusTypeState = FocusTypeState();

  void setHoverPos(BoardPosition pos) {
    setState(() => this.focusTypeState.hoverPosition = pos);
  }

  void toggleClickPoint(BoardPosition pos) {
    if (focusTypeState.boardClicks.contains(pos)) {
      setState(() => focusTypeState.boardClicks.remove(pos));
    } else {
      setState(() => focusTypeState.boardClicks.add(pos));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            fit: StackFit.expand,
            children: [
              defendingBar(),
              attackingBar(),

              /* gradient decoration */
              FractionallySizedBox(
alignment: Alignment.topLeft,
                heightFactor: 1 - AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
                widthFactor: 1 - AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                    gradient: SweepGradient(center: Alignment(1,1), startAngle: 3.14, endAngle: 4.712389, colors: [ATTACK_COLOR, DEFENDING_COLOR])
                    // gradient: LinearGradient(begin: Alignment(0.5, 1.0), end: Alignment(1, 0.5), colors: [ATTACK_COLOR, DEFENDING_COLOR])

                  ),
                  // decoration: ShapeDecoration(shape: ),
                ),
              ),

              /* inner grid */
              FractionallySizedBox(
                heightFactor: AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
                widthFactor: AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
                alignment: Alignment.bottomRight,
                child: MatchupGrid(focusTypeState: this.focusTypeState, setHoverPos: setHoverPos, toggleClickPoint: toggleClickPoint),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FractionallySizedBox attackingBar() {
    return FractionallySizedBox(
      widthFactor: 1 - AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
      heightFactor: AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
      alignment: Alignment.bottomLeft,
      child: Container(
        color: ATTACK_COLOR,
        child: TypesLableColumn(
          battleSide: BattleSide.Attacking,
          focusTypeState: focusTypeState,
          setHoverPos: setHoverPos,
          toggleClickPoint: toggleClickPoint,
        ),
      ),
    );
  }

  FractionallySizedBox defendingBar() {
    return FractionallySizedBox(
      heightFactor: 1 - AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
      widthFactor: AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
      alignment: Alignment.topRight,
      child: Container(
        color: DEFENDING_COLOR,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Defending"),
            Flexible(
              child: RotatedBox(
                quarterTurns: 3,
                child: TypesLableColumn(
                  battleSide: BattleSide.Defending,
                  focusTypeState: focusTypeState,
                  setHoverPos: setHoverPos,
                  toggleClickPoint: toggleClickPoint,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
