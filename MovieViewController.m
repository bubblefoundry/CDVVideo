//
//  MovieViewController.m
//
//
//  Created by Peter Robinett on 2012-10-15.
//
//  Based on phonegap-videoplayer-plugin by eiffel on 2011-11-09
//
//
#import "MovieViewController.h"

@implementation MovieViewController
@synthesize orientation=_orientation;

- (id)initWithContentURL:(NSURL *)url andOrientation:(BOOL)orientation
{
    MovieViewController *o =  [[[[self class] alloc] initWithContentURL:url] autorelease];
    o.orientation = orientation;
    return o;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if (self.orientation) {
        return UIInterfaceOrientationIsPortrait(interfaceOrientation);
    } else {
       return UIInterfaceOrientationIsLandscape(interfaceOrientation); 
    }
}

@end
