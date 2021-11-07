import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ranuser/presentation/coreui/loading_indicator.dart';

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
          leading: CachedNetworkImage(
        imageUrl: photo,
        imageBuilder: (context, imageProvider) => CircleAvatar(
          radius: 20,
          backgroundImage: imageProvider,
        ),
        placeholder: (context, url) =>
            LoadingIndicator(typeIndicator: CircularProgressType()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
          trailing: const Icon(Icons.contact_page_outlined)),
    );
  }
}
