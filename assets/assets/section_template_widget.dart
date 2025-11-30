import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // To open the URL

// A generic template for all portfolio sections to maintain consistent styling
class SectionTemplate extends StatelessWidget {
  final String title;
  final String description;
  final Widget? iconWidget;


  const SectionTemplate({
    super.key,
    required this.title,
    required this.description,
    this.iconWidget,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;
    // Use the same responsive padding as the main screen
    final double horizontalPadding = isMobile ? 20 : 60;

    return Center(
      child: Container(
        // Max width to keep the text readable on very wide screens
        constraints: const BoxConstraints(maxWidth: 1000),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Center all items inside the Column
          children: [
            Row
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  //Icon(Icons.abc),
                 // if (iconWidget != null) iconWidget!,
                 // SizedBox(width: 10,),
                  // --- UPDATED: Title Container with Blue Border and Glow ---
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                      // Background color slightly dark for contrast
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      // Blue Border
                      border: Border.all(color: Colors.cyan.withOpacity(0.5), width: 2),
                      boxShadow: [
                        // Blue Glow Shadow
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.cyanAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                ],

              ),


            const SizedBox(height: 20),
            Text(
              description, // English Placeholder
              textAlign: TextAlign.center, // Center the description text
              style: const TextStyle(fontSize: 18, color: Colors.white70),
            ),
            //const SizedBox(height: 50),

          ],
        ),
      ),
    );
  }
}

// --- Specific Section Wrappers using the Template (Ready for content/photo) ---


// --- UTILITY WIDGET: A dedicated Card for About Me details ---
class AboutDetailCard extends StatelessWidget {
  final String title;
  final String content;


