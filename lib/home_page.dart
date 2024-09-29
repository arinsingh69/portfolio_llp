import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Portfolio '),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Implement search functionality
              },
            ),
            IconButton(
              icon: const Icon(Icons.filter),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return FilterDrawer(
                      onSearch: (query) {
                        // Implement filtering based on search query
                      },
                      onClear: () {
                        // Clear filter
                      },
                    );
                  },
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings), // Assuming a gear icon for Dev Mode
              onPressed: () {
                // Toggle Dev Mode
              },
            ),
          ],
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Project'),
                Tab(text: 'Saved'),
                Tab(text: 'Shared'),
                Tab(text: 'Achievement'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Content for Project tab
                  ListView.builder(
                    itemCount: cards.length,
                    itemBuilder: (context, index) {
                      final card = cards[index];
                      return Card(
                        child: ListTile(
                          leading: SvgPicture.asset(card.image),
                          title: Text(card.title),
                          subtitle: Text(card.description),
                        ),
                      );
                    },
                  ),
                  // Content for Saved tab (similar structure with card data)
                  Center(child: Text('Saved')),
                  // Content for Shared tab (similar structure with card data)
                  Center(child: Text('Shared')),
                  // Content for Achievement tab (similar structure with card data)
                  Center(child: Text('Achievement')),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.input),
              label: 'Input',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Portfolio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            // ... other bottom navigation items
          ],
          selectedItemColor: Colors.brown,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}

class FilterDrawer extends StatelessWidget {
  final void Function(String query) onSearch;
  final void Function() onClear;

  const FilterDrawer({required this.onSearch, required this.onClear});

  @override
  Widget  build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Search',
            ),
            onChanged: onSearch,
          ),
          TextButton(
            onPressed: onClear,
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}

// Define card data structure
class CardData {
  final String title;
  final String description;
  final String image;

  CardData({required this.title, required this.description, required this.image});
}

// Sample card data
final List<CardData> cards = [
  CardData(
    title: 'Card 1',
    description: 'Description for Card 1',
    image: 'assets/card1_image.svg', // Replace with actual SVG path
  ),
  // Add more card data as needed
];