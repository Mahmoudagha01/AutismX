String parseTime(int time) {
  final duration = Duration(
    seconds: time,
  );

  final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');

  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

  return "$minutes:$seconds";
}
