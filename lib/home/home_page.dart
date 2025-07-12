import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ✅ Correctly define the task list as a class variable
  List<Map<String, dynamic>> taskList = [
    {'title': 'Do Math Homework', 'time': '16:45', 'tag': 'University'},
    {'title': 'Take out dogs', 'time': '18:20', 'tag': 'Home'},
    {"title": "DoMathHomeWork", "time":"16:45", "tag":"Home"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.filter_list), onPressed: (){

        },),
        
        
        title: const Text('Index' ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile/profile.png'),
            ),
          ),
        ],
      ),
      body: taskList.isEmpty ? _buildEmptyTaskView() : _buildTaskListView(),
     
    );
  }

  /// 📝 Show this if no tasks are available
  Widget _buildEmptyTaskView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty.png',
            height: 200,
          ), // Your empty illustration
          const SizedBox(height: 20),
          const Text(
            "What do you want to do today?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          const Text("Tap + to add your tasks"),
        ],
      ),
    );
  }

  /// ✅ Show this when task data is available
  Widget _buildTaskListView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search for your task...",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              final task = taskList[index];
             return Card(
  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  child: ListTile(
    leading: const Icon(Icons.circle),
    title: Text(task['title']),
    subtitle: Text('Today at ${task['time']}'),
    trailing: SizedBox(
      height: 70, // 👈 Enough space to allow flexing
       // 👈 Add width to avoid squashing
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Chip(
              label: Text(
                task['tag'],
                style: const TextStyle(color: Colors.white, fontSize: 10),
            
              ),
              backgroundColor: const Color.fromARGB(255, 47, 56, 212),
            ),
          ),
          const SizedBox(height: 4),
          const Expanded(
            flex: 1,
            child: Icon(
              Icons.info_outline,
              size: 18,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  ),
);

            },
          ),
        ),
      ],
    );
  }
}