  const AboutDetailCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // Darker card background, same as scaffold but slightly lighter
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(10),
        // Subtle Cyan Border/Glow effect for professional look
        border: Border.all(color: Colors.cyan.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.05), // Light glow effect
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title (The most crucial part, using the Cyan Accent color)
          Text(
            title,
            style: GoogleFonts.poppins( // Using a professional font
              color: Colors.cyanAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          // Content
          Text(
            content,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class AboutDetailItem extends StatelessWidget {
  final String title;
  final String content;
  final bool isMobile;


  const AboutDetailItem({
    super.key,
    required this.title,
    required this.content,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title (The most crucial part, using the Cyan Accent color)
        Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.cyanAccent.withOpacity(0.9), // Highlighted title
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        // Content
        Text(
          content,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

// --- MAIN ABOUT ME SECTION WIDGET ---

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  final List<Map<String, String>> aboutMeData = const [
    {
      'title': '🚀 Introduction & Core Identity',
      'content':
      "Hello! I'm **Safil Bhoraniya**, an **Elite Flutter Developer** dedicated to building user-centric, high-performance cross-platform mobile and web applications. My passion is blending technical precision with seamless, beautiful design.",
    },
    {
      'title': '🛠️ Professional Expertise (Experience: 1+ Year)',
      'content':
      "**Safil Bhoraniya** possesses **1+ year of hands-on experience** in Flutter/Dart, specializing in State Management (e.g., Riverpod, BLoC) and Clean Architecture. I transform complex ideas into robust, production-ready products. My focus is performance optimization and writing clean, maintainable code.",
    },
    {
      'title': '✨ Proven Impact & Vision (Product & Service-Based Work)',
      'content':
      "My background includes working within agile **product-based** environments as well as delivering high-quality, scalable solutions for **service-based** clients. This portfolio serves as a live demonstration of my capabilities in creating complex, real-world applications.",
    },
    {
      'title': '🎓 Education & Background',
      'content':
      "I am currently pursuing a **B.Com (Running)** and hold a **Diploma in Native Application** from **TOPS Technologies, Rajkot**. I am committed to continuous learning, always staying ahead with the latest Dart and Flutter updates.",
    },
    {
      'title': '📍 Personal Details & Contact',
      'content': 'I am from wankaner city. Email: safilbhoraniya8@gmail.com. LinkedIn: https://www.linkdin.com/in/safi-bhoraniya-965a2235a.  '
          'Mobile no : 6352485375',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    // We combine the SectionTemplate and custom content in one Column
    // This Column will be the child of the SliverList in main.dart
    return Column(
      children: [
        // // 1. Section Template (Title, Description, Icon) - This is standard.
        const SectionTemplate(
          iconWidget: Icon(Icons.expand_more_outlined, size: 80, color: Colors.orangeAccent),
          title: 'ABOUT ME',
          description: 'The journey of a dedicated cross-platform developer, blending design with robust technical solutions.',
        //  iconWidget: Icon(Icons.info_outline, size: 80, color: Colors.cyanAccent),
        ),

        // 2. Custom Content (The Single Card Design)
        //const SizedBox(height: 30),

        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800), // Max width for the card
            margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
            padding: EdgeInsets.all(isMobile ? 20 : 40),

            // The main card decoration: Dark background with cyan glow
            decoration: BoxDecoration(
              color: const Color(0xFF141414), // Darker card background
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.cyan.withOpacity(0.2), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyanAccent.withOpacity(0.15),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),

            // ✅ FIX FOR OVERFLOW: Using ListView.separated inside a Column
            // is safe inside the main CustomScrollView (SliverList)
            child: ListView.separated(
              shrinkWrap: true, // Crucial for embedding ListView in Column/SliverList
              physics: const NeverScrollableScrollPhysics(), // Important! Prevent nested scrolling
              itemCount: aboutMeData.length,
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Divider(color: Colors.white10, height: 1), // Separator line
              ),
              itemBuilder: (context, index) {
                return AboutDetailItem(
                  title: aboutMeData[index]['title']!,
                  content: aboutMeData[index]['content']!,
                  isMobile: isMobile,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 100), // Spacer before the next section
      ],
    );
  }
}
  // --- Web/PC Layout (Two Columns) ---
  Widget _buildWebLayout(List<Map<String, String>> data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Profile Photo Container (Left Side)
        Container(
          width: 300,
          padding: const EdgeInsets.only(right: 40),
          child: Column(
            children: [
              // Circular Image Placeholder with a glow
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade800,
                  border: Border.all(color: Colors.cyanAccent, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.white,
                ),
                // Replace the Icon with an Image Widget later:
                // child: ClipOval(child: Image.network('[Your Image URL]', fit: BoxFit.cover)),
              ),
              const SizedBox(height: 20),
              Text(
                'Contact: [आपका ईमेल]',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
              ),
              Text(
                'Location: [आपका शहर]',
                style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),

        // 2. Information Cards (Right Side)
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two cards per row for PC
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 2.0, // Control the card height/width ratio
            ),
            itemBuilder: (context, index) {
              return AboutDetailCard(
                title: data[index]['title']!,
                content: data[index]['content']!,
              );
            },
          ),
        ),
      ],
    );
  }

  // --- Mobile Layout (Single Column) ---
  Widget _buildMobileLayout(List<Map<String, String>> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 1. Profile Photo Container (Top)
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade800,
            border: Border.all(color: Colors.cyanAccent, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.3),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const Icon(Icons.person, size: 70, color: Colors.white),
        ),
        const SizedBox(height: 15),
        Text(
          'Contact: [आपका ईमेल]',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
        ),
        Text(
          'Location: [आपका शहर]',
          style: GoogleFonts.poppins(color: Colors.white70, fontSize: 12),
        ),
        const SizedBox(height: 30),

        // 2. Information Cards (Single Column)
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemBuilder: (context, index) {
            return AboutDetailCard(
              title: data[index]['title']!,
              content: data[index]['content']!,
            );
          },
        ),
      ],
    );
  }



// --- UTILITY WIDGET: Skill Card Design ---
class SkillCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const SkillCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // FIXED HEIGHT: Skill Card के लिए एक स्थिर ऊँचाई निर्धारित करें
      // यह GridView के mainAxisExtent के साथ मिलकर ओवरफ़्लो को रोकेगा।
      height: 250, // एक अनुमानित ऊँचाई, आप इसे बदल सकते हैं।
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF141414), // Dark background matching About Card
        borderRadius: BorderRadius.circular(10),
        // Subtle Cyan Border/Glow effect on the card
        border: Border.all(color: Colors.cyan.withOpacity(0.1), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.cyanAccent, // Cyan Accent for the icon
          ),
          const SizedBox(height: 15),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          // DESCRIPTION: Flexible/Expanded का उपयोग करें ताकि Text overflow न हो
          Expanded(
            child: Text(
              description,
              textAlign: TextAlign.center,
              // maxLines को हटा दिया गया है ताकि टेक्स्ट पूरी तरह से दिख सके
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- MAIN SKILLS SECTION WIDGET ---

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  // Data for the Skills Section (unchanged)
  final List<Map<String, dynamic>> skillsData = const [
    {
      'icon': Icons.mobile_friendly,
      'title': 'Flutter & Dart',
      'description': 'Expert in building high-performance, cross-platform applications from a single codebase.',
    },
    {
      'icon': Icons.storage,
      'title': 'API & Firebase',
      'description': 'Proficient in REST API integration, state management, and real-time backend services like Firebase.',
    },
    {
      'icon': Icons.architecture,
      'title': 'Clean Architecture',
      'description': 'Implementing scalable architecture (e.g., BLoC, Riverpod) for maintainable and testable codebases.',
    },
    {
      'icon': Icons.code_off, // Using a similar icon for problem solving
      'title': 'Problem Solving',
      'description': 'Strong analytical skills for debugging, performance optimization, and implementing complex logic.',
    },
    {
      'icon': Icons.security,
      'title': 'App Security',
      'description': 'Knowledge of data security best practices and secure API handling in mobile environments.',
    },
    {
      'icon': Icons.sync,
      'title': 'CI/CD & Git',
      'description': 'Experience with version control (Git) and automated deployment pipelines (CI/CD) for efficient workflow.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Column(
      children: [
        // 1. Section Template (Title, Description, Icon) - Standard Look (Assuming available)
        const SectionTemplate(
          title: '--- SKILLS & EXPERTISE ---',
          description: 'A comprehensive overview of the technical stack and problem-solving capabilities delivered by **Safil Bhoraniya**.', // Name added here
          iconWidget: Icon(Icons.code, size: 30, color: Colors.orangeAccent),
        ),

        // 2. Custom Content (The Responsive Skill Cards Grid)
        //const SizedBox(height: 50),

        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1100), // Wider max width for skills grid
            margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),

            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: skillsData.length,

              // *** UPDATED: Responsive Grid Layout using MaxCrossAxisExtent ***
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 350, // अधिकतम चौड़ाई (Card Width)
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                mainAxisExtent: 250, // Card की स्थिर ऊँचाई (Fixed Height)
              ),

              itemBuilder: (context, index) {
                final skill = skillsData[index];
                return SkillCard(
                  icon: skill['icon'] as IconData,
                  title: skill['title'] as String,
                  description: skill['description'] as String,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 100), // Spacer before the next section
      ],
    );
  }
}
// --- UTILITY WIDGET: Service Card Design ---
class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String details;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // ServiceCard को GridView के mainAxisExtent द्वारा नियंत्रित किया जाएगा।
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFF141414), // Dark background
        borderRadius: BorderRadius.circular(15), // Slightly more rounded corners
        // Cyan Glow Effect (Slightly stronger than Skill Card)
        border: Border.all(color: Colors.cyan.withOpacity(0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.2),
            blurRadius: 25,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Icon - Using blue/cyan for service distinction
          Icon(
            icon,
            size: 55,
            color: Colors.blueAccent.shade100, // Slightly different blue accent
          ),
          const SizedBox(height: 20),
          // Title
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.cyanAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Details - Use Expanded/Flexible to prevent overflow
          Expanded( // Added Expanded to allow the text to fill the remaining space
            child: Text(
              details,
              // maxLines और overflow को हटा दिया गया है
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- MAIN SERVICES SECTION WIDGET ---

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  // Data for the Services Section (unchanged)
  final List<Map<String, dynamic>> servicesData = const [
    {
      'icon': Icons.phone_android,
      'title': 'Cross-Platform App Development',
      'details': 'End-to-end development of Mobile Apps (Android & iOS) using **Flutter**, ensuring a unified experience.',
    },
    {
      'icon': Icons.web,
      'title': 'Web Application Development',
      'details': 'Building modern, responsive, and performant web apps using Flutter, perfect for dashboards and interactive sites.',
    },
    {
      'icon': Icons.desktop_windows,
      'title': 'Desktop Application Development',
      'details': 'Creating native-feel applications for Windows, macOS, and Linux, leveraging Flutter’s desktop capabilities.',
    },
    {
      'icon': Icons.layers,
      'title': 'UI/UX Prototyping & Design',
      'details': 'Converting wireframes and complex designs into pixel-perfect Flutter UIs with smooth animations and accessibility.',
    },
    {
      'icon': Icons.bug_report,
      'title': 'Code Audit & Optimization',
      'details': 'In-depth analysis of existing Flutter codebases to improve performance, fix memory leaks, and refactor code using Clean Architecture principles.',
    },
    {
      'icon': Icons.support_agent,
      'title': 'Technical Consulting',
      'details': 'Providing expert guidance on state management, backend integration (Firebase/APIs), and overall project structure.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Column(
      children: [
        // 1. Section Template (Title, Description, Icon) - Standard Look
        const SectionTemplate(
          title: '--- SERVICES OFFERED ---',
          description: 'Custom, high-quality development solutions powered by Flutter, delivered by **Safil Bhoraniya** to bring your digital vision to life.', // Name added here
          iconWidget: Icon(Icons.handyman, size: 80, color: Colors.redAccent),
        ),

        // 2. Custom Content (The Responsive Services Grid)
       // const SizedBox(height: 50),

        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1000), // Max width for the services grid
            margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),

            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: servicesData.length,

              // *** UPDATED: Responsive Grid Layout using MaxCrossAxisExtent ***
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500, // Card की अधिकतम चौड़ाई (500px से छोटा होने पर 1 कॉलम)
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                mainAxisExtent: 250, // Card की स्थिर ऊँचाई (Fixed Height)
              ),

              itemBuilder: (context, index) {
                final service = servicesData[index];
                return ServiceCard(
                  icon: service['icon'] as IconData,
                  title: service['title'] as String,
                  details: service['details'] as String,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 100), // Spacer before the next section
      ],
    );
  }
}
// --- MAIN PROJECTS SECTION WIDGET ---

