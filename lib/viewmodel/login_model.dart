import 'package:ganz_tek/config/storage_manager.dart';
import 'package:ganz_tek/data/model/login_entity.dart';
import 'package:ganz_tek/data/repository/repository.dart';
import 'package:ganz_tek/provider/view_state_model.dart';

class LoginModel extends ViewStateModel {

  LoginEntity getLogin() => LoginEntity.fromJson(StorageManager.getObject(StorageManager.preLoginUser));

  Future<bool> login(loginName, password) async {
    setBusy();
    try {
      var user = await Repository.login(loginName, password);
      StorageManager.saveObject(StorageManager.preLoginUser, user);
      setIdle();
      return true;
    } catch (e, s) {
      setError(e, s);
      return false;
    }
  }

  Future<bool> logout() async {
    setBusy();
    try {
      await Repository.logout();
      setIdle();
      return true;
    } catch (e, s) {
      setError(e, s);
      return false;
    }
  }
}
