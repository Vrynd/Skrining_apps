import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String? unit;
  final bool isCircular;
  final double? percent;
  final Color? progressColor;
  final double? height;
  final double? spacing;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    this.unit,
    this.isCircular = false,
    this.percent,
    this.progressColor,
    this.height,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            SizedBox(height: spacing),
            isCircular
                ? Center(
                    child: CircularPercentIndicator(
                      radius: 44.0,
                      lineWidth: 8.0,
                      percent: percent ?? 0,
                      center: Text(
                        value,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      progressColor:
                          progressColor ??
                          Theme.of(context).colorScheme.primary,
                      backgroundColor: Colors.grey.shade200,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  )
                : RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: value,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        if (unit != null)
                          TextSpan(
                            text: " $unit",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
