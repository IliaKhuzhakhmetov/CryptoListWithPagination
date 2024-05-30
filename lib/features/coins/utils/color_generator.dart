import 'dart:math';
import 'dart:ui';

abstract interface class ColorGenerator {
  /// Opacity range in [0..255]
  Color generateRandomColor();
}

class CoinColorGenerator implements ColorGenerator {
  final Random _random;

  const CoinColorGenerator({required Random random}) : _random = random;

  @override
  Color generateRandomColor() {
    return Color.fromARGB(
      25,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }
}
