// import 'package:flutter/material.dart';

// class AccountView extends StatelessWidget {
//   const AccountView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple, // Set theme color
//         title: const Text(
//           'Profile',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: IconButton(
//               icon: Icon(Icons.logout, color: Colors.white),
//               onPressed: () {
//                 // Handle logout action
//               },
//             ),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             profileHeader(),
//             taskProgressCard(),
//             settingsList(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget profileHeader() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.deepPurple, // Theme color
//         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
//       ),
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: AssetImage('assets/profile.jpg'), // Replace with user's image
//               ),
//               Positioned(
//                 bottom: 5,
//                 right: 5,
//                 child: CircleAvatar(
//                   radius: 15,
//                   backgroundColor: Colors.white,
//                   child: Icon(Icons.camera_alt, color: Colors.deepPurple, size: 18),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Text(
//             "Santosh KC",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           Text(
//             "kcsantosh2003@gmail.com",
//             style: TextStyle(fontSize: 14, color: Colors.white70),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget taskProgressCard() {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("0 tasks completed", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//                 GestureDetector(
//                   onTap: () {
//                     // Handle View Details action
//                   },
//                   child: Text("View Details >", style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.bold)),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             LinearProgressIndicator(
//               value: 0.0, // Set progress dynamically
//               backgroundColor: Colors.grey[300],
//               color: Colors.deepPurple,
//             ),
//             const SizedBox(height: 8),
//             Text("BRONZE VOYAGER", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.deepPurple)),
//             Text("18 Tasks remaining", style: TextStyle(fontSize: 12, color: Colors.grey[700])),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget settingsList() {
//     return Column(
//       children: [
//         settingsItem(Icons.settings, "Account Settings"),
//         settingsItem(Icons.local_offer, "Deals & Offers"),
//         settingsItem(Icons.info, "About Us"),
//         settingsItem(Icons.question_answer, "Frequently Asked Questions"),
//         settingsItem(Icons.policy, "Terms & Conditions"),
//       ],
//     );
//   }

//   Widget settingsItem(IconData icon, String title) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       elevation: 1,
//       child: ListTile(
//         leading: Icon(icon, color: Colors.deepPurple),
//         title: Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
//         trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
//         onTap: () {
//           // Handle navigation to the respective page
//         },
//       ),
//     );
//   }
// }
