const linkAsset = 'assets/images/weathers/';

class AssetCustom {
  static String getLinkImage(String name) =>
      '$linkAsset${name.replaceAll(' ', '').toLowerCase()}.png';
}

class Mykey {
  static const String api_token = '69172e6c9b8216f37d307483abdfd6d4';
}
