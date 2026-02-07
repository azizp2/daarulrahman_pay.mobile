import 'package:darul_rahman_app/core/helpers/currency_helper.dart';
import 'package:flutter/material.dart';

class NfcCard extends StatelessWidget {
  final String cardNumber;
  final int balance;
  final VoidCallback? onTap;
  final List<Color>? gradientColors;

  const NfcCard(
      {super.key,
      required this.cardNumber,
      required this.balance,
      this.onTap,
      this.gradientColors});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: gradientColors ??
                  const [
                    Color(0xFF1565C0),
                    Color(0xFF42A5F5),
                  ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Header
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kartu NFC',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.nfc,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),

              // Card Number
              Text(
                cardNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // Balance
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Saldo',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    CurrencyHelper.format(1000),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
