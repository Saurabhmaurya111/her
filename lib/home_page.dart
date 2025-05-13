import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:herlytics/about.dart';
import 'package:herlytics/contactUs.dart';
import 'package:herlytics/gallery.dart';
import 'package:herlytics/pdf.dart';
import 'package:herlytics/resources.dart';
import 'package:herlytics/sign_In_Up.dart/singIn.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageModern extends StatelessWidget {
  final List<Map<String, dynamic>> _carouselItems = [
    {
      "imagePath": "assets/events/1e.jpg",
      "title": "Explore New Events",
      "description":
          "Discover a variety of events that empower and inspire women in STEM and data science fields.",
      "buttonText": "Learn More",
    },
    {
      "imagePath": "assets/events/2e.jpg",
      "title": "Learn and Grow",
      "description":
          "Access resources, mentorship, and workshops designed to build a strong foundation in data science.",
      "buttonText": "Join Now",
    },
    {
      "imagePath": "assets/events/4.jpg",
      "title": "Shape Your Future",
      "description":
          "Connect with like-minded individuals and become part of a thriving community.",
      "buttonText": "Our Mission",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Navigation Bar
            _buildNavigationBar(context),

            // Carousel Section
            _buildCarouselSection(),
          const  SizedBox(height: 40),

            // Mission Section
            _buildMissionSection(),
          const  SizedBox(height: 40),

            // Services Section
            _buildServicesSection(context),
          const  SizedBox(height: 40),

            // Testimonials Section
            _buildTestimonialsSection(),
          const  SizedBox(height: 40),

            // Team Section
            _buildTeamSection(),
          const  SizedBox(height: 40),

            // Newsletter Subscription Section
            _buildNewsletterSection(),
          const  SizedBox(height: 40),

            // Footer Section
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      color: Colors.white,
      child: Row(
        children: [
        const  Text(
            "HERlytics",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        const  Spacer(),
          _navButton(context, "Home"),
          _navButton(context, "Events"),
          _navButton(context, "About Us"),
          _navButton(context, "Gallery"),
          _navButton(context, "Contact Us"),
        const  SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to login/register page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LoginPage()), // Replace with your Login page widget
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding:const EdgeInsets.symmetric(horizontal: 20),
            ),
            child:const Text(
              "Login/Register",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navButton(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () {
          // Handle navigation based on the label
          if (label == "Home") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePageModern()),
            );
          } else if (label == "Events") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                   const   PDFViewerWeb()), // Replace with your EventsPage widget
            );
          } else if (label == "About Us") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AboutUsPage()), // Replace with your AboutUsPage widget
            );
          } else if (label == "Gallery") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                 const     EventGallery()), // Replace with your GalleryPage widget
            );
          } else if (label == "Contact Us") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ContactUsPage()), // Replace with your ContactUsPage widget
            );
          }
        },
        child: Text(
          label,
          style:const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildCarouselSection() {
    return CarouselSlider(
      items: _carouselItems.map((item) {
        return Container(
          margin:const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(item["imagePath"]),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding:const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["title"],
                  style:const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
               const SizedBox(height: 10),
                Text(
                  item["description"],
                  style:const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
             const   SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: Text(item["buttonText"]),
                ),
              ],
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 400,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        autoPlayCurve: Curves.easeInOut,
      ),
    );
  }

  Widget _buildMissionSection() {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const  Text(
                  "HERlytics: Bridging STEM and Data Science",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const  SizedBox(height: 20),
              const  Text(
                  "Empowering women to reach their full potential in the field of data science through education, mentorship, and community-building initiatives.",
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              const  SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child:const Text("Learn More"),
                ),
              ],
            ),
          ),
        const  SizedBox(width: 20),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/multiplehands.jpg',
                fit: BoxFit.cover,
                height: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const  Text(
            "Our Services",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
         const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _serviceCard("Workshops", Icons.work),
              _serviceCard("Mentorship", Icons.person),
              GestureDetector(
                onTap: () {
                  // Navigate to resources page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ResourcesPage(),
                    ),
                  );
                },
                child: _serviceCard("Resources", Icons.book)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _serviceCard(String title, IconData icon) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 150,
        padding:const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.orange),
          const  SizedBox(height: 10),
            Text(
              title,
              style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestimonialsSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "What Our Members Say",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "“HERlytics has changed my career path completely. I feel more confident in data science.” – Dr. Iram Naim",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
          SizedBox(height: 10),
          Text(
            "“An excellent initiative for women in STEM!” – Saurabh Maurya",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection() {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const  Text(
            "Meet Our Team",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
      const    SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _teamCard(
                "Dr. Iram Naim",
                "Founder",
                "assets/iram mam profile.jpg",
              ),
              _teamCard(
                "Aditya Nath Mishra",
                "Mentor",
                "assets/Aditya Nath Mishra.jpg",
              ),
              _teamCard(
                "Abhishek Kumar",
                "Coordinator",
                "assets/Abhishek Kumar.jpg",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _teamCard(String name, String role, String image) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 50,
          backgroundColor: Colors.orange,
        ),
       const SizedBox(height: 10),
        Text(name, style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(role, style:const TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }

  Widget _buildNewsletterSection() {
    return Container(
      padding:const EdgeInsets.all(40),
      color: Colors.orange[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const  Text(
            "Subscribe to Our Newsletter",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
         const SizedBox(height: 20),
        const  Text(
            "Stay updated with the latest events and resources from HERlytics.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        const  SizedBox(height: 20),
          SizedBox(
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter your email address",
                border:const OutlineInputBorder(),
                suffixIcon: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Subscribe"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      color: Colors.grey[900],
      padding:const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Brand Name
        const  Text(
            "HERlytics",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
         const SizedBox(height: 20),

          // Footer Links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _footerLink("About Us"),
              _footerLink("Events"),
              _footerLink("Gallery"),
              _footerLink("Contact Us"),
            ],
          ),
        const  SizedBox(height: 20),

          // Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialMediaIcon(
                FontAwesomeIcons.facebook,
              ),
              _socialMediaIcon(
                FontAwesomeIcons.instagram,
              ),
              _socialMediaIcon(
                FontAwesomeIcons.twitter,
              ),
              _socialMediaIcon(
                FontAwesomeIcons.linkedin,
              ),
            ],
          ),
        const  SizedBox(height: 20),

          // Copyright Information
        const  Text(
            "© 2025 HERlytics. All rights reserved.",
            style: TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextButton(
        onPressed: () {
          // Implement navigation based on footer link
          // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage()));
        },
        child: Text(
          label,
          style:const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _socialMediaIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          // Implement social media navigation (e.g., open link or app)
        },
      ),
    );
  }
}