// Assuming SectionTemplate is defined elsewhere and works correctly.


// यह विजेट Hero animation के साथ फुल-स्क्रीन इमेज दिखाता है।
class FullScreenImageScreen extends StatelessWidget {
  final String imagePath;
  final String heroTag;

  const FullScreenImageScreen({
    super.key,
    required this.imagePath,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9), // Transparent dark background
      body: Stack(
        children: [
          // 1. Hero Animated Image
          Center(
            child: Hero(
              tag: heroTag,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Text('Image not found!', style: TextStyle(color: Colors.red)),
                ),
              ),
            ),
          ),

          // 2. Dismiss Button (Top Right)
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}


// -----------------------------------------------------------------------------
// --- 1. PROJECT DATA ---
// -----------------------------------------------------------------------------

// NOTE: Please ensure all these asset paths exist in your project's 'assets/' directory.

final List<Map<String, dynamic>> projectsData = const [
  {
    'name': 'Safare Islam',
    'icon_path': 'assets/app_icons/safare_islam.jpeg',
    'screenshots': [
      'assets/app_screenshot/safareislam_screenshot1.jpeg',
      'assets/app_screenshot/safareislam_screenshot2.jpeg',
      'assets/app_screenshot/safareislam_screenshot3.jpeg',
      'assets/app_screenshot/safareislam_screenshot4.jpeg',
      'assets/app_screenshot/safareislam_screenshot5.jpeg',
      'assets/app_screenshot/safareislam_screenshot6.jpeg',
      'assets/app_screenshot/safareislam_screenshot3.jpeg',
    ],
    'brief': 'Islamic knowledge-sharing app with categorized book reading and embedded PDF viewing. Features a custom Admin Panel via Laravel API for content management.',
    'details': 'Safare Islam is built using Flutter and Provider. Its sole purpose is to share Islamic knowledge. It features dynamic category/book management via a custom Laravel Admin Panel, secure in-app PDF viewing, and a best-in-class UI/UX design, making content sharing smooth and efficient.',
  },
  {
    'name': 'Atlanix',
    'icon_path': 'assets/app_icons/atlanix_app_logo.png',
    'screenshots': [
      'assets/app_screenshot/atlanix_screenshot.jpeg',
      'assets/app_screenshot/atlanix_screenshot2.jpeg',
      'assets/app_screenshot/atlanix_screenshot3.jpeg',
    ],
    'brief': 'An AI Image Generator app leveraging Gemini Studio API for user text-to-image creation, demonstrating mastery in AI API calls.',
    'details': 'Atlanix is a proof-of-concept application built to explore AI image generation. It integrates with advanced models like Gemini Studio and OpenAI (DALL-E) to translate text prompts into high-quality images. The project\'s focus was on mastering modern AI API integration and creating an intuitive user experience.',
  },
  {
    'name': 'CompX',
    'icon_path': 'assets/app_icons/compx_app_logo.png',
    'screenshots': [
      'assets/app_screenshot/compx_screenshot1.jpeg',
      'assets/app_screenshot/compx_screenshot2.jpeg',
      'assets/app_screenshot/compx_screenshot3.jpeg',
      'assets/app_screenshot/compx_screenshot4.jpeg',
      'assets/app_screenshot/compx_screenshot5.jpeg',
    ],
    'brief': 'A digital compass app with real-time directional display, location, direction history, and integrated AI speech feedback for verbal guidance.',
    'details': 'CompX is a highly functional digital compass utility built in Flutter. It provides precise directional guidance, displays current location details, and maintains a direction history. A key feature is the integrated AI Voice, which provides instant verbal confirmation of the device\'s direction, showcasing advanced mobile hardware and AI integration.',
  },
  {
    'name': 'Docuvert',
    'icon_path': 'assets/app_icons/docuvert_pdf_maker_app_icon.png',
    'screenshots': [
      'assets/docuvert/1.png',
      'assets/docuvert/2.png',
      'assets/docuvert/3.png',
      'assets/docuvert/4.png',
      'assets/docuvert/5.png',
      'assets/docuvert/6.png',
      'assets/docuvert/7.png',
      'assets/docuvert/8.png',
    ],
    'brief': 'An offline PDF Maker app featuring "Photos to PDF", "Scan to PDF", "Merge & Edit PDF", and "Note to PDF" functionalities with password encryption.',
    'details': 'Docuvert is a powerful, offline-first utility that allows users to create and manage various types of PDFs. It supports image-to-PDF, scanner-based PDF creation, and the merging/editing of existing documents. Crucially, it includes a robust password encryption feature to ensure the privacy and security of the digitally created documents.',
  },
  {
    'name': 'Truck LR',
    'icon_path': 'assets/icons/trucklr_icon.png',
    'screenshots': [], // No screenshots provided for this one
    'brief': 'Enterprise Webview application for logistics management, built for Android and Windows Desktop, featuring enhanced browser controls (forward/back, refresh).',
    'details': 'Truck LR is a comprehensive business solution for logistics, delivered as a hybrid application using a Flutter Webview wrapper. It was specifically optimized for Windows Desktop, providing advanced digital controls like seamless forward/back navigation and page-level refresh functionality, mirroring a high-quality web experience within a dedicated application. The Windows desktop version was delivered via a professional Inno Setup installer. **This entire portfolio website is also built using Flutter.**',
  },
];


// -----------------------------------------------------------------------------
// --- 2. UTILITY WIDGETS ---
// -----------------------------------------------------------------------------

// FullScreenImageScreen has been removed as per the request to use Dialog preview.

/// Image Viewer in a Dialog (Centered Preview)
class ShowcaseImageDialog extends StatelessWidget {
  final String imageUrl;

