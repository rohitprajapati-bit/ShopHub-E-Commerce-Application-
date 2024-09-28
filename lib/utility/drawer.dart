// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class MyDrawer extends StatelessWidget {
//   const MyDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.limeAccent[50],
//         ),
//         child: ListView(
//           children: [
//             DrawerHeader(
//               padding: EdgeInsets.zero,
//               child: UserAccountsDrawerHeader(
//                   margin: EdgeInsets.zero,
//                   // decoration: BoxDecoration(color: Colors.limeAccent[50]),
//                   accountName: Text(
//                     "Rohit Prajapati",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   accountEmail: Text("rohitprajapati@gmail.com",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       )),
//                   currentAccountPicture: CircleAvatar(
//                     backgroundImage:
//                         ExactAssetImage("assets/images/rohitt.jpeg"),
//                   )),
//             ),
//             ListTile(
//               leading: Icon(
//                 CupertinoIcons.home,
//                 color: Colors.black,
//               ),
//               title: Text(
//                 "Home",
//                 textScaleFactor: 1.2,
//                 style:
//                     TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//               ),
//             ),
//             ListTile(
//               leading: Icon(
//                 CupertinoIcons.profile_circled,
//                 color: Colors.black,
//               ),
//               title: Text(
//                 "Profile",
//                 textScaleFactor: 1.2,
//                 style:
//                     TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//               ),
//             ),
//             ListTile(
//               leading: Icon(
//                 CupertinoIcons.mail_solid,
//                 color: Colors.black,
//               ),
//               title: Text(
//                 "Mail",
//                 textScaleFactor: 1.2,
//                 style:
//                     TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
