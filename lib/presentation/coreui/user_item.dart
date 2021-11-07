import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String id;
  final String name;
  final String photo;
  final String phoneNumer;

  // ignore: use_key_in_widget_constructors
  const UserItem(this.id, this.name, this.photo, this.phoneNumer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(name),
          subtitle: Text(phoneNumer),
          leading: const CircleAvatar(
              backgroundImage:
                  NetworkImage("https://lorempixel.com/640/480/cats")),
          trailing: const Icon(Icons.contact_page_outlined)),
    );
  }
}
