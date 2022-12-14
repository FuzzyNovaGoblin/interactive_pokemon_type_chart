import 'package:flutter/material.dart';
import 'package:live_pokemon_type_grid/Data/BattleSide.dart';
import 'package:live_pokemon_type_grid/Data/FocusTypeState.dart';
import 'package:live_pokemon_type_grid/Data/PokemonTypes.dart';
import 'package:live_pokemon_type_grid/Parts/TypeChip.dart';

class TypesLableColumn extends StatelessWidget {
  final BattleSide battleSide;
  final FocusTypeState focusTypeState;
  final void Function(BoardPosition pos) setHoverPos;
  final void Function(BoardPosition pos) toggleClickPoint;

  const TypesLableColumn({Key? key, required this.battleSide, required this.focusTypeState, required this.setHoverPos, required this.toggleClickPoint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: DamageType.values.map(
        (damageType) {
          BoardPosition boardPos;
          if (battleSide == BattleSide.Attacking) {
            boardPos = BoardPosition(defending: null, attacking: DamageType.values.indexOf(damageType) + 1);
          } else {
            boardPos = BoardPosition(defending: DamageType.values.indexOf(damageType) + 1, attacking: null);
          }
          Color color = Colors.transparent;
          if (focusTypeState.getPositionColor(boardPos) == FocusColor.Highlighted) {
            color = Colors.amber;
          }
          if (focusTypeState.getPositionColor(boardPos) == FocusColor.Clicked) {
            color = Colors.deepPurpleAccent;
          }
          return Expanded(
            child: Stack(
              children: [
                MouseRegion(
                  onEnter: (_) => setHoverPos(boardPos),
                  onExit: (_) {
                    if (focusTypeState.hoverPosition == boardPos) {
                      setHoverPos(BoardPosition(defending: null, attacking: null));
                    }
                  },
                  child: InkWell(
                    onTap: () => toggleClickPoint(boardPos),
                    child: Container(
                      // decoration: BoxDecoration(color: color),
                      child: TypeChip(damageType: damageType),
                    ),
                  ),
                ),
                IgnorePointer(
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
