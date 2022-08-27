import 'dart:collection';

class BoardPosition {
  int attacking;
  int defending;
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
      : hoverPosition = BoardPosition(attacking: -1, defending: -1),
        boardClicks = HashSet();

  FocusColor getPositionColor(BoardPosition position) {

    if (boardClicks.contains(position)) {
      return FocusColor.Clicked;
    } else if (position.attacking == this.hoverPosition.attacking || position.defending == this.hoverPosition.defending) {
      return FocusColor.Highlighted;
    } else {
      for (int i = 0; i < boardClicks.length; i++) {
        if ((boardClicks.elementAt(i).attacking == position.attacking && position.attacking != 0) || boardClicks.elementAt(i).defending == position.defending) {
          return FocusColor.Highlighted;
        }
      }
      return FocusColor.Normal;
    }
  }
}
