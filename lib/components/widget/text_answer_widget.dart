import 'package:flutter/material.dart';
import 'package:skrining_apps/models/question.dart';

class TextAnswerWidget extends StatelessWidget {
  final Question question;
  final Function(dynamic) onAnswer;
  final String? initialValue;
  
  const TextAnswerWidget({super.key, required this.question, required this.onAnswer, this.initialValue});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: initialValue ?? '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.question,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: controller,
          keyboardType: question.keyboardType == 'number' ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Jawab di sini...',
          ),
          onSubmitted: onAnswer,
        ),
      ],
    );
  }
}