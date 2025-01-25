import 'package:flutter/material.dart';

class EventGallery extends StatelessWidget {
  const EventGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final events = [
      {'title': 'Event 1', 'image': 'assets/events/1.jpg'},
      {'title': 'Event 2', 'image': 'assets/events/2.jpg'},
      {'title': 'Event 3', 'image': 'assets/events/3.jpg'},
      {'title': 'Event 4', 'image': 'assets/events/4.jpg'},
      {'title': 'Event 5', 'image': 'assets/events/5.jpg'}, 
      {'title': 'Event 6', 'image': 'assets/events/6.jpg'},
      {'title': 'Event 1', 'image': 'assets/events/1.jpg'},
      {'title': 'Event 2', 'image': 'assets/events/2.jpg'},
      {'title': 'Event 3', 'image': 'assets/events/3.jpg'},
      {'title': 'Event 4', 'image': 'assets/events/4.jpg'},
      {'title': 'Event 5', 'image': 'assets/events/5.jpg'},
      {'title': 'Event 6', 'image': 'assets/events/6.jpg'},
    ];

    return Scaffold(
      appBar: AppBar(
       
        title: const Text(
          'Event Gallery',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // Number of columns
            crossAxisSpacing: 10.0, // Space between columns
            mainAxisSpacing: 10.0, // Space between rows
            childAspectRatio: 0.8, // Adjust card size
          ),
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      event['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.0),
                          Colors.black.withOpacity(0.8),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Text(
                      event['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
