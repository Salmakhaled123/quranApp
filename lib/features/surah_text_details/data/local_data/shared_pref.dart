import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
 static SharedPreferences ?pref;

  static init()async
  {
    pref=await SharedPreferences.getInstance();
  }
 static Future<bool?> setData(String key,bool value)async
  {
  return  await pref!.setBool(key, value);
  }
 static getData(String key)
  {
  return  pref!.getBool(key);
  }

}