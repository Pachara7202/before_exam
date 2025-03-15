import 'package:flutter/material.dart';

class Answer1 extends StatelessWidget {
  const Answer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
        backgroundColor: const Color.fromARGB(255, 97, 82, 63),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 213, 157, 72),
            width: double.infinity,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://i.ytimg.com/vi/0C8KP8oyi4E/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLC9y66GXG_rtN8WJ1YUFr3I_Zfg8g'),
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(height: 10),
                const Text("pacharuu.e",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileItem(icon: Icons.person, text: "พชร เอกวิชญพงศ์"),
                ProfileItem(icon: Icons.email, text: "pachara7202@gmail.com"),
                ProfileItem(icon: Icons.phone, text: "084-922-7202"),
                ProfileItem(
                    icon: Icons.location_on, text: "Nakhon Pathom, 26/4"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;

  ProfileItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
