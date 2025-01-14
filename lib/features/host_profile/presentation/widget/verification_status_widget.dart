import 'package:ez_booking/core/config/app_assets.dart';
import 'package:flutter/material.dart';

Widget VerificationItem(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            // color: Colors.blue.shade100,
            shape: BoxShape.circle,
          ),
          child: Image.asset(AppAssets.flash_circle)
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    ),
  );
}

Widget VerificationStatus() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Abhishek Verified Status',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 15),
      VerificationItem('Identity Verified'),
      VerificationItem('Email address Verified'),
      VerificationItem('Phone Number Verified'),
      VerificationItem('Payment Details Verified'),
    ],
  );
}
