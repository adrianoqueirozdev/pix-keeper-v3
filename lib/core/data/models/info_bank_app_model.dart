import 'package:json_annotation/json_annotation.dart';

part 'info_bank_app_model.g.dart';

@JsonSerializable()
class InfoBankAppModel {
  final String imagePath;
  final String packageName;

  InfoBankAppModel({required this.imagePath, required this.packageName});

  factory InfoBankAppModel.fromJson(Map<String, dynamic> json) => _$InfoBankAppModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoBankAppModelToJson(this);

  InfoBankAppModel copyWith({
    String? imagePath,
    String? packageName,
  }) {
    return InfoBankAppModel(
      imagePath: imagePath ?? this.imagePath,
      packageName: packageName ?? this.packageName,
    );
  }
}
