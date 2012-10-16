//
//  CDVVideo.m
//  
//
//  Created by Peter Robinett on 2012-10-15.
//
//

#import "CDVVideo.h"
#import "MediaPlayer/MPMoviePlayerViewController.h"
#import "MediaPlayer/MPMoviePlayerController.h"
#import "MovieViewController.h"
#import <Cordova/CDV.h>

@implementation CDVVideo

- (void)play:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options {
  movie = [arguments objectAtIndex:1];
  NSString *orient = [arguments objectAtIndex:2];
  NSRange range = [movie rangeOfString:@"http"];
  if(range.length > 0) {
    if ([@"YES" isEqualToString:orient]) {
      player = [[MovieViewController alloc] initWithContentURL:[NSURL URLWithString:movie] andOrientation:YES];
    } else {
      player = [[MovieViewController alloc] initWithContentURL:[NSURL URLWithString:movie] andOrientation:NO];
    }
    
  } else {
    NSArray *fileNameArr = [movie componentsSeparatedByString:@"."];
    NSString *prefix = [fileNameArr objectAtIndex:0];
    NSString *suffix = [fileNameArr objectAtIndex:1];
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:prefix ofType:suffix];
    NSURL *fileURL = [NSURL fileURLWithPath:soundFilePath];
    if ([@"YES" isEqualToString:orient]) {
      player = [[MovieViewController alloc] initWithContentURL:fileURL andOrientation:YES];
    } else {
      player = [[MovieViewController alloc] initWithContentURL:fileURL andOrientation:NO];
    }
  }
  if (player) {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MovieDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    [self.viewController presentMoviePlayerViewControllerAnimated:player];
  }
}

- (void)MovieDidFinish:(NSNotification *)notification {
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:MPMoviePlayerPlaybackDidFinishNotification
                                                object:nil];
  [self writeJavascript:[NSString stringWithFormat:@"CDVVideo.finished(\"%@\");", movie]];
  
}

- (void)dealloc {
  [player release];
  [movie release];
  [super dealloc];
}

@end
