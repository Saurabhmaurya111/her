import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,        
        backgroundColor: Colors.deepPurple.shade700,
        title: Text(
          'Contact Us',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              SizedBox(height: 20),
              Text(
                'We\'d love to hear from you!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade800,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Feel free to reach out to us using the contact form below or through our contact information.',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),

              // Contact Form Section
              SizedBox(height: 30),
              // Text(
              //   'Contact Form',
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.deepPurple.shade800,
              //   ),
              // ),
              SizedBox(height: 10),
              // _contactForm(),

              // Contact Information Section
              SizedBox(height: 30),
              Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade800,
                ),
              ),
              SizedBox(height: 10),
              _contactInfo(),

              // Social Media Links Section (Optional)
              SizedBox(height: 30),
              Text(
                'Follow Us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade800,
                ),
              ),
              SizedBox(height: 10),
              _socialMediaLinks(),
            ],
          ),
        ),
      ),
    );
  }

  // Contact Form Widget
  Widget _contactForm() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Full Name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: Icon(Icons.person),
          ),
        ),
        SizedBox(height: 15),
        TextField(
          decoration: InputDecoration(
            labelText: 'Email Address',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: Icon(Icons.email),
          ),
        ),
        SizedBox(height: 15),
        TextField(
          decoration: InputDecoration(
            labelText: 'Message',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: Icon(Icons.message),
          ),
          maxLines: 4,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple.shade600,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          child: Text('Send Message', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }

  // Contact Info Widget
  Widget _contactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.phone, color: Colors.deepPurple.shade700),
            SizedBox(width: 10),
            Text('+91 9720108286', style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.email, color: Colors.deepPurple.shade700),
            SizedBox(width: 10),
            Text('contact@herlytics.com', style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.location_on, color: Colors.deepPurple.shade700),
            SizedBox(width: 10),
            Text('Pilibhit Bypass Rd, M.J.P Rohilkahand University, Bareilly, Uttar Pradesh 243006', style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
          ],
        ),
      ],
    );
  }

  // Social Media Links Widget (Optional)
  Widget _socialMediaLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(FontAwesomeIcons.facebook, color: Colors.deepPurple.shade700),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.twitter, color: Colors.deepPurple.shade700),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.linkedin, color: Colors.deepPurple.shade700),
          onPressed: () {},
        ),
      ],
    );
  }
}
