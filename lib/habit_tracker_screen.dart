import 'package:flutter/material.dart';

class HabitTrackerScreen extends StatefulWidget {
  const HabitTrackerScreen({super.key});

  @override
  State<HabitTrackerScreen> createState() =>
      _HabitTrackerScreenState();
}

class _HabitTrackerScreenState extends State<HabitTrackerScreen> {
  final List<String> habits = [];
  final List<String> completedHabits = [];

  int habitCounter = 0;

  void addHabit() {
    setState(() {
      habitCounter++;
      habits.add('Habit $habitCounter');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Tracker'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),

      // MENU LATERAL
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configure'),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Personal Info'),
            ),
            const ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Reports'),
            ),
            const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
            ),
            const ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign Out'),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'To Do 📝',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: habits.isEmpty
                ? const Center(
                    child: Text(
                      'Use the + button to create some habits!',
                    ),
                  )
                : ListView.builder(
                    itemCount: habits.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(habits[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.check),
                          onPressed: () {
                            setState(() {
                              completedHabits.add(
                                habits.removeAt(index),
                              );
                            });
                          },
                        ),
                      );
                    },
                  ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Done ✅🎉',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: completedHabits.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  title: Text(completedHabits[index]),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addHabit,
        tooltip: 'Add Habit',
        child: const Icon(Icons.add),
      ),
    );
  }
}
