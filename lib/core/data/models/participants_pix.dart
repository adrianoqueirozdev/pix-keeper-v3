import 'package:json_annotation/json_annotation.dart';

part 'participants_pix.g.dart';

const String tableParticipantsPix = 'participants_pix';

@JsonSerializable()
class ParticipantPix {
  String? ispb;
  @JsonKey(name: "nome_reduzido")
  String? shortName;

  ParticipantPix({
    this.ispb,
    this.shortName,
  });

  ParticipantPix copy({
    int? id,
    String? ispb,
    String? shortName,
  }) =>
      ParticipantPix(
        ispb: ispb ?? this.ispb,
        shortName: shortName ?? this.shortName,
      );

  bool isEmpty() {
    return ispb == null && shortName == null;
  }

  factory ParticipantPix.fromJson(Map<String, dynamic> json) => _$ParticipantPixFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantPixToJson(this);
}
