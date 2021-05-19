import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:oreocrypt/components/storyring.dart';
import 'package:oreocrypt/models/story_model.dart';
import 'package:oreocrypt/models/user_model.dart';

class StoriesListTile extends StatefulWidget {
  final User userData;

  const StoriesListTile({Key key, this.userData}) : super(key: key);

  @override
  _StoriesListTileState createState() => _StoriesListTileState();
}

class _StoriesListTileState extends State<StoriesListTile> {
  @override
  Widget build(BuildContext context) {
    // User username = widget.data.user;
    return Card(
      color: Colors.white,
      shadowColor: Colors.grey.withOpacity(.8),
      elevation: 10,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StoryRing(
                  radius: 28,
                  ringColor: Colors.deepPurpleAccent[200],
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userData.name,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                  ],
                ),
              ],
            ),
            Wrap(
              spacing: 5.0,
              children: [
                Icon(
                  CryptoFontIcons.BTC,
                  color: Colors.orange,
                ),
                Icon(
                  CryptoFontIcons.XRP,
                  color: Colors.blueGrey,
                ),
                Icon(
                  CryptoFontIcons.ETH,
                  color: Colors.deepPurpleAccent[700],
                ),
                // Icon(CryptoFontIcons.ADC),
              ],
            )
          ],
        ),
      ),
    );
  }
}
