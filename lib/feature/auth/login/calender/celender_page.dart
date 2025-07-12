import 'package:flutter/material.dart';

class CalederPage extends StatefulWidget {
  const CalederPage({super.key});

  @override
  State<CalederPage> createState() => _CalederPageState();
}

class _CalederPageState extends State<CalederPage> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.arrow_left, color: Colors.grey), onPressed: () {}),
                Text(
                  'FEBRUARY 2022',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                IconButton(icon: Icon(Icons.arrow_right, color: Colors.grey), onPressed: () {}),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDayButton('SUN', Colors.red),
              _buildDayButton('MON', Colors.white),
              _buildDayButton('TUE', Colors.white),
              _buildDayButton('WED', Colors.purple),
              _buildDayButton('THU', Colors.white),
              _buildDayButton('FRI', Colors.white),
              _buildDayButton('SAT', Colors.red),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDateButton('6'),
              _buildDateButton('7'),
              _buildDateButton('8'),
              _buildDateButton('9', isSelected: true),
              _buildDateButton('10'),
              _buildDateButton('11'),
              _buildDateButton('12'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDayButton(String day, Color color) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Center(
        child: Text(
          day,
          style: TextStyle(color: color, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildDateButton(String date, {bool isSelected = false}) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.purple : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          date,
          style: TextStyle(color: isSelected ? Colors.white : Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
  

