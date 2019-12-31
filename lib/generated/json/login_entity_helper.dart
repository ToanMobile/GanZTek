import 'package:ganz_tek/data/model/login_entity.dart';
import 'package:ganz_tek/generated/json/base/json_filed.dart';

loginEntityFromJson(LoginEntity data, Map<String, dynamic> json) {
	data.code = json['code'];
	data.jwt = json['jwt'];
	data.expiredDate = json['expiredDate'];
	data.user = json['user'] != null ? new LoginUser().fromJson(json['user']) : null;
	return data;
}

Map<String, dynamic> loginEntityToJson(LoginEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['jwt'] = entity.jwt;
	data['expiredDate'] = entity.expiredDate;
	if (entity.user != null) {
		data['user'] = LoginUser().toJson();
	}
	return data;
}

loginUserFromJson(LoginUser data, Map<String, dynamic> json) {
	data.email = json['email'];
	data.id = json['id'];
	data.uuid = json['uuid'];
	data.username = json['username'];
	data.provider = json['provider'];
	data.confirmed = json['confirmed'];
	data.blocked = json['blocked'];
	data.role = json['role'] != null ? new LoginUserRole().fromJson(json['role']) : null;
	data.shortcode = json['shortcode'];
	return data;
}

Map<String, dynamic> loginUserToJson(LoginUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['email'] = entity.email;
	data['id'] = entity.id;
	data['uuid'] = entity.uuid;
	data['username'] = entity.username;
	data['provider'] = entity.provider;
	data['confirmed'] = entity.confirmed;
	data['blocked'] = entity.blocked;
	if (entity.role != null) {
		data['role'] = LoginUserRole().toJson();
	}
	data['shortcode'] = entity.shortcode;
	return data;
}

loginUserRoleFromJson(LoginUserRole data, Map<String, dynamic> json) {
	data.id = json['id'];
	data.name = json['name'];
	data.description = json['description'];
	data.type = json['type'];
	return data;
}

Map<String, dynamic> loginUserRoleToJson(LoginUserRole entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['type'] = entity.type;
	return data;
}