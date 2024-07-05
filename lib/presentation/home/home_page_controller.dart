import 'package:get/get.dart';
import 'package:pix_keeper/presentation/pix_key_form/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/presentation/pix_key_form/blocs/pix_key/pix_key_events.dart';

class HomePageController extends GetxController {
  late final PixKeyBloc pixKeyBloc;

  @override
  void onInit() {
    pixKeyBloc = PixKeyBloc();

    pixKeyBloc.add(LoadPixKeyEvent());

    super.onInit();
  }
}
