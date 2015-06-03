//
//  SFDefaultTab.h
//  cefclient
//
//  Created by DEVIKA SINGH on 3/13/15.
//
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>
#import "SFTabView.h"


@interface SFLabelLayer : CATextLayer {}
@end


@interface SFDefaultTab : CALayer {
    id _representedObject;
}

- (void) setRepresentedObject: (id) representedObject;
- (void) setMainRepresentedObject: (id) representedObject;
- (void) setSelected: (BOOL) selected;
- (void) setBrowserLabel: (NSString*) browserlabel; //devika

@end
