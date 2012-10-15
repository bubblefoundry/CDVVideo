var CDVVideo = {
  play: function play(video, portrait, callback, errback) {
    cordova.exec(callback, errback, 'CDVVideo', 'play', [video, portrait]);
  }
}

function CDVVideoFinishCallBack(video) {
  console.log("finished playing video " + video);
}