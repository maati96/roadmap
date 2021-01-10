import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:roadmap/screens/profile/about.dart';
import 'package:roadmap/screens/profile/contact.dart';
import 'package:roadmap/screens/profile/profile_detail.dart';
import 'package:roadmap/widgets/appbar_search.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBarSearch.appBarBase('الملف الشخصي '),
        body: ListView(
          padding: EdgeInsets.only(bottom: 10.0),
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.account_circle_rounded, size: 56),
                title: Text('الملف الشخصي الخاص بك'),
                subtitle: Text('معلوماتك الشخصيه'),
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
            Card(),
            Card(
              child: ListTile(
                leading: Icon(Icons.more_rounded, size: 56),
                title: Text('تعرف علينا'),
                subtitle: Text('تعرف علي هدف التطبيق والمطورين'),
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
                title: Text('اقتراحاتك والمشاكل التي تواجهك'),
                subtitle:
                    Text('يمكنك ارسال مقتراحاتك او اي افكار جديدة تفيد التطبيق والمجتمع المستفاد منه'),
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
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                  setState(() {
                    storage.delete(key: 'key');
                  });
                },
                child: ListTile(
                  leading: Icon(Icons.exit_to_app, size: 56),
                  title: Text('تسجيل الخروج'),
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
