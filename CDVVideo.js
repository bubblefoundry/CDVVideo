var CDVVideo = {
  play: function play(video, portrait, callback, errback) {
    cordova.exec(callback, errback, 'CDVVideo', 'play', [video, portrait]);
  },
  finished: function finished(video) {
    console.log("finished playing video " + video);
  }
}