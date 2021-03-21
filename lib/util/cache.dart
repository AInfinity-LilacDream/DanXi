/*
 *     Copyright (C) 2021  w568w
 *
 *     This program is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     (at your option) any later version.
 *
 *     This program is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public License
 *     along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static Future<T> get<T>(String key, Future<T> fetch(),
      T decode(String cachedValue), String encode(T object),
      {bool validate(String cachedValue)}) async {
    print("loading");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (validate == null) {
      validate = (v) => v != null;
    }
    if (!preferences.containsKey(key)) {
      T newValue = await fetch();
      preferences.setString(key, encode(newValue));
      return newValue;
    }
    String result = preferences.getString(key);
    if (validate(result)) {
      return decode(result);
    } else {
      T newValue = await fetch();
      preferences.setString(key, encode(newValue));
      return newValue;
    }
  }
}