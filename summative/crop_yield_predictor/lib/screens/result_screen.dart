import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

class ResultScreen extends StatelessWidget {
  final double prediction;
  const ResultScreen({super.key, required this.prediction});

  String _getYieldMessage(double yield) {
    if (yield < 1000) return 'Low yield expected. Consider improving soil nutrients.';
    if (yield < 2000) return 'Moderate yield expected. Good harvest!';
    return 'Excellent yield predicted! Optimal conditions detected.';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final yieldMessage = _getYieldMessage(prediction);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prediction Result'),
        backgroundColor: colors.primary,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [colors.surfaceVariant, theme.scaffoldBackgroundColor],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FontAwesomeIcons.chartLine,
                      size: 50,
                      color: Colors.amber[700],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Predicted Crop Yield',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '${prediction.toStringAsFixed(2)} kg/ha',
                      style: theme.textTheme.displaySmall?.copyWith(
                        color: colors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      yieldMessage,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: colors.onSurface.withOpacity(0.8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Back to Input',
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: colors.onPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}