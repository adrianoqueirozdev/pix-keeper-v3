import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pix_keeper/core/data/repositories/authentication_repository_impl.dart';
import 'package:pix_keeper/core/data/repositories/participants_pix_repository_impl.dart';
import 'package:pix_keeper/core/data/repositories/pix_keys_repository_impl.dart';
import 'package:pix_keeper/core/domain/usecases/check_authentication_status.dart';
import 'package:pix_keeper/core/domain/usecases/copy_and_open_bank.dart';
import 'package:pix_keeper/core/domain/usecases/copy_pix_key.dart';
import 'package:pix_keeper/core/domain/usecases/copy_text.dart';
import 'package:pix_keeper/core/domain/usecases/create_pix_key.dart';
import 'package:pix_keeper/core/domain/usecases/delete_all_pix_keys.dart';
import 'package:pix_keeper/core/domain/usecases/delete_pix_key.dart';
import 'package:pix_keeper/core/domain/usecases/get_all_participants_pix.dart';
import 'package:pix_keeper/core/domain/usecases/get_all_pix_keys.dart';
import 'package:pix_keeper/core/domain/usecases/get_all_pix_keys_deleted.dart';
import 'package:pix_keeper/core/domain/usecases/logout_user.dart';
import 'package:pix_keeper/core/domain/usecases/open_app.dart';
import 'package:pix_keeper/core/domain/usecases/restore_pix_key.dart';
import 'package:pix_keeper/core/domain/usecases/sign_in_with_google.dart';
import 'package:pix_keeper/core/domain/usecases/update_pix_key.dart';
import 'package:pix_keeper/core/presentation/blocs/participants_pix/participants_pix_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_key/pix_key_bloc.dart';
import 'package:pix_keeper/core/presentation/blocs/pix_keys_deleted/pix_keys_deleted_bloc.dart';
import 'package:pix_keeper/shared/controllers/copy_controller.dart';

class DependencyInjection {
  static void init() {
    // Firebase
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance);
    Get.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance);

    // Google Sign In
    Get.lazyPut<GoogleSignIn>(() => GoogleSignIn());

    // Controllers
    Get.lazyPut<CopyController>(() => CopyController(
          copyPixKey: Get.find<CopyPixKey>(),
          copyText: Get.find<CopyText>(),
          copyAndOpenAppBank: Get.find<CopyAndOpenAppBank>(),
        ));

    // Repositories
    Get.lazyPut<AuthenticationRepositoryImpl>(() => AuthenticationRepositoryImpl());
    Get.lazyPut<PixKeysRepositoryImpl>(() => PixKeysRepositoryImpl());
    Get.lazyPut<ParticipantsPixRepositoryImpl>(() => ParticipantsPixRepositoryImpl());

    // Use Cases
    Get.lazyPut<OpenApp>(() => OpenApp());
    Get.lazyPut<CopyText>(() => CopyText());
    Get.lazyPut<CopyAndOpenAppBank>(
        () => CopyAndOpenAppBank(copyPixKey: Get.find<CopyPixKey>(), openApp: Get.find<OpenApp>()));
    Get.lazyPut<CheckAuthenticationStatus>(
        () => CheckAuthenticationStatus(repository: Get.find<AuthenticationRepositoryImpl>()));
    Get.lazyPut<CreatePixKey>(() => CreatePixKey(repository: Get.find<PixKeysRepositoryImpl>()));
    Get.lazyPut<DeletePixKey>(() => DeletePixKey(repository: Get.find<PixKeysRepositoryImpl>()));
    Get.lazyPut<GetAllPixKeys>(() => GetAllPixKeys(repository: Get.find<PixKeysRepositoryImpl>()));
    Get.lazyPut<RestorePixKey>(() => RestorePixKey(repository: Get.find<PixKeysRepositoryImpl>()));
    Get.lazyPut<DeleteAllPixKeys>(() => DeleteAllPixKeys(repository: Get.find<PixKeysRepositoryImpl>()));
    Get.lazyPut<CopyPixKey>(() => CopyPixKey(repository: Get.find<PixKeysRepositoryImpl>()));
    Get.lazyPut<UpdatePixKey>(() => UpdatePixKey(repository: Get.find<PixKeysRepositoryImpl>()));

    Get.lazyPut<GetAllPixKeysDeleted>(() => GetAllPixKeysDeleted(repository: Get.find<PixKeysRepositoryImpl>()));

    Get.lazyPut<GetAllParticipantsPix>(
        () => GetAllParticipantsPix(repository: Get.find<ParticipantsPixRepositoryImpl>()));

    Get.lazyPut<SignInWithGoogle>(
        () => SignInWithGoogle(firebaseAuth: Get.find<FirebaseAuth>(), googleSignIn: Get.find<GoogleSignIn>()));
    Get.lazyPut<LogoutUser>(() => LogoutUser(firebaseAuth: Get.find<FirebaseAuth>()));

    // Blocs
    Get.lazyPut<PixKeyBloc>(() => PixKeyBloc(
          createPixKey: Get.find<CreatePixKey>(),
          getAllPixKeys: Get.find<GetAllPixKeys>(),
          deletePixKey: Get.find<DeletePixKey>(),
          updatePixKey: Get.find<UpdatePixKey>(),
        ));
    Get.lazyPut<PixKeysDeletedBloc>(() => PixKeysDeletedBloc(
          getAllPixKeysDeleted: Get.find<GetAllPixKeysDeleted>(),
          restorePixKey: Get.find<RestorePixKey>(),
          deleteAllPixKeys: Get.find<DeleteAllPixKeys>(),
        ));
    Get.lazyPut<ParticipantsPixBloc>(() => ParticipantsPixBloc(
          getAllParticipantsPix: Get.find<GetAllParticipantsPix>(),
        ));
  }
}
