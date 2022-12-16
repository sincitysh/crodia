import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static SharedPreferences _preferences;

  static String getStr(key) {
    return _preferences.getString(key) ?? '';
  }

  static int getInt(key) {
    return _preferences.getInt(key) ?? 0;
  }

  static void setSpInt(String key, int value) {
    _preferences.setInt(key, value);
  }

  /**
   * 清除登录信息
   */
  static void clearLogInfo() {
    _preferences.remove('token');
    _preferences.remove('mobile');
    _preferences.remove('promotion');
    _preferences.remove('id');
    _preferences.remove('profitunit');
    _preferences.remove('username');
    _preferences.remove('adcount');
    _preferences.remove('addr');
  }

  static bool isReadPrivacy() {
    bool privacy = _preferences.get('privacy_readed');
    return privacy == null ? false : privacy;
  }

  static bool CustomThemeMode() {
    bool themMode = _preferences.get('theme_mode');
    return themMode == null ? true : themMode;
  }

  static bool isLogged() {
    String token = _preferences.get('token');
    return (token != null && token.isNotEmpty);
  }

  static void setSp(String key, String value) {
    _preferences.setString(key, value);
  }

  static Future<void> checkSp() async {
    if (null == _preferences) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  static Future<void> setDrawMinMoney(money) async {
    await checkSp();
    _preferences.setInt('mindrawmoney', money);
  }

  static int getDrawMinMoney() {
    // await checkSp();
    return _preferences.getInt('mindrawmoney') ?? 10;
  }

  static Future<void> setPayMinMoney(money) async {
    await checkSp();
    _preferences.setInt('minpaymoney', money);
  }

  static int getPayMinMoney() {
    return (_preferences.getInt('minpaymoney') ?? 50);
  }
}
