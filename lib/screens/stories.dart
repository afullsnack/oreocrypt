import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oreocrypt/components/storyring.dart';
import 'package:oreocrypt/components/storytile.dart';
import 'package:oreocrypt/global.dart';
import 'package:oreocrypt/models/story_model.dart';
import 'package:oreocrypt/models/user_model.dart';

class StoriesScreen extends StatelessWidget {
  List<String> _getShowStory() {
    // List<Story> showStories;

    // for (var story in stories) {
    //   var currentName = story.user.name;

    //   for (var i = 0; i < stories.length; i++) {
    //     if (currentName == stories[i].user.name) {
    //       showStories.add(stories[i]);
    //     }
    //   }
    // }

    var compList = <String>[];
    for (var item in stories) {
      compList.add(item.user.name);
    }

    return [...new Set.from(compList)];

    print([...new Set.from(compList)]);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final usersWithStories = _getShowStory();

    return CustomScrollView(slivers: [
      SliverAppBar(
        backgroundColor: Colors.black,
        expandedHeight: 200,
        collapsedHeight: 130,
        pinned: false,
        floating: true,
        flexibleSpace: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              widthFactor: double.infinity,
              heightFactor: double.infinity,
              child: Container(
                width: double.infinity,
                height: size.height * .26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                  ),
                  color: bgColor.withAlpha(255),
                ),
              ),
            ),
            Positioned(
              top: size.height * .055,
              left: 35,
              right: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StoryRing(
                    radius: 55,
                    ringColors: [Colors.white, Colors.grey[400]!],
                  ),
                  Icon(
                    CupertinoIcons.bell,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * .14,
              left: 35,
              right: 35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Benjamin',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .75,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'How are you today?',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      letterSpacing: .5,
                      fontSize: 22,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 35.0, top: 10.0, bottom: 10.0),
          child: Text(
            'Recent Activity',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 23,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            List<Story> story = [];
            User currentStoryUser = stories[index].user;

            for (var i = 0; i < stories.length; i++) {
              // check if multiple stories have one user
              // if (usersWithStories[i] == stories[i].user.name) {
              story.add(stories[i]);
              //   continue;
              // }
            }
            return GestureDetector(
              onTap: () {
                print('Full story screen entered');
                Navigator.of(context).pushNamed('full_story', arguments: story);
              },
              child: StoriesListTile(userName: usersWithStories[index]),
            );
          },
          childCount: usersWithStories.length,
        ),
      ),
    ]);
  }
}
