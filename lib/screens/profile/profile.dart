import 'package:flutter/material.dart';
import 'package:roadmap/screens/profile/about.dart';
import 'package:roadmap/screens/profile/contact.dart';
import 'package:roadmap/screens/profile/profile_detail.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Roadmap User Profile"),
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 10.0),
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.account_circle_rounded, size: 56),
              title: Text('Acount Details'),
              subtitle: Text('Profile Acount Details'),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
            ),
          ),
          Card(
           
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.more_rounded, size: 56),
              title: Text('About us'),
              subtitle: Text('About Developers'),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => About(),
                    ),
                  );
                },
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.feedback_rounded, size: 56),
              title: Text('Suggestions'),
              subtitle:
                  Text('You can send your suggestions, and your new features'),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Contact(),
                    ),
                  );
                },
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.exit_to_app, size: 56),
              title: Text('Logout'),
              subtitle: Text('You can logout if you need'),
              
            ),
          ),
        ],
      ),
    );
  }
}
