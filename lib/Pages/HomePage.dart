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
              cornerDecoration(),

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

  FractionallySizedBox cornerDecoration() {
    TextStyle textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

    return FractionallySizedBox(
      alignment: Alignment.topLeft,
      heightFactor: 1 - AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
      widthFactor: 1 - AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
          gradient: SweepGradient(
            center: Alignment(1, 1),
            startAngle: 3.14,
            endAngle: 4.712389,
            colors: [ATTACK_COLOR, DEFENDING_COLOR],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          // alignment: AlighA,
          children: [
            FractionallySizedBox(
              alignment: Alignment.bottomLeft,
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Attacker",
                      style: textStyle,
                    )),
              ),
            ),
            FractionallySizedBox(
              alignment: Alignment.topRight,
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Container(
              alignment: Alignment.topRight,
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Defender",
                      style: textStyle,
                    )),
              ),
            ),
          ],
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
          child: RotatedBox(
            quarterTurns: 3,
            child: TypesLableColumn(
              battleSide: BattleSide.Defending,
              focusTypeState: focusTypeState,
              setHoverPos: setHoverPos,
              toggleClickPoint: toggleClickPoint,
            ),
          )),
    );
  }
}
