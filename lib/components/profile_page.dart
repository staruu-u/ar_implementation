import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../screens/sign_in.dart';
import '../services/auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late FirebaseDatabase mDatabase;
  late DatabaseReference mDb;
  late User user;
  late String userKey;
  String email = '';
  String fullName = '';
  String bio = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    mDatabase = FirebaseDatabase.instance;
    mDb = mDatabase.ref();
    user = firebaseAuth.currentUser!;

    mDb.child("users").onValue.listen((event) {
      var dataSnapshot = event.snapshot;
      var users = dataSnapshot.value as Map<dynamic, dynamic>;

      users.forEach((key, value) {
        var userData = value as Map<dynamic, dynamic>;
        if (userData['email'] == user.email) {
          userKey = key;
          final emailValue = userData['email'];
          final fullNameValue = userData['Full Name'];
          final bioValue = userData['Bio'];

          setState(() {
            email = emailValue != null ? emailValue.toString() : '';
            fullName = fullNameValue != null ? fullNameValue.toString() : '';
            bio = bioValue != null ? bioValue.toString() : '';
          });
        }
      });
    });
  }

  void startEditing() {
    setState(() {
      isEditing = true;
      emailController.text = email;
      fullNameController.text = fullName;
      bioController.text = bio;
    });
  }

  void saveChanges() {
    setState(() {
      isEditing = false;
      email = emailController.text;
      fullName = fullNameController.text;
      bio = bioController.text;

      mDb.child('users/$userKey').update({
        'email': email,
        'Full Name': fullName,
        'Bio': bio,
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    fullNameController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double expandedHeight = MediaQuery.of(context).size.height * 0.9;
    // ignore: unused_local_variable
    final double collapsedHeight = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF142464),
        title: const Text('My Profile'),
      ),
      body: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/237/200/300',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: expandedHeight,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const SizedBox(height: 20),
                  isEditing
                      ? TextFormField(
                          controller: fullNameController,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Roboto',
                          ),
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            labelStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.lightBlue,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.lightBlue,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Text(
                              fullName,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Roboto',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                  const SizedBox(height: 5),
                  isEditing
                      ? TextFormField(
                          controller: emailController,
                          style: const TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                            fontFamily: 'Roboto',
                          ),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.lightBlue,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.lightBlue,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Text(
                              email,
                              style: const TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontFamily: 'Roboto',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                  const SizedBox(height: 10),
                  Text(
                    '2 year user',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  isEditing
                      ? TextFormField(
                          controller: bioController,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Roboto',
                          ),
                          decoration: InputDecoration(
                            labelText: 'Bio',
                            labelStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Roboto',
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.lightBlue,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.lightBlue,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Text(
                              bio,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'Roboto',
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSquareContainer(
                        icon: Icons.attach_money,
                        text: '15 coins',
                      ),
                      const SizedBox(width: 20),
                      _buildSquareContainer(
                        icon: Icons.palette,
                        text: '1/159 murals',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.brush,
                            size: 40,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Discover',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.calendar_today,
                            size: 40,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Events',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: Colors.black,
                          ),
                          onPressed: isEditing ? saveChanges : startEditing,
                          child: Text(
                            isEditing ? 'Done' : 'Edit',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                        const SizedBox(width: 50),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            FireAuth().signOut();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInPage()));
                          },
                          child: const Text(
                            'Log Out',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSquareContainer({required IconData icon, required String text}) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ChangeAvatarDialog extends StatefulWidget {
  final String initialProfileImage;
  final Function(String) onProfileImageChanged;

  const ChangeAvatarDialog({
    Key? key,
    required this.initialProfileImage,
    required this.onProfileImageChanged,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChangeAvatarDialogState createState() => _ChangeAvatarDialogState();
}

class _ChangeAvatarDialogState extends State<ChangeAvatarDialog> {
  String selectedProfileImage = '';

  @override
  void initState() {
    super.initState();
    selectedProfileImage = widget.initialProfileImage;
  }

  void _applyChanges() {
    widget.onProfileImageChanged(selectedProfileImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedProfileImage = 'images/profile1.jpg';
                    });
                  },
                  child: Image.asset(
                    'images/profile1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedProfileImage = 'images/profile2.jpg';
                    });
                  },
                  child: Image.asset(
                    'images/profile2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedProfileImage = 'images/profile3.jpg';
                    });
                  },
                  child: Image.asset(
                    'images/profile3.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedProfileImage = 'images/profile4.jpg';
                    });
                  },
                  child: Image.asset(
                    'images/profile4.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(selectedProfileImage),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _applyChanges,
              child: const Text('Select'),
            ),
          ],
        ),
      ),
    );
  }
}
