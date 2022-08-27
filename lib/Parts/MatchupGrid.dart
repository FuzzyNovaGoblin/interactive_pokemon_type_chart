import 'package:flutter/material.dart';
import 'package:live_pokemon_type_grid/Data/FocusTypeState.dart';
import 'package:live_pokemon_type_grid/Data/PokemonTypes.dart';
import 'package:live_pokemon_type_grid/Parts/EffectivenessSquare.dart';

class MatchupGrid extends StatelessWidget {
  final void Function(BoardPosition pos) setHoverPos;
  final void Function(BoardPosition pos) toggleClickPoint;
  final FocusTypeState focusTypeState;

  const MatchupGrid({Key? key, required this.setHoverPos, required this.focusTypeState, required this.toggleClickPoint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> rowChildren = [];
    for (int defending = 0; defending < DamageType.values.length; defending++) {
      List<EffectivenessSquare> columnChildren = [];
      for (int attacking = 0; attacking < DamageType.values.length; attacking++) {
        BoardPosition pos = BoardPosition(defending: defending + 1, attacking: attacking + 1);

        columnChildren.add(EffectivenessSquare(
          efectivenessValue: PokemonType.damageTakenFrom(DamageType.values[defending], DamageType.values[attacking]),
          onEnterCallback: (_) => setHoverPos(pos),
          onExitCallback: (_) {
            if (focusTypeState.hoverPosition == pos) {
              setHoverPos(BoardPosition(defending: null, attacking: null));
            }
          },
          onTapCallback: () => toggleClickPoint(pos),
          highlighted: focusTypeState.getPositionColor(pos),
        ));
      }
      rowChildren.add(Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: columnChildren,
      ));
    }
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: rowChildren,
    );
  }
}
