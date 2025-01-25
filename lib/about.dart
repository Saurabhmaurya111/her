import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        backgroundColor: Colors.deepPurple.shade700,
        title: Text(
          'About Us',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/herlytics_header.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Empowering Women in Data Science',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(blurRadius: 10, color: Colors.black, offset: Offset(0, 4))],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            
            // Mission & Vision Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Mission & Vision',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple.shade800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'HERlytics is dedicated to bridging the gender gap in data science by providing resources, education, and a platform for women to excel in STEM fields. Our mission is to empower women to become leaders in the data science industry, offering mentorship, training, and opportunities to excel.',
                style: TextStyle(fontSize: 18, height: 1.5, color: Colors.grey.shade700),
              ),
            ),
            
            // Team Section
         // Team Section
// Team Section
Center(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      mainAxisSize: MainAxisSize.min, // Ensure the column doesn't take unnecessary space
      children: [
        Text(
          'Our Team',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple.shade800),
        ),
        SizedBox(height: 10),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              // Wrap each team member in a Padding and Center them inside a Row
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: _teamMember('assets/iram mam profile.jpg', 'Dr. Iram Naim', 'Founder'),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: _teamMember('assets/Aditya Nath Mishra.jpg', 'Aditya Nath Mishra', 'Mentor'),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: _teamMember('assets/Abhishek Kumar.jpg', 'Abhishek Kumar', 'Coordinator'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: _teamMember('assets/saurabh img.jpg', 'Saurabh Kumar Maurya', 'Project Manager'),
              ),
              
            ],
          ),
        ),
      ],
    ),
  ),
)
,

            
            // Developer Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'Our Developers',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple.shade800),
              ),
            ),
            Container(
              color: Colors.deepPurple.shade50,
              child: Column(
                children: [
                  _developerInfo('assets/saurabh img.jpg', 'Saurabh Kumar Maurya', 'Lead Developer', 'Flutter, Dart, Firebase,Node.js'),
                  _developerInfo('assets/prashant.jpg', 'Prashant Yadav', 'Backend Developer', 'Python, APIs'),
                  _developerInfo('assets/sachin.jpg', 'Sheelendra Sharma', 'UI/UX Designer', 'Figma, Adobe XD'),
                ],
              ),
            ),

            // Impact Timeline Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                'Our Impact',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple.shade800),
              ),
            ),
            _impactTimeline(),
            
            // Call to Action
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade600,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text('Join Us', style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Team Member Widget
  Widget _teamMember(String imagePath, String name, String position) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 10),
          Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(position, style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  // Developer Info Widget
  Widget _developerInfo(String imagePath, String name, String role, String skills) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(role, style: TextStyle(fontSize: 16, color: Colors.grey)),
              Text(skills, style: TextStyle(fontSize: 14, color: Colors.deepPurple.shade600)),
            ],
          ),
        ],
      ),
    );
  }

  // Impact Timeline Widget
  Widget _impactTimeline() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _timelineEvent('2019', 'HERlytics Founded', 'Providing access to training and mentorship to women in data science.'),
          _timelineEvent('2020', 'First Workshop', 'Held our first virtual workshop on Python for Data Science.'),
          _timelineEvent('2022', 'Global Expansion', 'Expanded to global networks, with over 1,000 women mentored.'),
        ],
      ),
    );
  }

  // Timeline Event Widget
  Widget _timelineEvent(String year, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 8,
            backgroundColor: Colors.deepPurple.shade600,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(year, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple.shade600)),
              Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(description, style: TextStyle(fontSize: 16, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
