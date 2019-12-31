import 'package:ganz_tek/generated/json/base/json_convert_content.dart';
import 'package:ganz_tek/generated/json/base/json_filed.dart';

class RegisterEntity with JsonConvert<RegisterEntity> {
	int code;
	String jwt;
	String expiredDate;
	RegisterUser user;
}

class RegisterUser with JsonConvert<RegisterUser> {
	String username;
	String email;
	String provider;
	String uuid;
	String shortcode;
	int role;
	bool confirmed;
	int id;
}
