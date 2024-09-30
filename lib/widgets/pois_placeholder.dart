import 'package:flutter/material.dart';

class PoisPlaceholder extends StatelessWidget {
  const PoisPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
          text: 'No Pois were found',
          children: [
            TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14.0,
                ),
                text: '\n\n\nTry again later\nor\nchange your search'),
          ],
        ),
      ),
    );
  }
}
