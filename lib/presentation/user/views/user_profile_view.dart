import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ranuser/core/home/api/model/users_reponse.dart';
import 'package:ranuser/presentation/coreui/box.dart';
import 'package:ranuser/presentation/coreui/colors.dart';
import 'package:ranuser/presentation/coreui/core_constants.dart';
import 'package:ranuser/presentation/coreui/divider.dart';
import 'package:ranuser/presentation/coreui/loading_indicator.dart';
import 'package:ranuser/presentation/coreui/row.dart';
import 'package:ranuser/presentation/coreui/text.dart';

class UserProfile extends StatelessWidget {
  static var tag = "Profile";
  final String photo;
  final String name;
  final String email;
  final Contact? contact;

  const UserProfile(
      {Key? key,
      required this.photo,
      required this.name,
      required this.email,
      this.contact})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileImg = Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      alignment: FractionalOffset.center,
      child: CachedNetworkImage(
        imageUrl: photo,
        imageBuilder: (context, imageProvider) => CircleAvatar(
          radius: 50,
          backgroundImage: imageProvider,
        ),
        placeholder: (context, url) =>
            LoadingIndicator(typeIndicator: CircularProgressType()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
    final profileContent = Container(
      margin: const EdgeInsets.only(top: 55.0),
      decoration:
          boxDecoration(bgColor: Colors.white, radius: 10, showShadow: true),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            text(name,
                textColor: t1_colorPrimary,
                fontSize: textSizeNormal,
                fontFamily: fontMedium),
            text(email,
                textColor: t1_colorPrimary,
                fontSize: textSizeMedium,
                fontFamily: fontMedium),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Divider(color: t1_view_color, height: 0.5),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 90, left: 2, right: 2),
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Stack(
                children: <Widget>[profileContent, profileImg],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              decoration: boxDecoration(
                  bgColor: Colors.white, radius: 10, showShadow: true),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 8),
                    rowHeading("Informations"),
                    const SizedBox(height: 16),
                    profileText(name),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                      child: divider(),
                    ),
                    const SizedBox(height: 8),
                    profileText(contact?.country),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                      child: divider(),
                    ),
                    const SizedBox(height: 8),
                    profileText(contact?.streetAddress, maxline: 2),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              decoration: boxDecoration(
                  bgColor: Colors.white, radius: 10, showShadow: true),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 8),
                    rowHeading("Contact"),
                    const SizedBox(height: 16),
                    profileText(contact?.phoneNumber),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                      child: divider(),
                    ),
                    const SizedBox(height: 8),
                    profileText(contact?.email),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
