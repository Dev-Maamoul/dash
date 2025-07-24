import 'package:dashboard/shared/api/network.dart';
import 'package:dashboard/shared/models/login_model.dart';
import 'package:dashboard/shared/models/verify_login.dart';
import 'package:get_storage/get_storage.dart';

class AuthLocater {
  final box = GetStorage();
  NetworkProvider api = NetworkProvider();

  String? mobile;
  Verifylogin? verifyData;

  bool checkIfThereMobile() {
    if (mobile == null) {
      return false;
    }
    return true;
  }

  ///
  ///
  ///

  Future<void> login({required String mobile}) async {
    try {
      final response = await api.authMethods.login(mobile: mobile);
      this.mobile = LoginModel.fromJson(response.dataSours).mobile;
    } on ApiNetworkException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  ///
  ///
  ///
  Future<void> verifyLogin({required String otp}) async {
    try {
      final response = await api.authMethods.verifyLogin(
        mobile: mobile!,
        otp: otp,
      );
      verifyData = Verifylogin.fromJson(response.dataSours);
      await box.write("verifyData", verifyData?.toJson());
      await box.save();
    } on ApiNetworkException catch (error) {
      throw FormatException(error.message);
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  Future<void> loadData() async {
    if (box.hasData("verifyData")) {
      final loadVerifyData = await box.read("verifyData");
      verifyData = Verifylogin.fromJson(loadVerifyData);
    }
  }

  Future<void> clear() async {
    mobile = null;
    verifyData = null;
    await box.erase();
  }
}
