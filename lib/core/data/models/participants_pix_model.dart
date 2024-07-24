import 'package:json_annotation/json_annotation.dart';

part 'participants_pix_model.g.dart';

@JsonSerializable()
class ParticipantPixModel {
  String? ispb;
  @JsonKey(name: "nome_reduzido")
  String? shortName;

  ParticipantPixModel({
    this.ispb,
    this.shortName,
  });

  ParticipantPixModel copy({
    int? id,
    String? ispb,
    String? shortName,
  }) =>
      ParticipantPixModel(
        ispb: ispb ?? this.ispb,
        shortName: shortName ?? this.shortName,
      );

  bool isEmpty() {
    return ispb == null && shortName == null;
  }

  factory ParticipantPixModel.fromJson(Map<String, dynamic> json) => _$ParticipantPixModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantPixModelToJson(this);
}
