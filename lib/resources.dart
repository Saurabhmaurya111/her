import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;
  late Animation<Offset> _animation3;
  late Animation<Offset> _animation4;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation1 = _createAnimation(0.0, 0.25);
    _animation2 = _createAnimation(0.25, 0.5);
    _animation3 = _createAnimation(0.5, 0.75);
    _animation4 = _createAnimation(0.75, 1.0);

    _controller.forward();
  }

  Animation<Offset> _createAnimation(double begin, double end) {
    return Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Interval(begin, end, curve: Curves.easeOut)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: screenWidth / (screenHeight * 0.75), // max 25% height per box
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            _buildAnimatedBox("Online Courses", Icons.school, _animation1, "https://swayam.gov.in/"),
            _buildAnimatedBox("Learning Material", Icons.menu_book, _animation2, "https://up.gov.in/en/page/digital-learning-resources  "),
            _buildAnimatedBox("Hands-on Lab", Icons.computer, _animation3, "https://diksha.gov.in/virtuallabs.html#"),
            _buildAnimatedBox("Govt Interface", Icons.account_balance, _animation4, "https://ncert.nic.in/textbook.php"),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedBox(String title, IconData icon, Animation<Offset> animation, String url) {
    return SlideTransition(
      position: animation,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        child: InkWell(
          onTap: () async {
            final Uri _url = Uri.parse(url); // Convert the string to Uri

            // Use canLaunchUrl to check if the URL can be launched
            if (await canLaunchUrl(_url)) {
              await launchUrl(_url); // Open the URL
            } else {
              throw 'Could not launch $url';
            }
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 30, color: Colors.orange),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
