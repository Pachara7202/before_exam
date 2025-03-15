import 'package:flutter/material.dart';

class Answer1 extends StatelessWidget {
  const Answer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("โปรไฟล์ผู้ใช้"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 75, 68, 68),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png'),
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(height: 10),
                const Text("ชื่อผู้ใช้: John Doe",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const Text(
                  "อีเมล: johndoe@example.com",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileItem(icon: Icons.settings, text: "การตั้งค่า"),
                ProfileItem(icon: Icons.key, text: "เปลี่ยนรหัสผ่าน"),
                ProfileItem(
                    icon: Icons.question_mark_sharp, text: "ความเป็นส่วนตัว"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: const Text("แก้ไขโปรไฟล์")),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("ออกจากระบบ")),
                ],
              ))
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
