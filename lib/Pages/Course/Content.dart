import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Content extends StatefulWidget {
  Content({Key? key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
 
  @override
  void initState(){
    super.initState();  
  }

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'waQRM7N-Wvg',
    params: YoutubePlayerParams(
        playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
        startAt: Duration(seconds: 30),
        showControls: true,
        showFullscreenButton: true,
    ),
  );


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
              Container(
                margin :  const EdgeInsets.symmetric(horizontal : 35),
                child : Row(
                  children: [
                    Text('Video id')
                  ]
                )
              ),

              Container(
                child : Text('Video List'),
                margin :  const EdgeInsets.symmetric(horizontal : 35),
              )

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