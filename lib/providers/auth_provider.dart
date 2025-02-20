import 'package:adopt_app/models/user.dart';
import 'package:adopt_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthProvider extends ChangeNotifier {
  String token = "";
  late User user;

  void signup({
    required User user,
  }) async {
    token = await AuthServices().signup(user: user);
    notifyListeners();
  }

  void signin({required User user}) async {
    token = await AuthServices().signup(user: user);
    notifyListeners();
  }

  bool get isAuth {
    if (token.isNotEmpty && !Jwt.isExpired(token)) {
      user = User.fromJson(Jwt.parseJwt(token));
      return true;
    } else
      return false;
  }
}
