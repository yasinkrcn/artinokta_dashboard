class AssetPaths {
  static final AssetPaths _instance = AssetPaths._init();
  AssetPaths._init();

  factory AssetPaths() {
    return _instance;
  }

  String _toSVG(String name) => 'assets/images/svg/$name.svg';
  String _toPNG(String name) => 'assets/images/png/$name.png';
  // String _toJSON(String name) => 'assets/json/$name.json';

  //* SVG
  String get arrowRightSVG => _toSVG("arrow_right");
  String get arrowRightIosSVG => _toSVG("arrow_right_ios");
  String get closeSVG => _toSVG("close");
  String get checkCircleSVG => _toSVG("check_circle");
  String get clockSVG => _toSVG("clock");

  //* PNG
  String get logoPNG => _toPNG("logo");
  String get creditCardPNG => _toPNG("credit_card");
  String get qrCodePNG => _toPNG("qr_code");
}
