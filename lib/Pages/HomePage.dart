import 'package:flutter/material.dart';
import 'package:live_pokemon_type_grid/Data/FocusTypeState.dart';
import 'package:live_pokemon_type_grid/Parts/EffectivenessSquare.dart';
import 'package:live_pokemon_type_grid/Data/PokemonTypes.dart';

const AXIS_TITLE_BAR_SIZE_FRACTION_LONG = 0.9;

enum BattleSide { Attacking, Defending }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusTypeState focusTypeState = FocusTypeState();

  Column typenamesColumn(BattleSide battleSide) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: DamageType.values.map(
        (value) {
          BoardPosition boardPos;
          BoardPosition boardPosCheck;
          if (battleSide == BattleSide.Attacking) {
            boardPos = BoardPosition(defending: -1, attacking: DamageType.values.indexOf(value) + 1);
            boardPosCheck = BoardPosition(defending: -2, attacking: DamageType.values.indexOf(value) + 1);
          } else {
            boardPos = BoardPosition(defending: DamageType.values.indexOf(value) + 1, attacking: -1);
            boardPosCheck = BoardPosition(defending: DamageType.values.indexOf(value) + 1, attacking: -2);
          }
          Color color = Colors.transparent;
          if (focusTypeState.getPositionColor(boardPosCheck) == FocusColor.Highlighted) {
            color = Colors.amber;
          }
          if (focusTypeState.getPositionColor(boardPos) == FocusColor.Clicked) {
            color = Colors.deepPurpleAccent;
          }
          return Expanded(
            child: MouseRegion(
              onEnter: (_) => setState(() => focusTypeState.hoverPosition = boardPos),
              onExit: (_) {
                if (focusTypeState.hoverPosition == boardPos) {
                  setState(() {
                    focusTypeState.hoverPosition = BoardPosition(defending: -1, attacking: -1);
                  });
                }
              },
              child: InkWell(
                onTap: () {
                  if (focusTypeState.boardClicks.contains(boardPos)) {
                    setState(() => focusTypeState.boardClicks.remove(boardPos));
                  } else {
                    setState(() => focusTypeState.boardClicks.add(boardPos));
                  }
                },
                child: Container(
                  decoration: BoxDecoration(color: color, border: Border.symmetric(horizontal: BorderSide(color: Colors.black))),
                  child: Center(child: Text(value.name)),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  Widget buildValueGrid() {
    List<Widget> rowChildren = [];
    for (int defending = 0; defending < DamageType.values.length; defending++) {
      List<EffectivenessSquare> collumChildren = [];
      for (int attacking = 0; attacking < DamageType.values.length; attacking++) {
        collumChildren.add(EffectivenessSquare(
          efectivenessValue: PokemonType.damageTakenFrom(DamageType.values[defending], DamageType.values[attacking]),
          onEnterCallback: (_) => setState(() => focusTypeState.hoverPosition = BoardPosition(defending: defending + 1, attacking: attacking + 1)),
          onExitCallback: (_) {
            if (focusTypeState.hoverPosition == BoardPosition(attacking: attacking + 1, defending: defending + 1)) {
              setState(() {
                focusTypeState.hoverPosition = BoardPosition(defending: -1, attacking: -1);
              });
            }
          },
          onTapCallback: () {
            BoardPosition clickPos = BoardPosition(defending: defending + 1, attacking: attacking + 1);

            if (focusTypeState.boardClicks.contains(clickPos)) {
              setState(() => focusTypeState.boardClicks.remove(clickPos));
            } else {
              setState(() => focusTypeState.boardClicks.add(clickPos));
            }
          },
          highlighted: focusTypeState.getPositionColor(BoardPosition(defending: defending + 1, attacking: attacking + 1)),
        ));
      }
      rowChildren.add(Flexible(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: collumChildren,
        ),
      ));
    }
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: rowChildren,
    );
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
              /* defending bar */
              FractionallySizedBox(
                heightFactor: 1 - AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
                widthFactor: AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
                alignment: Alignment.topRight,
                child: Container(
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [Text("Defending"), Flexible(child: RotatedBox(quarterTurns: 3, child: typenamesColumn(BattleSide.Defending)))],
                  ),
                ),
              ),

              /* attacking bar */
              FractionallySizedBox(
                widthFactor: 1 - AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
                heightFactor: AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
                alignment: Alignment.bottomLeft,
                child: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RotatedBox(quarterTurns: 3, child: Text("Attacking")),
                      Flexible(child: typenamesColumn(BattleSide.Attacking)),
                    ],
                  ),
                ),
              ),

              /* inner grid */
              FractionallySizedBox(
                heightFactor: AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
                widthFactor: AXIS_TITLE_BAR_SIZE_FRACTION_LONG,
                alignment: Alignment.bottomRight,
                child: buildValueGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
