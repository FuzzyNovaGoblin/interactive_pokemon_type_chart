import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:live_pokemon_type_grid/Data/FocusTypeState.dart';

class EffectivenessSquare extends StatelessWidget {
  final double efectivenessValue;

  final FocusColor highlighted;
  final void Function(PointerEnterEvent) onEnterCallback;
  final void Function(PointerExitEvent) onExitCallback;
  final void Function() onTapCallback;
  const EffectivenessSquare({
    Key? key,
    this.efectivenessValue = 1,

    required this.onEnterCallback,
    required this.onExitCallback,
    required this.onTapCallback,
    required this.highlighted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.blueGrey;
    String text = "";
    if (efectivenessValue < 1) {
      color = Colors.redAccent;
      text = "1/2";
    }
    if (efectivenessValue > 1) {
      color = Colors.green;
      text = "2";
    }
    if (efectivenessValue == 0) {
      color = Colors.black;
      text = "0";
    }
    if (this.highlighted == FocusColor.Highlighted) {
      color = Colors.amber;
    }
    if (this.highlighted == FocusColor.Clicked) {
      color = Colors.deepPurpleAccent;
    }
    return Flexible(
      child: MouseRegion(
        onExit: onExitCallback,
        onEnter: onEnterCallback,
        child: InkWell(
          onTap: onTapCallback,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: color,
                  border: Border.all(
                    color: Colors.white,
                  )),
              // color: Colors.amber,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: (efectivenessValue == 0.5) ? Colors.black : Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
