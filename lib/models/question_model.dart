class Question {
  final String question;
  final List<String> answers;
  final List<num> points;

  Question({
    required this.question,
    required this.answers,
    this.points = const [1, 2, 3, 4],
  });
}
