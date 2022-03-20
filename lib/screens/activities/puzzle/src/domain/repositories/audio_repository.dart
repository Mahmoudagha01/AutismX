abstract class AudioRepository {
  Future<void> playMove();
  Future<void> play(String asset);
  Future<void> playWinner();
  Future<void> dispose();
}
