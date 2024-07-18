abstract class PixKeysDeletedEvents {}

class LoadAllPixKeysDeletedEvent extends PixKeysDeletedEvents {}

class RestorePixKeyEvent extends PixKeysDeletedEvents {
  final String id;

  RestorePixKeyEvent(this.id);
}
