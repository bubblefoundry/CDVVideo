# CDVVideo

CDVVideo is a Cordova 1.7+ plugin for iOS that allows playing video (local or remote) via a native video player. It is essentially a port of eiffelqiu's [phonegape-videoplayer-plugin](phonegap-videoplayer-plugin).

## Installation

1. Drop the `.h` and `.m` files into the Cordova `Plugins` folder. Use the default options.
2. Add an entry to the `Plugins` dictionary in `Cordova.plist`. The key should be `CDVVideo` and the value must be `CDVVideo`.
3. Add the `CDVVideo.js` file somewhere under your `www` directory and include it in your `index.html` file.
4. Play a video by calling `CDVVideo.play(video, portrait)`, where `video` is the URL or filename you wish to play and `portrait` is a string that is either `YES` or `NO`, indicating whether portrait or landscape orientation should be used.
5. _Optional:_ Change or overwrite `CDVVideo.finished(video)` to handle when a video finishes playing. `video` corresponds to the video that you passed to `CDVVideo.play()`.