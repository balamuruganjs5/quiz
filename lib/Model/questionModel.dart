class QuestionModal {
  const QuestionModal(this.text, this.options);

  final String text;

  final List<String> options;

  List<String> get suffeldOptions {
    final suffeldResult = List.of(options);
    suffeldResult.shuffle();
    return suffeldResult;
  }
}
