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
  String selectedProfileImage = '';

  void changeProfileImage(String newProfileImage) {
    setState(() {
      selectedProfileImage = newProfileImage;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedProfileImage =
        'images/gray_circle.png'; // Default gray circle image
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
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => ChangeAvatarDialog(
                    initialProfileImage: selectedProfileImage,
                    onProfileImageChanged: changeProfileImage,
                  ),
                );
              },
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
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(selectedProfileImage),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'John Doe',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    const Opacity(
                      opacity: 0.7,
                      child: Text(
                        'john.doe@example.com',
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '2 year user',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'A software engineer with a passion for mobile app development.',
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSquareContainer(
                          icon: Icons.attach_money,
                          text: '350 coins',
                        ),
                        const SizedBox(width: 20),
                        _buildSquareContainer(
                          icon: Icons.palette,
                          text: '72/159 murals',
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
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: Center(
                          child: ElevatedButton(
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
                      )),
                    ),
                  ],
                ),
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
