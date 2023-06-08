class Cell {
  bool isOpen;
  bool isBomb;
  bool? isFlag;
  int index;

  Cell({
    required this.isOpen,
    required this.isBomb,
    this.isFlag,
    required this.index,
  });
}
