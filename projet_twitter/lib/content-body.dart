import 'package:flutter/material.dart';
import 'package:tp05_correction/footer.dart';
import 'package:tp05_correction/header.dart';
import 'package:tp05_correction/tweet.dart';

class TweetButton extends StatelessWidget{

  String label;

  TweetButton(this.label);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(this.label, textAlign: TextAlign.center));
  }
}

class ListViewBody extends StatelessWidget {

  final List<Tweet> tweets = [
  Tweet(
  titre: "Article 1",
  contenu: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  image: "assets/images/dog1.jpg",
  ),
  Tweet(
    titre: "Article 2",
    contenu: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    image: "assets/images/dog2.jpg",
  ),
  Tweet(
    titre: "Article 3",
    contenu: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    image: "assets/images/dog3.jpg",
  )];

  ListViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Twitter"),
      ),
      body: Column(
        children: [
          Header(),
          //Column attend des éléments avec des tailles
          Expanded(
            child: ListView.builder(
              itemCount: tweets.length,
              itemBuilder: (BuildContext buildContext, int index){
                return TweetView(tweet: tweets[index],);
              },
            ),
          ),
          Footer(),
        ]
      ),
    );
  }
}

class TweetView extends StatelessWidget {

  final Tweet tweet;

  const TweetView({super.key, required this.tweet});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image + Texte
        Container(
          height: 150,
          child: Row(
            children: [
              SizedBox(
                width: 150,
                child: Image.network(
                  tweet.image,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            tweet.titre,
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            '50s',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                            tweet.contenu),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.reply),
                  iconSize: 30,
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.repeat),
                  iconSize: 30,
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.star),
                  iconSize: 30,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}


