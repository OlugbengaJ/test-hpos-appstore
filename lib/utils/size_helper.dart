class SizeHelper {
  static SizeInfo getSize(int byteValue) {
    int count = 0;
    double rem = byteValue.toDouble();

    while (rem > 1000) {
      count++;
      rem /= 1000;
    }

    String unit;
    switch (count) {
      case 0:
        unit = 'B';
        break;
      case 1:
        unit = 'KB';
        break;
      case 2:
        unit = 'MB';
        break;
      case 3:
        unit = 'GB';
        break;
      case 4:
        unit = 'TB';
        break;
      default:
        unit = '';
    }

    if (rem.floor() < rem) {
      // round to 2 dp since rem has floating values
      rem = double.parse(rem.toStringAsFixed(2));
    }

    return SizeInfo(rem, unit);
  }
}

class SizeInfo {
  SizeInfo(this.value, this.unit);

  final double value;
  final String unit;

  @override
  String toString() => '$value $unit';
}
