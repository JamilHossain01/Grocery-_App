import 'package:flutter/material.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:grocery/widgets/utils.dart';
import 'package:iconly/iconly.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({super.key});

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    Color color = Utils(context).color;
    return Scaffold(
      appBar: AppBar(
          title: Text('Contact'), leading: Icon(IconlyLight.arrow_left_2)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(IconlyLight.bookmark),
                  TextWidget(text: 'Contacts', color: color, textSize: 22),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: OneClick(
                      color: color,
                      title: 'First Name',
                      subTitle: 'Enter Name',
                    ),
                  ),
                  Expanded(
                    child: OneClick(
                      color: color,
                      title: 'Last Name',
                      subTitle: 'Enter Name',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  OneClick(
                      color: color,
                      title: 'Company NAme',
                      subTitle: 'Enter Company'),
                  OneClick(
                      color: color, title: 'Job Name', subTitle: 'Enter Job')
                ],
              ),
              Row(
                children: [
                  OneClick(
                      color: color,
                      title: 'Phone Number',
                      subTitle: 'Enter phone'),
                  OneClick(
                      color: color, title: 'Email', subTitle: 'Enter Email')
                ],
              ),
              OneClick(
                  color: color,
                  title: 'Website:',
                  subTitle: 'Enter Enter Web Adress'),
              OneClick(color: color, title: 'Adress', subTitle: 'Enter Adress'),
              Row(
                children: [
                  OneClick(
                      color: color, title: 'City:', subTitle: 'Enter Country'),
                  OneClick(
                      color: color, title: 'Country', subTitle: 'Enter Country')
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                  child: TextWidget(text: 'Create', color: color, textSize: 25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OneClick extends StatelessWidget {
  const OneClick({
    super.key,
    required this.color,
    required this.title,
    required this.subTitle,
  });

  final Color color;
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        title: TextWidget(text: title, color: color, textSize: 22),
        subtitle: TextFormField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.black)),
            hintText: subTitle,
            border: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
    );
  }
}

class TextOnly extends StatelessWidget {
  const TextOnly({
    super.key,
    required this.color,
    required this.title,
  });

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: title,
      color: color,
      textSize: 22,
      isTitle: true,
    );
  }
}
