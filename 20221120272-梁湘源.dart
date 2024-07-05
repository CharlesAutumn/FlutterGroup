/*
     判断是否还可以移动。
     1、当前单元格是否为0；
     2、当前单元格和右侧单元格是否相等；
     3、当前单元格和下方单元格是否相等。
     */
  canMove() {
    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 4; j++) {
        var cell = _cellArr[i][j];
        if (cell != 0) {
          //和右侧单元格比较，是否相等
          if (j < 3 && _cellArr[i][j] == _cellArr[i][j + 1]) {
            return true;
          }
          //和下方单元格比较，是否相等
          if (i < 3 && _cellArr[i][j] == _cellArr[i + 1][j]) {
            return true;
          }
        } else {
          return true;
        }
      }
    }
    return false;
  }

  /// 将单元格数向左或向右移动，移除undefined并对相邻相同数进行叠加
  /// toLeft表示是否是向左
  _horizontalMoveCells(bool toLeft) {
    for (var i = 0; i < 4; i++) {
      var newArr = List<int>.generate(4, (_) => 0);
      for (var j = 0; j < 4; j++) {
        newArr[j] = _cellArr[i][j];
      }
      var resultArr = _removeZerosAndAdd(newArr, toLeft);
      for (var j = 0; j < 4; j++) {
        _cellArr[i][j] = resultArr[j];
      }
    }
  }

  /// 将单元格数向下或向上移动，移除undefined并对相邻相同数进行叠加
  /// toUp表示是否是向上
  _verticalMoveCells(bool toUp) {
    for (var i = 0; i < 4; i++) {
      var newArr = List<int>.generate(4, (_) => 0);
      for (var j = 0; j < 4; j++) {
        newArr[j] = _cellArr[j][i];
      }
      var resultArr = _removeZerosAndAdd(newArr, toUp);
      for (var j = 0; j < 4; j++) {
        _cellArr[j][i] = resultArr[j];
      }
    }
  }

  /*
    1、去掉数组中的零，向头或向尾压缩数组。
      0,4,0,4向左压缩变成：4,4,0,0. 向右压缩变成：0,0,4,4
    2、相邻的数如果相同，则进行相加运算。
      4,4,0,0向左叠加变成：8,0,0,0. 向右叠加变成：0,0,0,8
      toHead表示是否是头压缩
   */
  _removeZerosAndAdd(List arr, bool toHead) {
    var newArr = List<int>.generate(arr.length, (_) => 0);
    var arrWithoutZero = arr.where((element) => element != 0); //去掉所有的零

    if (arrWithoutZero.isEmpty) return newArr;
    if (toHead) {
      for (var i = 0; i < arrWithoutZero.length; i++) {
        newArr[i] = arrWithoutZero.elementAt(i);
      }

      //对相邻相同的数进行叠加
      for (var i = 0; i < newArr.length - 1; i++) {
        if (newArr[3 - i] == newArr[2 - i] && newArr[3 - i] != 0) {
          newArr[3 - i] = 0;
          newArr[2 - i] *= 2;
        }
      }
    } else {
      for (var i = 0; i < arrWithoutZero.length; i++) {
        newArr[newArr.length - i - 1] = arrWithoutZero.elementAt(arrWithoutZero.length - i - 1);
      }

      //对相邻相同的数进行叠加
      for (var i = 0; i < newArr.length - 1; i++) {
        if (newArr[i] == newArr[i + 1] && newArr[i] != 0) {
          newArr[i] = 0;
          newArr[i + 1] *= 2;
        }
      }
    }

    return newArr;
  }
