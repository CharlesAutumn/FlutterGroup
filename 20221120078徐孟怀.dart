_panelOnUpdate(DragUpdateDetails details, Offset lastPosition) {
    final currentPosition = details.globalPosition;

    if ((currentPosition.dy - lastPosition.dy).abs() > _mainAxisMinLimit &&
        (currentPosition.dx - lastPosition.dx).abs() < _crossAxisMaxLimit) {
      // 垂直方向滑动
      if (!_firstValidPan) {
        return;
      }
      if (currentPosition.dy - lastPosition.dy < 0) {
        _moveUp();
      } else if (currentPosition.dy - lastPosition.dy > 0) {
        _moveDown();
      }
      _firstValidPan = false;
    } else if ((currentPosition.dx - lastPosition.dx).abs() > _mainAxisMinLimit &&
        (currentPosition.dy - lastPosition.dy).abs() < _crossAxisMaxLimit) {
      // 水平方向滑动
      if (!_firstValidPan) {
        return;
      }
      if (currentPosition.dx - lastPosition.dx < 0) {
        _moveLeft();
      } else if (currentPosition.dx - lastPosition.dx > 0) {
        _moveRight();
      }
      _firstValidPan = false;
    }
  }

  void _moveRight() {
    setState(() {
      _horizontalMoveCells(false);
    });
    _checkGameOverOrContinue();
  }

  void _moveLeft() {
    setState(() {
      _horizontalMoveCells(true);
    });
    _checkGameOverOrContinue();
  }

  void _moveDown() {
    setState(() {
      _verticalMoveCells(false);
    });
    _checkGameOverOrContinue();
  }

  void _moveUp() {
    setState(() {
      _verticalMoveCells(true);
    });
    _checkGameOverOrContinue();
  }

  void _checkGameOverOrContinue() {
    if (canMove()) {
      _fillOneEmptyCell();
    } else {
      setState(() {
        _isGameOver = true;
      });
    }
  }