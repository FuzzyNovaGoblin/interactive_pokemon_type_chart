enum DamageType { Normal, Fire, Water, Grass, Electric, Ice, Fighting, Poison, Ground, Flying, Psychic, Bug, Rock, Ghost, Dragon, Dark, Steel, Fairy }

class PokemonType {
  // final String typename;
  // final int typeNumber; // 0 indexed starting at normal type
  // final _DamageType _damageType;

  // static int damageDealtTo(PokemonType attacker, PokemonType attacked){
  //   switch
  // }
  static double damageTakenFrom(DamageType defending, DamageType attacker) {
    switch (defending) {
      case DamageType.Normal:
        switch (attacker) {
          case DamageType.Fighting:
            return 2;
          case DamageType.Ghost:
            return 0;
          default:
            return 1;
        }

      case DamageType.Fire:
        switch (attacker) {
          case DamageType.Fire:
            return 0.5;
          case DamageType.Water:
            return 2;
          case DamageType.Grass:
            return 0.5;
          case DamageType.Ice:
            return 0.5;
          case DamageType.Ground:
            return 2;
          case DamageType.Bug:
            return 0.5;
          case DamageType.Rock:
            return 2;
          case DamageType.Steel:
            return 0.5;
          case DamageType.Fairy:
            return 0.5;
          default:
            return 1;
        }
      case DamageType.Water:
        switch (attacker) {
          case DamageType.Fire:
            return 0.5;
          case DamageType.Water:
            return 0.5;
          case DamageType.Grass:
            return 2;
          case DamageType.Electric:
            return 2;
          case DamageType.Ice:
            return 0.5;
          case DamageType.Steel:
            return 0.5;
          default:
            return 1;
        }
      case DamageType.Grass:
        switch (attacker) {
          case DamageType.Fire:
            return 2;
          case DamageType.Water:
            return 0.5;
          case DamageType.Grass:
            return 0.5;
          case DamageType.Electric:
            return 0.5;
          case DamageType.Ice:
            return 2;
          case DamageType.Poison:
            return 2;
          case DamageType.Ground:
            return 0.5;
          case DamageType.Flying:
            return 2;
          case DamageType.Bug:
            return 2;
          default:
            return 1;
        }
      case DamageType.Electric:
        switch (attacker) {
          case DamageType.Electric:
            return 0.5;
          case DamageType.Ground:
            return 2;
          case DamageType.Flying:
            return 0.5;
          case DamageType.Steel:
            return 0.5;
          default:
            return 1;
        }
      case DamageType.Ice:
        switch (attacker) {
          case DamageType.Fire:
            return 2;
          case DamageType.Ice:
            return 0.5;
          case DamageType.Fighting:
            return 2;
          case DamageType.Rock:
            return 2;
          case DamageType.Steel:
            return 2;
          default:
            return 1;
        }
      case DamageType.Fighting:
        switch (attacker) {
          case DamageType.Flying:
            return 2;
          case DamageType.Psychic:
            return 2;
          case DamageType.Bug:
            return 1/2;
          case DamageType.Rock:
            return 1/2;
          case DamageType.Dark:
            return 1/2;
          case DamageType.Fairy:
            return 2;
          default:
            return 1;
        }
      case DamageType.Poison:
        switch (attacker) {
          case DamageType.Grass:
            return 1/2;
          case DamageType.Fighting:
            return 1/2;
          case DamageType.Poison:
            return 1/2;
          case DamageType.Ground:
            return 2;
          case DamageType.Psychic:
            return 2;
          case DamageType.Bug:
            return 1/2;
          case DamageType.Fairy:
            return 1/2;
          default:
            return 1;
        }
      case DamageType.Ground:
        switch (attacker) {
          case DamageType.Water:
            return 2;
          case DamageType.Grass:
            return 2;
          case DamageType.Electric:
            return 0;
          case DamageType.Ice:
            return 2;
          case DamageType.Poison:
            return 1/2;
          case DamageType.Rock:
            return 1/2;
          default:
            return 1;
        }
      case DamageType.Flying:
        switch (attacker) {
          case DamageType.Grass:
            return 1/2;
          case DamageType.Electric:
            return 2;
          case DamageType.Ice:
            return 2;
          case DamageType.Fighting:
            return 1/2;
          case DamageType.Ground:
            return 0;
          case DamageType.Bug:
            return 1/2;
          case DamageType.Rock:
            return 2;
          default:
            return 1;
        }
      case DamageType.Psychic:
        switch (attacker) {
          case DamageType.Fighting:
            return 1/2;
          case DamageType.Psychic:
            return 1/2;
          case DamageType.Bug:
            return 2;
          case DamageType.Ghost:
            return 2;
          case DamageType.Dark:
            return 2;
          default:
            return 1;
        }
      case DamageType.Bug:
        switch (attacker) {
          case DamageType.Fire:
            return 2;
          case DamageType.Grass:
            return 1/2;
          case DamageType.Fighting:
            return 1/2;
          case DamageType.Ground:
            return 1/2;
          case DamageType.Flying:
            return 2;
          case DamageType.Rock:
            return 2;
          default:
            return 1;
        }
      case DamageType.Rock:
        switch (attacker) {
          case DamageType.Normal:
            return 1/2;
          case DamageType.Fire:
            return 1/2;
          case DamageType.Water:
            return 2;
          case DamageType.Grass:
            return 2;
          case DamageType.Fighting:
            return 2;
          case DamageType.Poison:
            return 1/2;
          case DamageType.Ground:
            return 2;
          case DamageType.Flying:
            return 1/2;
          case DamageType.Steel:
            return 2;
          default:
            return 1;
        }
      case DamageType.Ghost:
        switch (attacker) {
          case DamageType.Normal:
            return 0;
          case DamageType.Fighting:
            return 0;
          case DamageType.Poison:
            return 1/2;
          case DamageType.Bug:
            return 1/2;
          case DamageType.Ghost:
            return 2;
          case DamageType.Dark:
            return 2;
          default:
            return 1;
        }
      case DamageType.Dragon:
        switch (attacker) {
          case DamageType.Fire:
            return 1/2;
          case DamageType.Water:
            return 1/2;
          case DamageType.Grass:
            return 1/2;
          case DamageType.Electric:
            return 1/2;
          case DamageType.Ice:
            return 2;
          case DamageType.Ice:
            return 2;
          case DamageType.Dragon:
            return 2;
          case DamageType.Fairy:
            return 2;
          default:
            return 1;
        }
      case DamageType.Dark:
        switch (attacker) {
          case DamageType.Fighting:
            return 2;
          case DamageType.Psychic:
            return 0;
          case DamageType.Bug:
            return 2;
          case DamageType.Ghost:
            return 1/2;
          case DamageType.Dark:
            return 1/2;
          case DamageType.Fairy:
            return 2;
          default:
            return 1;
        }
      case DamageType.Steel:
        switch (attacker) {
          case DamageType.Normal:
            return 1/2;
          case DamageType.Fire:
            return 2;
          case DamageType.Grass:
            return 1/2;
          case DamageType.Ice:
            return 1/2;
          case DamageType.Fighting:
            return 2;
          case DamageType.Poison:
            return 0;
          case DamageType.Ground:
            return 2;
          case DamageType.Flying:
            return 1/2;
          case DamageType.Psychic:
            return 1/2;
          case DamageType.Bug:
            return 1/2;
          case DamageType.Rock:
            return 1/2;
          case DamageType.Dragon:
            return 1/2;
          case DamageType.Steel:
            return 1/2;
          case DamageType.Fairy:
            return 1/2;
          default:
            return 1;
        }
      case DamageType.Fairy:
        switch (attacker) {
          case DamageType.Fighting:
            return 1/2;
          case DamageType.Poison:
            return 2;
          case DamageType.Bug:
            return 1/2;
          case DamageType.Dragon:
            return 0;
          case DamageType.Dark:
            return 1/2;
          case DamageType.Steel:
            return 2;
          default:
            return 1;
        }
    }

    return 1;
  }
}

// class Normal extends PokemonType{

//   @override
//   int damageDealtTo(PokemonType attacked) {

//       switch attacked{

//       }
//     }

//     @override
//     int damageTakenFrom(PokemonType attacker) {
//     // TODO: implement damageTakenFrom
//     throw UnimplementedError();
//   }

// }
