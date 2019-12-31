import 'package:ganz_tek/config/storage_manager.dart';
import 'package:ganz_tek/data/model/register_entity.dart';
import 'package:ganz_tek/data/repository/repository.dart';
import 'package:ganz_tek/provider/view_state_model.dart';

class RegisterModel extends ViewStateModel {

  Future<bool> register(loginName, email, password) async {
    setBusy();
    try {
      var user = await Repository.register(loginName, email, password);
      StorageManager.sharedPreferences.setString(StorageManager.preToken, (user as RegisterEntity).jwt);
      setIdle();
      return true;
    } catch (e, s) {
      setError(e, s);
      return false;
    }
  }
}
