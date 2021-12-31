import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import "dart:math";
import './constant.dart';

class Content extends StatefulWidget {
  Content({Key? key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxfSwiaWF0IjoxNjQwNzcyMjc5LCJleHAiOjE2NDA3NzU4Nzl9.MTywLXMdVcjJqYSoz9o0h-kRYla2OPIAVQ7Re1s2s-c';
  String inital = '5-ciHIwzBCo';
  String PartName = '';
  String UnivName = '';
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId:  '',
    params: YoutubePlayerParams(
        playlist: ['waQRM7N-Wvg', 'OmJ-4B-mS-Y'], // Defining custom playlist
        startAt: Duration(seconds: 30),
        showControls: true,
        showFullscreenButton: true,
    ),
  );
 
  @override
  void initState(){
    super.initState();
    final _random = new Random();
    var element = VID_WORKS[_random.nextInt(VID_WORKS.length)];
    var randomTitle = TITLE[_random.nextInt(TITLE.length)];
    var randomUniv = UNIV [_random.nextInt(UNIV.length)];

    setState(() {
      _controller = YoutubePlayerController(
        initialVideoId:  element,
        params: YoutubePlayerParams(
            playlist: ['waQRM7N-Wvg', 'OmJ-4B-mS-Y'], // Defining custom playlist
            startAt: Duration(seconds: 30),
            showControls: true,
            showFullscreenButton: true,
        ),
      );
      
      PartName = randomTitle;
      UnivName = randomUniv;
    }); 
  }

  void Randomize(){
    final _random = new Random();
    var element = VID_WORKS[_random.nextInt(VID_WORKS.length)];
    var randomTitle = TITLE[_random.nextInt(TITLE.length)];
    setState(() {
      PartName = randomTitle;
      _controller = YoutubePlayerController(
        initialVideoId:  element,
        params: YoutubePlayerParams(
            playlist: ['waQRM7N-Wvg', 'OmJ-4B-mS-Y'], // Defining custom playlist
            startAt: Duration(seconds: 30),
            showControls: true,
            showFullscreenButton: true,
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child : ListView(
          children: [
              YoutubePlayerControllerProvider( // Provides controller to all the widget below it.
                controller: _controller,
                child: YoutubePlayerIFrame(
                  aspectRatio: 16 / 9,
                ),
              ),
              SizedBox(height :30),
              Container(
                margin :  const EdgeInsets.symmetric(horizontal : 35),
                child : Row(
                  children: [
                    Text(PartName, 
                    style : TextStyle(fontSize: 25))
                  ]
                )
              ),
              SizedBox(height : 8),
              Container(
                child : Text(UnivName),
                margin :  const EdgeInsets.symmetric(horizontal : 35),
              ),
              SizedBox(height : 18),
              Container(
                child : InkWell(
                  child : Row(
                    children: [
                      Expanded(
                        flex : 7,
                        child : Container(
                          child : Text('01'),
                          margin : const EdgeInsets.symmetric(horizontal : 10),
                        ),
                        
                      ),
                      Expanded(
                        flex : 3,
                        child : Text('Part 01'),
                      ),
                    ]
                  )
                ),
                decoration: new BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5)
                ),
                margin: const EdgeInsets.symmetric(horizontal : 35, vertical : 10),
                height : 50
                
              ),

               Container(
                child : InkWell(
                  onTap: () {
                    Randomize();
                  },
                  child : Row(
                    children: [
                      Expanded(
                        flex : 7,
                        child : Container(
                          child : Text('02'),
                          margin : const EdgeInsets.symmetric(horizontal : 10),
                        ),
                        
                      ),
                      Expanded(
                        flex : 3,
                        child : Text('Part 02'),
                      ),
                    ]
                  )
                ),
                decoration: new BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5)
                ),
                margin: const EdgeInsets.symmetric(horizontal : 35, vertical : 10),
                height : 50
                
              ),


               Container(
                child : InkWell(
                  onTap: () {
                    Randomize();
                  },
                  child : Row(
                    children: [
                      Expanded(
                        flex : 7,
                        child : Container(
                          child : Text('03'),
                          margin : const EdgeInsets.symmetric(horizontal : 10),
                        ),
                        
                      ),
                      Expanded(
                        flex : 3,
                        child : Text('Part 03'),
                      ),
                    ]
                  )
                ),
                decoration: new BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5)
                ),
                margin: const EdgeInsets.symmetric(horizontal : 35, vertical : 10),
                height : 50
                
              ),

              Container(
                child : InkWell(
                  onTap: () {
                    Randomize();
                  },
                  child : Row(
                    children: [
                      Expanded(
                        flex : 7,
                        child : Container(
                          child : Text('04'),
                          margin : const EdgeInsets.symmetric(horizontal : 10),
                        ),
                        
                      ),
                      Expanded(
                        flex : 3,
                        child : Text('Part 04'),
                      ),
                    ]
                  )
                ),
                decoration: new BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5)
                ),
                margin: const EdgeInsets.symmetric(horizontal : 35, vertical : 10),
                height : 50
                
              ),

              Container(
                child : InkWell(
                  onTap: () {
                    Randomize();
                  },
                  child : Row(
                    children: [
                      Expanded(
                        flex : 7,
                        child : Container(
                          child : Text('05'),
                          margin : const EdgeInsets.symmetric(horizontal : 10),
                        ),
                        
                      ),
                      Expanded(
                        flex : 3,
                        child : Text('Part 05'),
                      ),
                    ]
                  )
                ),
                decoration: new BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5)
                ),
                margin: const EdgeInsets.symmetric(horizontal : 35, vertical : 10),
                height : 50
                
              ),
              
              Padding(
                padding : const EdgeInsets.symmetric(horizontal : 150),
                child : ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                    '/course/overview',
                    arguments: '0',
                  );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(50, 40),
                      primary : Colors.black87 // put the width and height you want
                    ), 
                      child: Container(
                      child :  Text('Quiz')
                    ),
                  ),
              ),
              SizedBox(height :30)
            ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index){
         
         if(index == 0){
            Navigator.of(context).pushNamed(
              '/',
              arguments: 'Hello there from the first page!',
            );
          }else if(index == 1){
            Navigator.of(context).pushNamed(
              '/course',
              arguments: 'Hello there from the first page!',
            );
          }else if(index == 2){
            Navigator.of(context).pushNamed(
              '/profile',
              arguments: 'Hello there from the first page!',
            );
          }

        },
      ),
    );
  }
}




class ChewieListItem extends StatefulWidget {
  // This will contain the URL/asset path which we want to play

  ChewieListItem({
    Key? key,
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  var _chewieController;
  var videoPlayerController =  VideoPlayerController.network('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
  var looping = true;
  @override
  void initState() {
    super.initState();
    // Wrapper on top of the videoPlayerController
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      // Prepare the video to be played and display the first frame
      autoInitialize: true,
      looping: looping,
      // Errors can occur for example when trying to play a video
      // from a non-existent URL
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // IMPORTANT to dispose of all the used resources
    videoPlayerController.dispose();
    _chewieController.dispose();
  }
}