import 'package:ganz_tek/data/model/register_entity.dart';
import 'package:ganz_tek/generated/json/base/json_filed.dart';

registerEntityFromJson(RegisterEntity data, Map<String, dynamic> json) {
	data.code = json['code'];
	data.jwt = json['jwt'];
	data.expiredDate = json['expiredDate'];
	data.user = json['user'] != null ? new RegisterUser().fromJson(json['user']) : null;
	return data;
}

Map<String, dynamic> registerEntityToJson(RegisterEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['jwt'] = entity.jwt;
	data['expiredDate'] = entity.expiredDate;
	if (entity.user != null) {
		data['user'] = RegisterUser().toJson();
	}
	return data;
}

registerUserFromJson(RegisterUser data, Map<String, dynamic> json) {
	data.username = json['username'];
	data.email = json['email'];
	data.provider = json['provider'];
	data.uuid = json['uuid'];
	data.shortcode = json['shortcode'];
	data.role = json['role'];
	data.confirmed = json['confirmed'];
	data.id = json['id'];
	return data;
}

Map<String, dynamic> registerUserToJson(RegisterUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['username'] = entity.username;
	data['email'] = entity.email;
	data['provider'] = entity.provider;
	data['uuid'] = entity.uuid;
	data['shortcode'] = entity.shortcode;
	data['role'] = entity.role;
	data['confirmed'] = entity.confirmed;
	data['id'] = entity.id;
	return data;
}