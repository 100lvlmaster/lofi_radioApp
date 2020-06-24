import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class CounterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Container(
        
        color: Colors.black,
        child:VideoCotainer(), 
      
      );    
  }
}


class VideoCotainer extends StatefulWidget {
  VideoCotainer({Key key}) : super(key: key);

  @override
  _VideoCotainerState createState() => _VideoCotainerState();
}

class _VideoCotainerState extends State<VideoCotainer> {  

 
   YoutubePlayerController _controller =  YoutubePlayerController(
    initialVideoId: '5qap5aO4i9A',
    flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
        hideControls: false,
    ),
);

// this must be a top-level function
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
         child:  Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[
                    SizedBox(height: 10,),
                    SizedBox(height: 10,),
             Stack(
              children:[ 
            Container(
              height: 20,
              width: 20,
              child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: false,
              progressIndicatorColor: Colors.green,
              topActions: <Widget>[
                      const SizedBox(width: 2.0),
                      Expanded(
                        child: Text(
                          _controller.metadata.title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
              ]
           ),
            ),
                            Container(
                              
                              color: Colors.black,
                              child: Image.asset('lib/assets/fire-iris.gif'),
                            ),
              ],),
            Container(
              color: Colors.black,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                 SizedBox(width:10),
               FlatButton(
                onPressed: () => _controller.play(), 
                child: Icon(Icons.play_arrow,
                 color: Colors.white,
                ),
               ),
               FlatButton(
                 onPressed: () => _controller.pause(), 
                  child: Icon(Icons.pause,
                  color: Colors.white,
                  ),
                ),
                 SizedBox(width:10),
               
                ],
              ),
            ),
            SizedBox(height: 1,),
          ]
         )
      ),
    );

  }
}
