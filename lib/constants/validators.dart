import 'package:get/get.dart';

class Validators {
  static String? email(String? value) {
    if (value == null || !value.isEmail) return 'error invalid email';
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty)
      return 'password must not be empty';
    else if (value.length < 4)
      return 'password should be at least 4 characters';
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) return ' invalid name';
  }
  static String? username(String? value) {
    if (value == null || value.isEmpty) return ' invalid user name';
  }

  static String? details(String? value) {
    if (value == null || value.isEmpty) return ' details must not be empty';
  }

  static String? price(String? value) {
    if (value == null || value.isEmpty)
      return 'price must not be empty';
    else if (!value.isNumericOnly)
      return 'price must be number only';
  }


  static String? phone(String? value) {
    if (value == null || value.isEmpty) return 'phone must not be empty';
    if (!value.isPhoneNumber) return 'error enter correct phone number';
  }

  static String? address(String? value) {
    if (value == null || value.isEmpty) return 'address must not be empty';
    if (!value.isAlphabetOnly) return 'error enter correct address';
  }
  static String? time(String? value) {
    if (value == null || value.isEmpty) return 'time must not be empty';
  }
  static String? experiance(String? value) {
    if (value == null || value.isEmpty) return 'please write some experiances';
  }
}
