
import 'dart:ui';

class ColorUtil {
  /// 背景颜色
  static Color bgColor1 = Color.fromARGB(255, 218, 255, 215);
  static Color bgColor2 = Color.fromARGB(255, 78, 26, 76);
  static Color bgColor3 = Color.fromARGB(255, 255, 109, 219);

  /// 文字颜色
  static Color textColor1 = Color.fromARGB(255, 255, 0, 0);
  static Color textColor2 = const Color(0xFFF8F6F2);
  static Color textColor3 = const Color(0xFFFFFFFF);

  /// 数字的背景色
  static Color gc0 = const Color(0xFFCCC1B4);

  /// 不展示数字
  static Color gc2 = Color.fromARGB(255, 9, 255, 0);
  static Color gc4 = Color.fromARGB(255, 0, 255, 170);
  static Color gc8 = Color.fromARGB(255, 139, 193, 255);
  static Color gc16 = Color.fromARGB(255, 52, 131, 250);
  static Color gc32 = Color.fromARGB(255, 174, 86, 245);
  static Color gc64 = Color.fromARGB(255, 255, 44, 255);
  static Color gc128 = Color.fromARGB(255, 250, 47, 108);
  static Color gc256 = Color.fromARGB(255, 255, 27, 46);
  static Color gc512 = Color.fromARGB(255, 255, 251, 42);
  static Color gc1024 = Color.fromARGB(255, 255, 133, 33);
  static Color gc2048 = Color.fromARGB(255, 136, 93, 43);

  static Color mapValueToColor(int value) {
    switch (value) {
      case 0:
        return ColorUtil.gc0;
      case 2:
        return ColorUtil.gc2;
      case 4:
        return ColorUtil.gc4;
      case 8:
        return ColorUtil.gc8;
      case 16:
        return ColorUtil.gc16;
      case 32:
        return ColorUtil.gc32;
      case 64:
        return ColorUtil.gc64;
      case 128:
        return ColorUtil.gc128;
      case 256:
        return ColorUtil.gc256;
      case 512:
        return ColorUtil.gc512;
      case 1024:
        return ColorUtil.gc1024;
      case 2048:
        return ColorUtil.gc2048;
      default:
        return ColorUtil.gc2048;
    }
  }
}
