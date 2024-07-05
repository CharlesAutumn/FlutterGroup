 Widget build(BuildContext context) {
    if (_isGameOver) {
      return Stack(
        children: [_buildGamePanel(context), _buildGameOverMask(context)],
      );
    } else {
      return _buildGamePanel(context);
    }
  }

  Widget _buildGamePanel(BuildContext context) {
    double minSize = min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    Offset lastPosition = Offset.zero;
    return GestureDetector(
      onPanDown: (DragDownDetails details) {
        lastPosition = _panelOnPanDown(details);
      },
      onPanUpdate: (DragUpdateDetails details) {
        _panelOnUpdate(details, lastPosition);
      },
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          width: minSize,
          height: minSize,
          margin: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorUtil.bgColor2,
            ),
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size, childAspectRatio: 1, mainAxisSpacing: 10, crossAxisSpacing: 10),
                itemCount: size * size,
                itemBuilder: (context, int index) {
                  int indexI = index ~/ size;
                  int indexJ = index % size;
                  return _buildGameCell(_cellArr[indexI][indexJ]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGameCell(int value) {
    return Container(
      decoration: BoxDecoration(
        color: ColorUtil.mapValueToColor(value),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          value == 0 ? "" : value.toString(),
          style: TextStyle(
            color: value == 2 || value == 4 ? ColorUtil.textColor1 : ColorUtil.textColor3,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget _buildGameOverMask(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorUtil.bgColor1.withOpacity(0.5),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "游戏结束！",
              style: TextStyle(
                color: ColorUtil.textColor1,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(ColorUtil.bgColor3),
                ),
                onPressed: () {
                  startGame();
                },
                child: const Text("重新开始"))
          ],
        ),
      ),
    );
  }
}
