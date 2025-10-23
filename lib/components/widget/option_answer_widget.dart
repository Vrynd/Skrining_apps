import 'package:flutter/material.dart';
import 'package:skrining_apps/models/question.dart';

class OptionAnswerWidget extends StatelessWidget {
  final Question question;
  final Function(dynamic) onAnswer;
  final int? initialValue;

  const OptionAnswerWidget({super.key, required this.question, required this.onAnswer, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.question,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...question.options!.map((option) {
          final isSelected = initialValue == option.value;
          final rowBorderColor = isSelected 
          ? Theme.of(context).primaryColor 
          : Colors.grey.shade300;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: InkWell(
              onTap: (){
                onAnswer("${option.alias}_${option.value}");
                debugPrint("Pertanyaan : ${question.question}");
                debugPrint("Jawaban yg Dipilih : ${option.alias}_${option.value}");
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: rowBorderColor,
                    width: isSelected ? 2.0 : 1.0, 
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: isSelected 
                      ? [
                          BoxShadow(
                            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          )
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected 
                            ? Theme.of(context).primaryColor 
                            : Colors.transparent, 
                        border: Border.all(
                          color: isSelected ? Theme.of(context).primaryColor : Colors.grey.shade400,
                          width: 1.5,
                        ),
                      ),
                      child: isSelected 
                          ? const Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            )
                          : Container(), 
                    ),
                    Expanded(
                      child: Text(
                        option.text,
                        style: TextStyle(
                          fontSize: 18,
                          color: isSelected ? Theme.of(context).primaryColor : Colors.black87,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}