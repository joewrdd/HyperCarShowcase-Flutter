import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.white10],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'About HyperCar Showcase',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Welcome to HyperCar Showcase, the ultimate destination for hypercar enthusiasts who are captivated by the thrill of speed, the elegance of luxury, and the pursuit of automotive perfection. Here, we bring the world’s most exclusive hypercars to your fingertips, creating an immersive experience like no other.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Our Vision',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Our vision is to unite hypercar aficionados from around the globe through a platform that celebrates innovation, performance, and style. HyperCar Showcase is more than just a platform—it\'s a community where passion for hypercars meets cutting-edge insights and exploration.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Discover What We Offer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'At HyperCar Showcase, we provide a comprehensive experience for every hypercar enthusiast. Dive into features designed to inspire and inform:',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  '• Explore in-depth details and high-quality visuals of the world\'s most iconic hypercars.\n'
                  '• Compare performance metrics, technical specifications, and pricing effortlessly by trying our own car quiz section.\n'
                  '• Build your personal collection of favorite hypercars and keep them all in one place.\n'
                  '• Connect with other enthusiasts by chatting in our global chat.\n'
                  '• Locate authorized service centers associated with top manufacturers.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Why HyperCar Showcase?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'We blend sophistication and simplicity to deliver a showcase that truly reflects the world of hypercars. Our bold red and black design echoes the spirit of hypercar culture—sleek, powerful, and exhilarating. Whether you\'re seeking inspiration or knowledge, we ensure an experience that\'s as thrilling as the cars themselves.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  'Join the Hypercar Lifestyle',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'HyperCar Showcase is your gateway to the world of high-performance automotive excellence. Whether you\'re a seasoned collector, a performance enthusiast, or someone who dreams of owning a hypercar, this is the place to explore, connect, and indulge in the art of driving. Start your journey today and immerse yourself in the pinnacle of automotive craftsmanship.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
