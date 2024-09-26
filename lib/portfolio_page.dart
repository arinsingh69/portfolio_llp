import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Portfolio"),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.h), // Responsive size
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TabButton(label: 'Project', isSelected: _selectedIndex == 0, onPressed: () => _onTabChanged(0)),
                TabButton(label: 'Saved', isSelected: _selectedIndex == 1, onPressed: () => _onTabChanged(1)),
                TabButton(label: 'Shared', isSelected: _selectedIndex == 2, onPressed: () => _onTabChanged(2)),
                TabButton(label: 'Achievement', isSelected: _selectedIndex == 3, onPressed: () => _onTabChanged(3)),
              ],
            ),
          ),
        ),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Portfolio'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Input'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBody() {
    if (_selectedIndex == 0) {
      return const ProjectList();  // Here, we call the ProjectList widget to display the list of projects
    } else {
      return const Center(child: Text("Empty Tab"));
    }
  }
}

// Step 4 Code goes here (below _PortfolioPageState)

// This is the Project List Widget
class ProjectList extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {'title': 'Kemampuan Merangkum Tulisan', 'subtitle': 'BAHASA SUNDA', 'grade': 'A'},
    {'title': 'Kemampuan Menulis Tangan', 'subtitle': 'BAHASA INGGRIS', 'grade': 'B'},
    // Add more static projects here
  ];

  const ProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          child: ListTile(
            leading: Image.network('https://via.placeholder.com/150'), // Placeholder image
            title: Text(project['title']!),
            subtitle: Text(project['subtitle']!),
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Text(
                project['grade']!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Step 4 Code ends here

// Tab Button Widget (Already included in Step 3)
class TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const TabButton({super.key, required this.label, required this.isSelected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.orange : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 16.sp,  // Responsive text
            ),
          ),
          if (isSelected)
            Container(
              height: 2.h,
              width: 60.w,
              color: Colors.orange,
            ),
        ],
      ),
    );
  }
}
