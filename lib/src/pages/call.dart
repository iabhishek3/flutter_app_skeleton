import 'dart:async';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/settings.dart';

class CallPage extends StatefulWidget {
  /// non-modifiable channel name of the page
  final String channelName;

  /// Creates a call page with given channel name.
  const CallPage({Key key, this.channelName}) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  static final _users = <int>[];
  final _infoStrings = <String>[];
  List<int> screens = [0,1];
  bool muted = false;
  bool multiscreens = false;

  @override
  void dispose() {
    // clear users
    _users.clear();
    // destroy sdk
    AgoraRtcEngine.leaveChannel();
    AgoraRtcEngine.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // initialize agora sdk
    initialize();
  }

  Future<void> initialize() async {
    if (APP_ID.isEmpty) {
      setState(() {
        _infoStrings.add(
          'APP_ID missing, please provide your APP_ID in settings.dart',
        );
        _infoStrings.add('Agora Engine is not starting');
      });
      return;
    }

    await _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    await AgoraRtcEngine.enableWebSdkInteroperability(true);
    await AgoraRtcEngine.setParameters(
        '''{\"che.video.lowBitRateStreamParameter\":{\"width\":320,\"height\":180,\"frameRate\":15,\"bitRate\":140}}''');
    await AgoraRtcEngine.joinChannel(null, widget.channelName, null, 0);
  }

  /// Create agora sdk instance and initialize
  Future<void> _initAgoraRtcEngine() async {
    await AgoraRtcEngine.create(APP_ID);
    await AgoraRtcEngine.enableVideo();
  }

  /// Add agora event handlers
  void _addAgoraEventHandlers() {
    AgoraRtcEngine.onError = (dynamic code) {
      setState(() {
        final info = 'onError: $code';
        _infoStrings.add(info);
      });
    };

    AgoraRtcEngine.onJoinChannelSuccess = (
      String channel,
      int uid,
      int elapsed,
    ) {
      setState(() {
//        final info = 'onJoinChannel: $channel, uid: $uid';
        final info = 'Welcome Anil';
        _infoStrings.add(info);
      });
    };

    AgoraRtcEngine.onLeaveChannel = () {
      setState(() {
        _infoStrings.add('onLeaveChannel');
        _users.clear();
      });
    };

    AgoraRtcEngine.onUserJoined = (int uid, int elapsed) {
      setState(() {
        final info = 'userJoined: $uid';
        _infoStrings.add(info);
        _users.add(uid);
      });
    };

    AgoraRtcEngine.onUserOffline = (int uid, int reason) {
      setState(() {
        final info = 'userOffline: $uid';
        _infoStrings.add(info);
        _users.remove(uid);
      });
    };

    AgoraRtcEngine.onFirstRemoteVideoFrame = (
      int uid,
      int width,
      int height,
      int elapsed,
    ) {
      setState(() {
        final info = 'firstRemoteVideo: $uid ${width}x $height';
        _infoStrings.add(info);
      });
    };
  }

  /// Helper function to get list of native views
  List<Widget> _getRenderViews() {
    final List<AgoraRenderWidget> list = [
      AgoraRenderWidget(0, local: false, preview: false),
    ];
    _users.forEach((int uid) => list.add(AgoraRenderWidget(uid)));
    return list;
  }

  /// Video view wrapper
  Widget _videoView(view) {
    return Expanded(child: Container(
        child: view

    ));
  }

  /// Video view row wrapper
  Widget _expandedVideoRow(List<Widget> views) {
    final wrappedViews = views.map<Widget>(_videoView).toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  /// Video layout wrapper
  Widget _viewRows() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Offset offset = Offset.zero;
    final views = _getRenderViews();
    switch (views.length) {
      case 1:
        _onincreaseuser(false);
        return   Container(
          width: width,
          height: height,
          child: Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      _expandedVideoRow([views[0]])
                    ],
                  ),
                ],
              ),
        );

      case 2:
        _onincreaseuser(true);
        return   Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
       SizedBox(
      height: height,
      width: width,
      child:   Column(
        children: <Widget>[
          _expandedVideoRow([views[screens[1]]])
        ],
      ),
    ),
            Positioned(
              right: offset.dx,
              bottom: offset.dy+100,
              child: SizedBox(
              height: 100,
              width: 100,
              child: Column(
                        children: <Widget>[
                         _expandedVideoRow([views[screens[0]]])
                       ],
            ),
    ),
            ),


          ],
        );
      case 3:
        return Container(
            child: Column(
          children: <Widget>[

            _expandedVideoRow(views.sublist(2, 3)),
            _expandedVideoRow(views.sublist(0, 2)),
          ],
        ));
      case 4:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 4))
          ],
        ));
      default:
    }
    return Container();
  }

  /// Toolbar layout
  Widget _toolbar() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: _onToggleMute,
            child: Icon(
              muted ? Icons.mic_off : Icons.mic,
              color: muted ? Colors.white : Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: muted ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
          RawMaterialButton(
            onPressed: () => _onCallEnd(context),
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
          ),
          RawMaterialButton(
            onPressed: _onSwitchCamera,
            child: Icon(
              Icons.switch_camera,
              color: Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),

        ],
      ),
    );
  }
  Widget _toolbartop() {
    if(multiscreens){
      return
        Container(
          alignment: Alignment.topRight,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RawMaterialButton(
                onPressed: _ontogglescreen,
                child: Icon(
                  Icons.autorenew,
                  color: Colors.blueAccent,
                  size: 20.0,
                ),
                shape: CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.white,
                padding: const EdgeInsets.all(3.0),
              )
            ],
          ),
        );
    }
    else{
      return Text("");
    }

  }

  /// Info panel to show logs
  Widget _panel() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: ListView.builder(
            reverse: true,
            itemCount: _infoStrings.length,
            itemBuilder: (BuildContext context, int index) {
              if (_infoStrings.isEmpty) {
                return null;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          _infoStrings[index],
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }
  void _onincreaseuser(datadecision) {
    setState(() {
      multiscreens = datadecision;
    });

  }



  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    AgoraRtcEngine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    AgoraRtcEngine.switchCamera();
  }
  void _ontogglescreen() {
    setState(() {
      screens = screens.reversed.toList();
    });

  }



  @override
  Widget build(BuildContext context) {
    double widthc = MediaQuery.of(context).size.width;
    double heightc = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('GP COnsulting'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: widthc,
          height: heightc,
          child: Stack(
            children: <Widget>[
              _viewRows(),
              _panel(),
              _toolbar(),
              _toolbartop(),
            ],
          ),
        ),
      ),
    );
  }
}

class Dragbox extends StatefulWidget {

  final Offset initPos;
  final String label;
  final Color itemcolor;

  Dragbox(this.initPos,this.label,this.itemcolor);

  @override
  DragboxState createState() => DragboxState();
}

class DragboxState extends State<Dragbox> {
  Offset position = Offset(0.0, 0.0);
  @override
  void initState(){
    super.initState();
    position= widget.initPos;
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left:position.dx ,
      top: position.dy ,
      child: Draggable(
        data: widget.itemcolor,
        child: Container(
          width: 100,
          height: 100,
          color: widget.itemcolor,
          child: Text(
            widget.label,
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.none,
              fontSize: 20
            ),
          ),
        ),
        onDraggableCanceled: (velocity,offset){
          setState(() {
            position=offset;
          });

        },
        feedback: Container(
          width: 100,
          height: 100,
          color: widget.itemcolor.withOpacity(0.5),
          child: Text(
            widget.label,
            style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}
