import 'dart:collection';

class BoardPosition {
  int? attacking;
  int? defending;
  BoardPosition({required this.defending, required this.attacking});

  @override
  bool operator ==(covariant BoardPosition other) => attacking == other.attacking && defending == other.defending;

  @override
  int get hashCode => "$defending $attacking".hashCode;
}

enum FocusColor { Clicked, Highlighted, Normal }

class FocusTypeState {
  BoardPosition hoverPosition;
  HashSet<BoardPosition> boardClicks;

  FocusTypeState()
      : hoverPosition = BoardPosition(attacking: null, defending: null),
        boardClicks = HashSet();

  FocusColor getPositionColor(BoardPosition position) {
    // print("hover position  attacking: ${hoverPosition.attacking} defending: ${hoverPosition.defending}");

    if (boardClicks.contains(position)) {
      return FocusColor.Clicked;
    } else if ((position.attacking == this.hoverPosition.attacking && this.hoverPosition.attacking != null) || (position.defending == this.hoverPosition.defending && this.hoverPosition.defending != null)) {
    // print("here\nhover position  attacking: ${hoverPosition.attacking} defending: ${hoverPosition.defending}\nposition  attacking: ${position.attacking} defending: ${position.defending}");
    //   print("");
      return FocusColor.Highlighted;
    } else {
      for (int i = 0; i < boardClicks.length; i++) {
        if ((boardClicks.elementAt(i).attacking == position.attacking && position.attacking != null) || (boardClicks.elementAt(i).defending == position.defending && position.defending != null)) {
          return FocusColor.Highlighted;
        }
      }
      return FocusColor.Normal;
    }
  }
}
