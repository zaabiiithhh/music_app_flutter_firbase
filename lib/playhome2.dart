import 'package:flutter/material.dart';

class Playhomecreen2 extends StatelessWidget {
  const Playhomecreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Dark gradient-style background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Playing Now",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/18.png', // use your album art here
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Than Ever',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 8),
            Text('Billie Elliesh', style: TextStyle(color: Colors.black)),
            SizedBox(height: 30),
            Slider(
              value: 166, // 2:46 in seconds
              min: 0,
              max: 243, // 4:03 in seconds
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              onChanged: (value) {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("02:46", style: TextStyle(color: Colors.grey)),
                  Text("04:03", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.shuffle, color: Colors.black, size: 28),
                Icon(Icons.skip_previous, color: Colors.black, size: 32),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Icon(Icons.pause, color: Colors.white, size: 28),
                ),
                Icon(Icons.skip_next, color: Colors.black, size: 32),
                Icon(Icons.repeat, color: Colors.black, size: 28),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
