import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  const StationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String mode = ModalRoute.of(context)!.settings.arguments as String;
    final List<String> stations = [
      "수서",
      "동탄",
      "평택지제",
      "천안아산",
      "오송",
      "대전",
      "김천구미",
      "동대구",
      "경주",
      "울산",
      "부산",
    ];

    return Scaffold(
      appBar: AppBar(title: Text(mode == 'departure' ? '출발역 선택' : '도착역 선택')),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          final station = stations[index];
          return InkWell(
            onTap: () => Navigator.pop(context, station),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                station,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
