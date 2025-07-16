import 'package:flutter/material.dart';

class StationBox extends StatelessWidget {
  final String title; // 출발역 / 도착역
  final String value; // 선택된 값
  final VoidCallback onTap;

  const StationBox({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              value.isEmpty ? '선택' : value,
              style: const TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
