import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@Freezed()
class UserModel with _$UserModel {
  factory UserModel({@Default('def') @JsonKey(name: 'name') String name}) =
      _UserModel;

  // factory UserModel.fromJson(Map<String, dynamic> json) =>
  //     _$UserModelFromJson(json);
}
