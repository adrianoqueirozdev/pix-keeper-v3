import 'package:get/get.dart';
import 'package:pix_keeper/core/domain/usecases/get_all_participants_pix.dart';
import 'package:pix_keeper/core/presentation/blocs/participants_pix/participants_pix_bloc.dart';

class ParticipantsPixBlocFactory {
  static ParticipantsPixBloc create() {
    final getAllParticipantsPix = Get.find<GetAllParticipantsPix>();

    return ParticipantsPixBloc(getAllParticipantsPix: getAllParticipantsPix);
  }
}
