import 'package:flutter/material.dart';
import 'package:music_app/playhome1.dart';
import 'package:music_app/playhome2.dart';
import 'package:music_app/playhome3.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Musichomescreen extends StatefulWidget {
  const Musichomescreen({super.key});

  @override
  State<Musichomescreen> createState() => _MusichomescreenState();
}

class _MusichomescreenState extends State<Musichomescreen> {
  String? username;

  final Uri _url = Uri.parse('https://open.spotify.com/premium');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Welcome To Tunify, ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "JOIN THE VIBE!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Offline mode on! Your music anywhere.",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () async {
                          if (!await launchUrl(_url)) {
                            throw Exception('Could not launch $_url');
                          }
                        },
                        child: Text("Subscribe Now!"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/mainpage.png",
                    width: 100,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "Top Picks for You",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              separatorBuilder: (context, index) => SizedBox(width: 12),
              itemBuilder: (context, index) {
                final imageList = [
                  "assets/1.png",
                  "assets/2.png",
                  "assets/3.png",
                  "assets/4.png",
                  "assets/5.png",
                  "assets/6.png",
                  "assets/19.png",
                  "assets/7.png",
                  "assets/8.png",
                  "assets/9.png",
                  "assets/10.png",
                  "assets/11.png",
                  "assets/12.png",
                  "assets/13.png",
                  "assets/14.png",
                ];

                final names = [
                  "Monsoon Hits",
                  "Far Alone",
                  "Summer Of Love",
                  "Kaise Hua",
                  "Good Riddance",
                  "Future Nostalgia",
                  "Scares To Your Ben",
                  "Melt",
                  "Shadow Of Mine",
                  "Blinding Lights",
                  "These Two Wind",
                  "Before You Go",
                  "Kahani Suno 2.0",
                  "Pretty Girl",
                  "Good Without",
                ];

                final smallNames = [
                  "It's raining hits!",
                  "Single",
                  "Shawn Mendes,Tainy",
                  "Vishal Mishra",
                  "Graccie Abrams",
                  "Dua Lipa",
                  "Alessia Cara",
                  "Shaed,Zayn",
                  "Alec Benjamin",
                  "The Weeknd",
                  "Lewis Capaldi",
                  "Kaifi Khalil",
                  "Maggie Lindemann",
                  "Mimi Webb",
                  "Alex",
                ];

                return Container(
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              imageList[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        names[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        smallNames[index],
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Album",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 70,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/21.png"),
                  ),
                  title: Text(
                    "Couple Of Kids",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text(
                    "Maggie Lindemann",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Playhomecreen1(),
                        ),
                      );
                    },
                    icon: Icon(Icons.play_circle),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 70,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/18.png"),
                  ),
                  title: Text(
                    "Than Ever",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text(
                    "Billie Elliesh",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Playhomecreen2(),
                        ),
                      );
                    },
                    icon: Icon(Icons.play_circle),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 70, // You can adjust based on content
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/20.png"),
                  ),
                  title: Text(
                    "Help Ever Hurt Net",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text(
                    "Fujii Kaze",
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Playhomecreen3(),
                        ),
                      );
                    },
                    icon: Icon(Icons.play_circle),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
