class Mine{
  int x;
  int y;

  Mine({
    required this.x,
    required this.y,
  });
}

class Flag{
  int x;
  int y;
  bool value;

  Flag({
    required this.x,
    required this.y,
    required this.value,
  });
}

class Cell{
  int x;
  int y;
  bool isOpen;
  bool isBomb;
  int? calcNear;

  Cell({
    required this.x,
    required this.y,
    required this.isOpen,
    required this.isBomb,
    this.calcNear,
  });
}