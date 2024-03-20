import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
// Assuming IconlyLight is defined in a separate file

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController = TextEditingController();

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Hi, ',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'My Name',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('jamil');
                        },
                    ),
                  ],
                ),
              ),
              TextWidget(
                text: 'jamil21@gmail.com',
                color: color,
                textSize: 15,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(height: 25),
              _listTile(
                title: "Address",
                subtitle: 'My Address 2',
                icon: IconlyLight.profile,
                color: color,
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Update Address'),
                        content: TextField(
                          onChanged: (value) {},
                          controller: _addressTextController,
                          decoration: InputDecoration(hintText: 'Your address'),
                        ),
                        actions: [
                          TextButton(onPressed: () {}, child: Text('Update'))
                        ],
                      );
                    },
                  );
                },
              ),
              _listTile(
                title: "Orders",
                icon: IconlyLight.bag,
                color: color,
                onPressed: () async {},
              ),
              _listTile(
                title: "Wishlist",
                icon: IconlyLight.heart,
                color: color,
                onPressed: () {},
              ),
              _listTile(
                title: 'Viewed',
                icon: IconlyLight.show,
                color: color,
                onPressed: () {},
              ),
              _listTile(
                title: 'Forget password',
                icon: IconlyLight.unlock,
                color: color,
                onPressed: () {},
              ),
              SwitchListTile(
                title: TextWidget(
                  text: themeState.getDarkTheme ? "Dark Mode" : "Light Mode",
                  color: color,
                  textSize: 22,
                ),
                secondary: Icon(
                  themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                ),
                onChanged: (bool value) {
                  themeState.setDarkTheme = value;
                },
                value: themeState.getDarkTheme,
              ),
              _listTile(
                title: 'Logout',
                icon: IconlyLight.logout,
                color: color,
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              Image.asset(
                                'assets/images/warning-sign.png',
                                width: 20,
                                height: 30,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text('Sign Out')
                            ],
                          ),
                          content: TextField(
                            controller: _addressTextController,
                            decoration: InputDecoration(
                              hintText: 'Do you wanna sign out',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                              },
                              child: Text(
                                'cancel',
                                style: TextStyle(color: Colors.cyan),
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'ok',
                                  style: TextStyle(color: Colors.red),
                                ))
                          ],
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _listTile({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
      ),
      subtitle: TextWidget(
        text: subtitle ?? '',
        color: color,
        textSize: 18,
      ),
      leading: Icon(
        icon,
        size: 30,
      ),
      trailing: Icon(
        IconlyLight.arrow_right_2,
        size: 28,
      ),
      onTap: () {
        onPressed();
      },
    );
  }
}
