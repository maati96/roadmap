import 'package:flutter/material.dart';
import 'package:roadmap/screens/profile/about.dart';
import 'package:roadmap/screens/profile/profile_Details/profile_detail.dart';
import 'package:roadmap/utilities/AppTheme.dart';
import 'package:roadmap/utilities/Shared.dart';

import 'contact/contact.dart';


class UserProfile extends StatefulWidget {
  UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppTheme.backGroundColor,
        appBar: AppBar(
          backgroundColor: AppTheme.appBarColor,
          title: Text(
            "الملف الشخصي",
            style: TextStyle(
              color: AppTheme.cardColor,
              fontFamily: AppTheme.boldFont,
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.only(bottom: 10.0),
          children: [
            Card(
              color: AppTheme.appBarColor,
              child: ListTile(
                leading: Icon(
                  Icons.account_circle_rounded,
                  size: 56,
                  color: AppTheme.cardColor,
                ),
                title: Text(
                  'الملف الشخصي الخاص بك',
                  style: TextStyle(
                    color: AppTheme.cardColor,
                    fontFamily: AppTheme.fontName,
                  ),
                ),
                subtitle: Text(
                  'معلوماتك الشخصيه',
                  style: TextStyle(
                    color: AppTheme.cardColor,
                    fontFamily: AppTheme.fontName,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: AppTheme.cardColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserProfileScreen()),
                    );
                  },
                ),
              ),
            ),
            Card(
              color: AppTheme.appBarColor,
              child: ListTile(
                leading: Icon(
                  Icons.more_rounded,
                  size: 56,
                  color: AppTheme.cardColor,
                ),
                title: Text(
                  'تعرف علينا',
                  style: TextStyle(
                    color: AppTheme.cardColor,
                    fontFamily: AppTheme.fontName,
                  ),
                ),
                subtitle: Text(
                  'تعرف علي هدف التطبيق والمطورين',
                  style: TextStyle(
                    color: AppTheme.cardColor,
                    fontFamily: AppTheme.fontName,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: AppTheme.cardColor,
                  ),
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
              color: AppTheme.appBarColor,
              child: ListTile(
                leading: Icon(
                  Icons.feedback_rounded,
                  size: 56,
                  color: AppTheme.cardColor,
                ),
                title: Text(
                  'تواصل معنا ',
                  style: TextStyle(
                    color: AppTheme.cardColor,
                    fontFamily: AppTheme.fontName,
                  ),
                ),
                subtitle: Text(
                  'مقترحاتك وافكار جديدة',
                  style: TextStyle(
                    color: AppTheme.cardColor,
                    fontFamily: AppTheme.fontName,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: AppTheme.cardColor,
                  ),
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
              color: AppTheme.appBarColor,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                  setState(() {
                    Prefs.remove('token');
                  });
                },
                child: ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    size: 56,
                    color: AppTheme.cardColor,
                  ),
                  title: Text(
                    'تسجيل الخروج',
                    style: TextStyle(
                      color: AppTheme.cardColor,
                      fontFamily: AppTheme.fontName,
                    ),
                  ),
                  subtitle: Text(''),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
