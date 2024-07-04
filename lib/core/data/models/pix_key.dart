import 'package:json_annotation/json_annotation.dart';

part 'pix_key.g.dart';

enum PixKeyType { cpf, cnpj, phone, email, random }

@JsonSerializable()
class PixKeyModel {
  int? id;
  String? name;
  String? key;
  String? pixKeyType;
  String? favoredName;
  String? institution;
  bool? isFavorite;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? copiedAt;

  PixKeyModel({
    this.id,
    this.name,
    this.key,
    this.pixKeyType,
    this.favoredName,
    this.institution,
    this.isFavorite,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.copiedAt,
  });

  PixKeyModel copyWith({
    int? id,
    String? name,
    String? key,
    String? pixKeyType,
    String? favoredName,
    String? institution,
    bool? isFavorite,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? copiedAt,
  }) {
    return PixKeyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      key: key ?? this.key,
      pixKeyType: pixKeyType ?? this.pixKeyType,
      favoredName: favoredName ?? this.favoredName,
      institution: institution ?? this.institution,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      copiedAt: copiedAt ?? this.copiedAt,
    );
  }

  factory PixKeyModel.fromJson(Map<String, dynamic> json) => _$PixKeyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PixKeyModelToJson(this);
}
