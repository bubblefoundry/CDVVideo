//
//  CDVVideo.h
//  
//
//  Created by Peter Robinett on 2012-10-15.
//
//

#import <Cordova/CDV.h>
#import "MovieViewController.h"

@interface CDVVideo : CDVPlugin {
  MovieViewController *player;
  NSString *movie;
}

- (void)play:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options;

@end