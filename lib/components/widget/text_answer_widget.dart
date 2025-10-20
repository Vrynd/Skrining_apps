import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/models/question.dart';
import 'package:skrining_apps/provider/question_provider.dart';

class TextAnswerWidget extends StatefulWidget {
  final Question question;
  final Function(dynamic) onAnswer;
  final String? initialValue;
  
  const TextAnswerWidget({super.key, required this.question, required this.onAnswer, this.initialValue});

  @override
  State<TextAnswerWidget> createState() => _TextAnswerWidgetState();
}

class _TextAnswerWidgetState extends State<TextAnswerWidget> {
  late final TextEditingController controller = TextEditingController(text: widget.initialValue ?? '');

  @override
  void dispose() {
    controller.clear();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question.question,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: controller,
          keyboardType: widget.question.keyboardType == 'number' ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: widget.question.hintText,
          ),
          onSubmitted: widget.onAnswer,
        ),
      ],
    );
  }
}