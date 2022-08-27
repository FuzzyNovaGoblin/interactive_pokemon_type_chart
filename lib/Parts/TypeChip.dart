import 'package:flutter/material.dart';
import 'package:live_pokemon_type_grid/Data/PokemonTypes.dart';
import 'package:live_pokemon_type_grid/Data/TypeColors.dart';

class TypeChip extends StatelessWidget {
  final DamageType damageType;
  const TypeChip({Key? key, required this.damageType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: TypeColors.colorFromType(damageType)),
      decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), color: TypeColors.colorFromType(damageType)),
      // Color: TypeColors.colorFromType(damageType),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Text(
              damageType.name,
              style: TextStyle(color: TypeColors.textColorFromType(damageType), fontWeight: FontWeight.bold, textBaseline: TextBaseline.ideographic),
            ),
          ),
        ),
      ),
    );
  }
}
