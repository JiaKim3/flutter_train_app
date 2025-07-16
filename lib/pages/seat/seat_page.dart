import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  final String departure;
  final String arrival;

  const SeatPage({Key? key, required this.departure, required this.arrival})
    : super(key: key);

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  final int rowCount = 20;
  final List<String> columns = ['A', 'B', 'C', 'D'];
  String? selectedSeat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('좌석 선택'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.departure,
                style: const TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(width: 30),
              const Icon(
                Icons.arrow_circle_right_outlined,
                size: 30,
                color: Colors.black,
              ),
              const SizedBox(width: 30),
              Text(
                widget.arrival,
                style: const TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSeatStatusBox(Colors.purple, '선택됨'),
              const SizedBox(width: 20),
              _buildSeatStatusBox(Colors.grey[300]!, '선택 안 됨'),
            ],
          ),
          const SizedBox(height: 16),
          // ABCD 헤더
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSeatLabel('A'),
                const SizedBox(width: 4),
                _buildSeatLabel('B'),
                const SizedBox(width: 40), // 간격 벌려서 열 번호 들어갈 자리 확보
                _buildSeatLabel('C'),
                const SizedBox(width: 4),
                _buildSeatLabel('D'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: rowCount,
              itemBuilder: (context, rowIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSeat(rowIndex, 'A'),
                      const SizedBox(width: 4),
                      _buildSeat(rowIndex, 'B'),
                      const SizedBox(width: 20),
                      Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          '${rowIndex + 1}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(width: 20),
                      _buildSeat(rowIndex, 'C'),
                      const SizedBox(width: 4),
                      _buildSeat(rowIndex, 'D'),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: GestureDetector(
              onTap: () {
                if (selectedSeat == null) return;
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('예매 하시겠습니까?'),
                    content: Text('좌석 : $selectedSeat'),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text('취소'),
                        onPressed: () => Navigator.pop(context),
                        isDestructiveAction: true,
                      ),
                      CupertinoDialogAction(
                        child: const Text('확인'),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Text(
                  '예매 하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeat(int row, String column) {
    String seat = '${row + 1}-$column';
    bool isSelected = selectedSeat == seat;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSeat = seat;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildSeatStatusBox(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }

  Widget _buildSeatLabel(String label) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      child: Text(label, style: const TextStyle(fontSize: 18)),
    );
  }
}
