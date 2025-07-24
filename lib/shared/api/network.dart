import 'package:dashboard/shared/api/methods/auth_methods.dart';
import 'package:dashboard/shared/api/methods/store_methods%20.dart';

class NetworkProvider {
  final AuthMethodsApi authMethods = AuthMethodsApi();
  final StoreMethodsApi storeMethods = StoreMethodsApi();
}

class ApiNetworkException implements Exception {
  final String message;
  const ApiNetworkException([this.message = ""]);
}

String normalizeSaudiMobile(String input) {
  // إزالة المسافات
  input = input.replaceAll(' ', '');

  // إزالة البادئة +966
  if (input.startsWith('+966')) {
    input = input.substring(4);
  }
  // إزالة البادئة 00966
  else if (input.startsWith('00966')) {
    input = input.substring(5);
  }
  // إزالة البادئة 966
  else if (input.startsWith('966')) {
    input = input.substring(3);
  }

  // إزالة الصفر الأول إن وُجد
  if (input.startsWith('0')) {
    input = input.substring(1);
  }

  return input;
}
