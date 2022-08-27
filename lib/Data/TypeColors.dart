import 'package:flutter/material.dart';
import 'package:live_pokemon_type_grid/Data/PokemonTypes.dart';

class TypeColors {
  Color b = Colors.black;
  static const Color normal = Color.fromARGB(255, 168, 168, 120);
  static const Color fire = Color.fromARGB(255, 240, 128, 48);
  static const Color water = Color.fromARGB(255, 104, 122, 240);
  static const Color grass = Color.fromARGB(255, 120, 200, 80);
  static const Color electric = Color.fromARGB(255, 248, 208, 48);
  static const Color ice = Color.fromARGB(255, 152, 216, 216);
  static const Color fighting = Color.fromARGB(255, 192, 48, 40);
  static const Color poison = Color.fromARGB(255, 160, 64, 160);
  static const Color ground = Color.fromARGB(255, 224, 192, 104);
  static const Color flying = Color.fromARGB(255, 168, 133, 240);
  static const Color psychic = Color.fromARGB(255, 248, 88, 136);
  static const Color bug = Color.fromARGB(255, 168, 184, 32);
  static const Color rock = Color.fromARGB(255, 184, 160, 56);
  static const Color ghost = Color.fromARGB(255, 112, 88, 152);
  static const Color dragon = Color.fromARGB(255, 112, 56, 248);
  static const Color dark = Color.fromARGB(255, 112, 88, 72);
  static const Color steel = Color.fromARGB(255, 184, 184, 208);
  static const Color fairy = Color.fromARGB(255, 255, 155, 255);
  static const Color normalColor = Color.fromARGB(255, 168, 168, 120);

  static Color colorFromType(DamageType damageType) {
    switch (damageType) {
      case DamageType.Normal:
        return normal;
      case DamageType.Fire:
        return fire;
      case DamageType.Water:
        return water;
      case DamageType.Grass:
        return grass;
      case DamageType.Electric:
        return electric;
      case DamageType.Ice:
        return ice;
      case DamageType.Fighting:
        return fighting;
      case DamageType.Poison:
        return poison;
      case DamageType.Ground:
        return ground;
      case DamageType.Flying:
        return flying;
      case DamageType.Psychic:
        return psychic;
      case DamageType.Bug:
        return bug;
      case DamageType.Rock:
        return rock;
      case DamageType.Ghost:
        return ghost;
      case DamageType.Dragon:
        return dragon;
      case DamageType.Dark:
        return dark;
      case DamageType.Steel:
        return steel;
      case DamageType.Fairy:
        return fairy;
    }
  }

  static Color textColorFromType(DamageType damageType) {
    switch (damageType) {
      case DamageType.Electric:
        return Colors.black;
      case DamageType.Ice:
        return Colors.black;
      default:
        return Colors.white;
    }
  }
}
