class GamePanel extends StatefulWidget {
  final ValueChanged<int>? onScoreChanged;

  const GamePanel({Key? key, this.onScoreChanged}) : super(key: key);

  @override
  GamePanelState createState() => GamePanelState();
}

class GamePanelState extends State<GamePanel> {
  /// 每行每列的个数
  static const int size = 4;

  /// 当上下滑动时，左右方向的偏移应该小于这个阈值，左右滑动亦然
  final double _crossAxisMaxLimit = 20.0;

  /// 当上下滑动时，上下方向的偏移应该大于这个阈值，左右滑动亦然
  final double _mainAxisMinLimit = 40.0;

  /// onPanUpdate 会回调多次，只需要第一次有效的就可以了，
  /// 在 onPanDown 时设为 true，第一次有效滑动后，设为 false
  bool _firstValidPan = true;

  final List _cellArr = List.generate(size, (_) => List<int>.generate(size, (_) => 0));

  /// 判断是否游戏结束
  bool _isGameOver = false;

  @override
  initState() {
    super.initState();
    startGame();
  }

  startGame() {
    setState(() {
      for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
          _cellArr[i][j] = 0;
        }
      }

      //随机生成两个单元格
      _fillOneEmptyCell();
      _fillOneEmptyCell();

      _isGameOver = false;
    });
  }

  /// 找到可以用于生成新数字的单元格，并生成新的数字进行填充
  _fillOneEmptyCell() {
    var emptyCellPosition = _findOneEmptyCell();
    if (emptyCellPosition != -1) {
      _cellArr[(emptyCellPosition / 4).toInt()][emptyCellPosition % 4] = _getRandomValue();
    }
  }

  /// 找到可以用于生成新数字的单元格，返回值为单元格在16个格子中的序号
  _findOneEmptyCell() {
    final List list = List<int>.generate(size, (_) => 0);
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (_cellArr[i][j] == 0) {
          list.add(i * 4 + j);
        }
      }
    }

    var position = -1;
    if (list.isNotEmpty) {
      position = list[_random(list.length)];
    }
    return position;
  }