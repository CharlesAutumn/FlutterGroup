/// 生成新的数字，90%几率生成2，10%几率生成4
  _getRandomValue() {
    var rand = _random(10);
    var value = 2;
    if (rand >= 9) {
      value = 4;
    }
    return value;
  }

  /// 生成随机数，0=<结果<max
  _random(int maxValue) {
    return Random().nextInt(maxValue);
  }

  /// 判断Map中的数字是否都不为0
  bool isGameMapAllNotZero() {
    bool isAllNotZero = true;
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        if (_cellArr[i][j] == 0) {
          isAllNotZero = false;
          break;
        }
      }
    }
    return isAllNotZero;
  }

  /// 处理用户手势
  Offset _panelOnPanDown(DragDownDetails details) {
    // 后续得到的相应
    _firstValidPan = true;

    //按下后，记录当前 position
    return details.globalPosition;
  }