  const ShowcaseImageDialog({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          // 1. Image Container (with blue border/glow)
          Container(
            constraints: const BoxConstraints(maxWidth: 400, maxHeight: 650),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyanAccent.withOpacity(0.3),
                  blurRadius: 30,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Icon(Icons.broken_image, size: 80, color: Colors.white24),
                    )),
              ),
            ),
          ),

          // 2. Close Button (Top Right) - Tapping outside also closes the dialog
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Project Card Design
class ProjectCard extends StatelessWidget {
  final Widget appIconWidget;
  final String appName;
  final List<String> screenshotUrls;
  final String briefDescription;

  const ProjectCard({
    super.key,
    required this.appIconWidget,
    required this.appName,
    required this.screenshotUrls,
    required this.briefDescription,
  });

  void _showImagePreview(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ShowcaseImageDialog(imageUrl: imageUrl);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue.withOpacity(0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.2),
            blurRadius: 25,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. App Icon and Title
          Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: appIconWidget,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  appName,
                  style: GoogleFonts.poppins(
                    color: Colors.cyanAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // 2. Screenshots (Horizontal Scroll View) - Tap calls the Dialog Preview
          if (screenshotUrls.isNotEmpty) ...[
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: screenshotUrls.length,
                itemBuilder: (context, index) {
                  final imageUrl = screenshotUrls[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () => _showImagePreview(context, imageUrl),
                      child: Container(
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.cyan.withOpacity(0.3), width: 1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const Center(
                                child: Icon(Icons.image_not_supported, size: 40, color: Colors.white24)),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
          ],

          // 3. Brief Description
          Expanded(
            child: Text(
              briefDescription,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.4,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ),
        ],
      ),
    );
  }
}


// -----------------------------------------------------------------------------
// --- 3. MAIN PROJECTS SECTION WIDGET ---
// -----------------------------------------------------------------------------

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  // Helper method to build the main App Icon for the cards
  Widget _buildAppIcon(String assetPath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(assetPath, fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => const Icon(Icons.apps, color: Colors.cyanAccent)),
      ),
    );
  }

  // Helper Widget for the modern, row-based app showcase (Header)
  Widget _buildAppShowcaseRow(String name, String iconPath) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon Container with blue glow/box effect
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.cyan.withOpacity(0.5), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyanAccent.withOpacity(0.4),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                iconPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.apps, color: Colors.white, size: 40),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // App Name
          Text(
            name,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // Helper Widget for Detailed Descriptions
  Widget _buildDetailedDescription(BuildContext context, {required String title, required String content, required bool isMobile}) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue.withOpacity(0.3), width: 1.5), // Blue Effect
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.2),
            blurRadius: 25,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.cyanAccent,
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(color: Colors.cyanAccent),
          Text(
            content,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Column(
      children: [
        // 1. Section Title
        const Padding(
          padding: EdgeInsets.only(top: 80, bottom: 20),
          child: Text(
            '--- DIGITAL PROJECTS SHOWCASE 🚀 ---',
            style: TextStyle(
                color: Colors.cyanAccent,
                fontSize: 36,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
        ),

        // 2. Modern App Showcase Row (New Intro Design)
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              border: Border.all(color: Colors.blue.withOpacity(0.2), width: 1),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: projectsData.map((project) {
                  return _buildAppShowcaseRow(
                    project['name'] as String,
                    project['icon_path'] as String,
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),


        // 3. Projects Grid Cards (Responsive)
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
            padding: const EdgeInsets.only(bottom: 30),

            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: projectsData.length,
              // Responsive Grid Setup: Ensures 1 card on small screens, 2 on large screens.
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 450, // Max width of each tile
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                mainAxisExtent: 320, // Fixed height
              ),
              itemBuilder: (context, index) {
                final project = projectsData[index];
                // --- FIX APPLIED HERE ---
                final List<String> safeScreenshotUrls = (project['screenshots'] as List<dynamic>)
                    .cast<String>();
                // ------------------------
                return ProjectCard(
                  appIconWidget: _buildAppIcon(project['icon_path'] as String),
                  appName: project['name'] as String,
                  screenshotUrls: safeScreenshotUrls,
                  briefDescription: project['brief'] as String,
                );
              },
            ),
          ),
        ),

        // 4. Detailed Project Descriptions
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              _buildDetailedDescription(
                context,
                title: 'Project Deep Dive: Safare Islam (Islamic App)',
                content: projectsData[0]['details'] as String,
                isMobile: isMobile,
              ),
              const SizedBox(height: 50),
              _buildDetailedDescription(
                context,
                title: 'Project Deep Dive: Docuvert (Offline Utility)',
                content: projectsData[3]['details'] as String,
                isMobile: isMobile,
              ),
              const SizedBox(height: 50),
              _buildDetailedDescription(
                context,
                title: 'Professional Experience & Technology Stack',
                content:
                'The **Truck LR** application (Mobile and Windows Desktop) was developed as a comprehensive logistics solution. The system uses a Webview approach within a robust Flutter shell, providing advanced digital functionality like forward/back navigation, page refresh, and seamless Google integration. This project demonstrates the capability in building robust, hybrid enterprise apps that provide a high-quality web experience within a dedicated application. The Windows desktop version was delivered via a professional Inno Setup installer. \n\n**All the applications showcased above, including this entire portfolio website itself, are built using Flutter and Dart, demonstrating strong expertise in cross-platform development and digital UI/UX.**',
                isMobile: isMobile,
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }
}

// --- NEW Utility: Show Copied Message (Unchanged) ---
class CopiedMessage extends StatefulWidget {
  const CopiedMessage({super.key});

  @override
  State<CopiedMessage> createState() => _CopiedMessageState();
}

class _CopiedMessageState extends State<CopiedMessage> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _isVisible = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: const Text(
        'Copied!',
        style: TextStyle(
          fontSize: 10,
          color: Colors.lightGreenAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// --------------------------------------------------------------------------
// 2. Custom Contact Link Widget (UPDATED: NO Full Card Tap & Mobile Fix)
// --------------------------------------------------------------------------
class ContactLink extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final String copyValue; // Value to be copied to clipboard
  // final String launchUrl; <--- REMOVED

  const ContactLink({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.copyValue,
    // required this.launchUrl, <--- REMOVED
  });

  @override
  State<ContactLink> createState() => _ContactLinkState();
}

class _ContactLinkState extends State<ContactLink> {
  GlobalKey copiedKey = GlobalKey();
  bool _isHovering = false;

  // Function to copy the value and show the message (Called only by Copy Icon)
  void _copyAndShowMessage() {
    Clipboard.setData(ClipboardData(text: widget.copyValue));

    // Resetting the key to force the CopiedMessage widget to rebuild
    setState(() {
      copiedKey = GlobalKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine the transformation and shadow based on hover state
    final double elevation = _isHovering ? 20.0 : 10.0;
    final double translateY = _isHovering ? -5.0 : 0.0;

    // InkWell is REMOVED, as we don't want card tap
    return MouseRegion(
      cursor: SystemMouseCursors.basic, // Change cursor back to basic/default
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),

      // InkWell is removed, using GestureDetector to maintain hover state while removing card tap functionality
      child: GestureDetector(
        // onTap: null, // Card tap is disabled
        child: AnimatedContainer( // <--- ANIMATED CONTAINER for smooth effect
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,

          transform: Matrix4.translationValues(0.0, translateY, 0.0),

          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.cyan.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(_isHovering ? 0.4 : 0.2),
                blurRadius: elevation,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row( // Main Row
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // LEFT SIDE: Icon and Text Details
              Flexible( // <--- Added Flexible to handle the main content width
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(widget.icon, color: Colors.cyanAccent, size: 24),
                    const SizedBox(width: 15),
                    Flexible( // <--- Added Flexible around Column to prevent overflow
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.label,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.white54,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            widget.value,
                            // Added softWrap and overflow ellipsis for better mobile handling
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // RIGHT SIDE: Copy Button and Message
              // Using Padding instead of SizedBox to ensure spacing is calculated correctly against Flexible width
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: _copyAndShowMessage, // ONLY ICON TAP COPIES CONTENT
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.copy_rounded, color: Colors.white70, size: 24),
                      const SizedBox(height: 2),
                      CopiedMessage(key: copiedKey),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// NOTE: Please ensure the CopiedMessage widget and ContactSection remain available
// and correctly implemented as per previous steps.

// --- ContactSection (Assumed to be correct and using the updated ContactLink) ---
// (ContactSection code is excluded for brevity, as the fix is only in ContactLink)

// --- 3. Contact Section Widget (FIXED: Removed isMobile from SectionTemplate call) ---

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    // Safil Bhoraniya's contact information
    const String name = 'Safil Bhoraniya';
    const String email = 'safil.bhoraniya8@gmail.com';
    const String mobile = '+91 6352485375';
    const String linkedinUrl = 'https://www.linkedin.com/in/safilbhoraniya';

    // Link Data (Assuming ContactLink is available)
    final List<Widget> contactLinks = [
      ContactLink(
        icon: Icons.mail_outline,
        label: 'Email Address',
        value: email,
        copyValue: email,
        //launchUrl: 'mailto:$email',
      ),
      ContactLink(
        icon: Icons.phone_android,
        label: 'Mobile / WhatsApp',
        value: mobile,
        copyValue: mobile,
        //launchUrl: 'tel:$mobile',
      ),
      ContactLink(
        icon: Icons.group_outlined,
        label: 'LinkedIn Profile',
        value: 'Safil Bhoraniya',
        copyValue: linkedinUrl,
       // launchUrl: linkedinUrl,
      ),
    ];

    return Column(
      children: [
        // 1. Section Header (Calling SectionTemplate directly inside ContactSection)
        SectionTemplate(
          title: 'CONNECT WITH ${name.toUpperCase()}',
          description: 'I am eager to discuss new opportunities. Whether you are a company looking to hire a dedicated Flutter Developer or a client ready to build a dynamic mobile application, let\'s connect.',
          iconWidget: const Icon(Icons.send_rounded, color: Colors.purpleAccent),
          // isMobile: isMobile, <--- REMOVED THIS LINE
        ),

        // 2. Main Content (The entire content area is now a single large card)
        Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
            padding: EdgeInsets.all(isMobile ? 20 : 40),

            // Main Card Decoration
            decoration: BoxDecoration(
              color: const Color(0xFF141414),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.purpleAccent.withOpacity(0.2), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.purpleAccent.withOpacity(0.15),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),

            child: Column(
              children: [
                // Short introduction/Description Text Card
                Container(
                  constraints: const BoxConstraints(maxWidth: 700),
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(bottom: 40),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueAccent.withOpacity(0.2), width: 1),
                  ),
                  child: Text(
                    'Contact Details for **Safil Bhoraniya**: I am currently available for freelance projects and full-time positions. For recruitment inquiries, technical collaborations, or app development consultations, please use the links below to reach me.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),

                // Contact link layout
                ...contactLinks.map((link) => Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: link,
                )).toList(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}