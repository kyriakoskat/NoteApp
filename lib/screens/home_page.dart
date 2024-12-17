import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> courses = [
    {
      'title': 'Machine Learning',
      'description': 'Welcome to Machine Learning Notes!',
    },
    {
      'title': 'Algorithms',
      'description': 'Welcome to Algorithms Notes!',
    },
    {
      'title': 'Data Structures',
      'description': 'Learn about Data Structures!',
    },
  ];

  final TextEditingController _folderNameController = TextEditingController();
  String _selectedType = "Private";

  void _showAddFolderSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            top: 32,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Όνομα φακέλου
              TextField(
                controller: _folderNameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.edit, color: Color(0xFF65558F)),
                  hintText: "Enter notebook name",
                  filled: true,
                  fillColor: const Color(0xFFF3E8FF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Επιλογή Τύπου φακέλου
              ToggleButtons(
                isSelected: [
                  _selectedType == "Private",
                  _selectedType == "Public",
                  _selectedType == "Only Friends",
                ],
                onPressed: (index) {
                  setState(() {
                    if (index == 0) _selectedType = "Private";
                    if (index == 1) _selectedType = "Public";
                    if (index == 2) _selectedType = "Only Friends";
                  });
                },
                borderRadius: BorderRadius.circular(32),
                selectedColor: Colors.white,
                fillColor: const Color(0xFF65558F),
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Private"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Public"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Only Friends"),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Κουμπί Αποθήκευσης
              ElevatedButton(
                onPressed: () {
                  String folderName = _folderNameController.text.trim();
                  if (folderName.isNotEmpty) {
                    setState(() {
                      courses.add({
                        'title': folderName,
                        'description': 'This is a $_selectedType folder.',
                      });
                    });
                    _folderNameController.clear();
                    Navigator.pop(context); // Κλείνει το Bottom Sheet
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF65558F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 32),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: Color(0xFF65558F),
                    child: Text(
                      'A',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Andreas',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: _showAddFolderSheet,
                    icon: const Icon(Icons.add, size: 32, color: Color(0xFF65558F)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'My Notes',
                style: TextStyle(
                  color: Color(0xFF65558F),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(thickness: 1, color: Color(0xFF65558F)),
            const SizedBox(height: 20),

            // Δυναμική λίστα καρτών
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return CourseCard(
                    title: course['title']!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoursePage(
                            title: course['title']!,
                            description: course['description']!,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CourseCard({required this.title, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF3E8FF),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.folder, color: Color(0xFF65558F), size: 48),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF65558F),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoursePage extends StatelessWidget {
  final String title;
  final String description;

  const CoursePage({required this.title, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF65558F),
        title: Text(title),
      ),
      body: Center(
        child: Text(
          description,
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
