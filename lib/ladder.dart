import 'package:flutter/material.dart';

class LadderStats extends StatelessWidget {
  const LadderStats({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data
    final stats = [
      {'title': 'Events', 'count': 25, 'color': Colors.orange},
      {'title': 'Participants', 'count': 1200, 'color': Colors.blue},
      {'title': 'Ambassadors', 'count': 50, 'color': Colors.green},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text(
                "Our Impact",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Statistics that showcase our community's growth and achievements.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Stats Cards
              ...stats.map((stat) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      height: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            (stat['color'] as Color).withOpacity(0.8),
                            stat['color'] as Color,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: (stat['color'] as Color).withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.star,
                              color: stat['color'] as Color,
                              size: 35,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TweenAnimationBuilder<int>(
                                  tween: IntTween(
                                    begin: 0,
                                    end: stat['count'] as int,
                                  ),
                                  duration: const Duration(seconds: 3),
                                  builder: (context, value, child) {
                                    return Text(
                                      '$value+',
                                      style: const TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  stat['title'] as String,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
