import 'package:flutter/material.dart';

void main() {
  runApp(CategoryApp());
}

class CategoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryScreen(),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Choose Category',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(16.0),
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: [
                _buildCategoryItem('Grocery', Icons.local_grocery_store, Colors.green[100]),
                _buildCategoryItem('Work', Icons.work, Colors.orange[100]),
                _buildCategoryItem('Sport', Icons.fitness_center, Colors.cyan[100]),
                _buildCategoryItem('Design', Icons.design_services, Colors.blue[100]),
                _buildCategoryItem('University', Icons.school, Colors.purple[100]),
                _buildCategoryItem('Social', Icons.people, Colors.pink[100]),
                _buildCategoryItem('Music', Icons.music_note, Colors.purple[100]),
                _buildCategoryItem('Health', Icons.favorite, Colors.green[100]),
                _buildCategoryItem('Movie', Icons.movie, Colors.blue[100]),
                _buildCategoryItem('Home', Icons.home, Colors.orange[100]),
                _buildCategoryItem('Create New', Icons.add, Colors.green[100]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Add Category', style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, Color? color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.black54),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 16, color: Colors.black87)),
        ],
      ),
    );
  }
}