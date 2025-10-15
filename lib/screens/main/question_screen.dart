import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/models/question.dart';
import 'package:skrining_apps/provider/question_provider.dart';
import 'package:skrining_apps/state/question_state.dart';
import 'package:skrining_apps/components/widget/option_answer_widget.dart';
import 'package:skrining_apps/components/widget/text_answer_widget.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<QuestionProvider>().loadQuestions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionProvider>(
      builder: (context, provider, child) {
        final state = provider.state;
        return switch (state) {
          QuestionLoading() => Scaffold(
            appBar: AppBar(title: Text("Kuesioner")),
            body: const Center(child: CircularProgressIndicator())
          ),
          QuestionError(message: final msg) => Scaffold(
            appBar: AppBar(title: Text("Kuesioner")),
            body: Center(child: Text('Error: $msg'))
          ),
          QuestionLoaded(questions: final questions) => _buildQuestionUI(context, provider),
          _ => Scaffold(
            appBar: AppBar(title: Text("Kuesioner")),
            body: SizedBox(),
          ),
        };
      },
    );
  }

  Widget _buildQuestionUI(BuildContext context, QuestionProvider provider) {
    final currentQuestion = provider.currentQuestion!;
    final totalQuestions = provider.questions.length;
    final isFirstQuestion = provider.currentIndex == 0;
    final isLastQuestion = provider.currentIndex == totalQuestions - 1;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kuesioner ${provider.currentIndex + 1} dari $totalQuestions'),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              color: Theme.of(context).primaryColor,
              value: provider.progress,
            ),
            const SizedBox(height: 16),
          ],
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Expanded(
                child: _getQuestionWidget(currentQuestion, provider, key: ValueKey(provider.currentIndex)),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: isFirstQuestion
                        ? () => Navigator.of(context).pop()
                        : () => provider.previousQuestion(),
                    child: Text(isFirstQuestion ? 'Cancel' : 'Back'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: provider.currentAnswerValue != null ? () {
                      if (isLastQuestion) {
                        final results = provider.collectResults();
                        debugPrint("Hasil Result = $results");
                        // provider.resetQuestion();
                        Navigator.of(context).pop();
                        // _goToResultPage(context, results);
                      } else {
                        provider.nextQuestion();
                      }
                    } : null,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: provider.currentAnswerValue != null ? Theme.of(context).primaryColor : Colors.grey[300],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(isLastQuestion ? 'Submit' : 'Next'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getQuestionWidget(Question question, QuestionProvider provider, {required Key key}) {
    switch (question.answerType) {
      case AnswerType.text:
        return TextAnswerWidget(
          key: key,
          question: question,
          onAnswer: provider.saveAnswer,
          initialValue: provider.currentAnswerValue,
        );
      case AnswerType.option:
        return OptionAnswerWidget(
          key: key,
          question: question,
          onAnswer: provider.saveAnswer,
          initialValue: provider.currentAnswerValue,
        );
    }
  }
}