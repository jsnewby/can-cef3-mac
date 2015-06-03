//
//  SFDefaultTab.m
//  cefclient
//
//  Created by DEVIKA SINGH on 3/13/15.
//
//

#import "SFDefaultTab.h"

static CGImageRef activeTab;
static CGImageRef  inactiveTab;

@implementation SFLabelLayer

- (BOOL) containsPoint:(CGPoint)p
{
    return FALSE;
}

@end


@implementation SFDefaultTab

- (void) setRepresentedObject: (id) representedObject {
    CAConstraintLayoutManager *layout = [CAConstraintLayoutManager layoutManager];
    [self setLayoutManager:layout];
    
    _representedObject = representedObject;
    self.frame = CGRectMake(0, 0, 125, 28);
    if(!activeTab) {
        CFStringRef path = (CFStringRef)[[NSBundle mainBundle] pathForResource:@"activeTab" ofType:@"png"];
        CFURLRef imageURL = CFURLCreateWithFileSystemPath(nil, path, kCFURLPOSIXPathStyle, NO);
        CGImageSourceRef imageSource = CGImageSourceCreateWithURL(imageURL, nil);
        activeTab = CGImageSourceCreateImageAtIndex(imageSource, 0, nil);
        CFRelease(imageURL); CFRelease(imageSource);
        
        
        path = (CFStringRef)[[NSBundle mainBundle] pathForResource:@"inactiveTab" ofType:@"png"];
        imageURL = CFURLCreateWithFileSystemPath(nil, path, kCFURLPOSIXPathStyle, NO);
        imageSource = CGImageSourceCreateWithURL(imageURL, nil);
        inactiveTab = CGImageSourceCreateImageAtIndex(imageSource, 0, nil);
        CFRelease(imageURL); CFRelease(imageSource);
    }
    
    [self setContents: (id)inactiveTab];
    
    //devika, adding a closeCircle to each tab
    
    
    
    CAShapeLayer *circle = [[CAShapeLayer alloc] init];
    circle.fillColor = [NSColor redColor].CGColor;
    CGMutablePathRef p = CGPathCreateMutable();
    CGPathAddEllipseInRect(p, NULL, CGRectMake(0, 0, 12, 12));
    circle.path = p;
    circle.bounds = CGPathGetBoundingBox(p);
    circle.position = CGPointMake(CGRectGetMidX(self.bounds) + 40, CGRectGetMidY(self.bounds) + 2);
    circle.name = @"closeCircle";
   // [self addSublayer:circle];
    //end devika
    
    
    SFLabelLayer *tabLabel = [SFLabelLayer layer];
    
    if ([representedObject objectForKey:@"name"] != nil) {
        tabLabel.string = [representedObject objectForKey:@"name"];
    }
    
    [tabLabel setFontSize:10.0f];
    [tabLabel setShadowOpacity:.9f];
    tabLabel.shadowOffset = CGSizeMake(0, -1);
    tabLabel.shadowRadius = 1.0f;
    tabLabel.shadowColor = CGColorCreateGenericRGB(1,1,1, 1);
    tabLabel.foregroundColor = CGColorCreateGenericRGB(0.1,0.1,0.1, 1);
    tabLabel.truncationMode = kCATruncationEnd;
    tabLabel.alignmentMode = kCAAlignmentCenter;
    CAConstraint *constraint = [CAConstraint constraintWithAttribute:kCAConstraintMidX
                                                          relativeTo:@"superlayer"
                                                           attribute:kCAConstraintMidX];
    [tabLabel addConstraint:constraint];
    
    constraint = [CAConstraint constraintWithAttribute:kCAConstraintMidY
                                            relativeTo:@"superlayer"
                                             attribute:kCAConstraintMidY
                                                offset:-2.0];
    [tabLabel addConstraint:constraint];
    
    constraint = [CAConstraint constraintWithAttribute:kCAConstraintMaxX
                                            relativeTo:@"superlayer"
                                             attribute:kCAConstraintMaxX
                                                offset:-20.0];
    [tabLabel addConstraint:constraint];
    
    constraint = [CAConstraint constraintWithAttribute:kCAConstraintMinX
                                            relativeTo:@"superlayer"
                                             attribute:kCAConstraintMinX
                                                offset:20.0];
    [tabLabel addConstraint:constraint];
    
    
    [tabLabel setFont:@"Arial"];
    
    [self addSublayer:tabLabel];
    
   
    
    
    [self addSublayer:circle];

    
}



- (void) setMainRepresentedObject: (id) representedObject {
    CAConstraintLayoutManager *layout = [CAConstraintLayoutManager layoutManager];
    [self setLayoutManager:layout];
    
    _representedObject = representedObject;
    self.frame = CGRectMake(0, 0, 125, 28);
    if(!activeTab) {
        CFStringRef path = (CFStringRef)[[NSBundle mainBundle] pathForResource:@"activeTab" ofType:@"png"];
        CFURLRef imageURL = CFURLCreateWithFileSystemPath(nil, path, kCFURLPOSIXPathStyle, NO);
        CGImageSourceRef imageSource = CGImageSourceCreateWithURL(imageURL, nil);
        activeTab = CGImageSourceCreateImageAtIndex(imageSource, 0, nil);
        CFRelease(imageURL); CFRelease(imageSource);
        
        
        path = (CFStringRef)[[NSBundle mainBundle] pathForResource:@"inactiveTab" ofType:@"png"];
        imageURL = CFURLCreateWithFileSystemPath(nil, path, kCFURLPOSIXPathStyle, NO);
        imageSource = CGImageSourceCreateWithURL(imageURL, nil);
        inactiveTab = CGImageSourceCreateImageAtIndex(imageSource, 0, nil);
        CFRelease(imageURL); CFRelease(imageSource);
    }
    
    [self setContents: (id)inactiveTab];
    
    //devika, adding a closeCircle to each tab
    
    
    /*
    CAShapeLayer *circle = [[CAShapeLayer alloc] init];
    circle.fillColor = [NSColor redColor].CGColor;
    CGMutablePathRef p = CGPathCreateMutable();
    CGPathAddEllipseInRect(p, NULL, CGRectMake(0, 0, 12, 12));
    circle.path = p;
    circle.bounds = CGPathGetBoundingBox(p);
    circle.position = CGPointMake(CGRectGetMidX(self.bounds) + 40, CGRectGetMidY(self.bounds) + 2);
    circle.name = @"closeCircle";*/
    // [self addSublayer:circle];
    //end devika
    
    
    SFLabelLayer *tabLabel = [SFLabelLayer layer];
    
    if ([representedObject objectForKey:@"name"] != nil) {
        tabLabel.string = [representedObject objectForKey:@"name"];
    }
    
    [tabLabel setFontSize:10.0f];
    [tabLabel setShadowOpacity:.9f];
    tabLabel.shadowOffset = CGSizeMake(0, -1);
    tabLabel.shadowRadius = 1.0f;
    tabLabel.shadowColor = CGColorCreateGenericRGB(1,1,1, 1);
    tabLabel.foregroundColor = CGColorCreateGenericRGB(0.1,0.1,0.1, 1);
    tabLabel.truncationMode = kCATruncationEnd;
    tabLabel.alignmentMode = kCAAlignmentCenter;
    CAConstraint *constraint = [CAConstraint constraintWithAttribute:kCAConstraintMidX
                                                          relativeTo:@"superlayer"
                                                           attribute:kCAConstraintMidX];
    [tabLabel addConstraint:constraint];
    
    constraint = [CAConstraint constraintWithAttribute:kCAConstraintMidY
                                            relativeTo:@"superlayer"
                                             attribute:kCAConstraintMidY
                                                offset:-2.0];
    [tabLabel addConstraint:constraint];
    
    constraint = [CAConstraint constraintWithAttribute:kCAConstraintMaxX
                                            relativeTo:@"superlayer"
                                             attribute:kCAConstraintMaxX
                                                offset:-20.0];
    [tabLabel addConstraint:constraint];
    
    constraint = [CAConstraint constraintWithAttribute:kCAConstraintMinX
                                            relativeTo:@"superlayer"
                                             attribute:kCAConstraintMinX
                                                offset:20.0];
    [tabLabel addConstraint:constraint];
    
    
    [tabLabel setFont:@"Arial"];
    
    [self addSublayer:tabLabel];
    
    
    
    
   // [self addSublayer:circle];
    
    
}


- (void) setSelected: (BOOL) selected {
    [CATransaction begin]; 
    [CATransaction setValue: (id) kCFBooleanTrue forKey: kCATransactionDisableActions];
    
    if (selected)
        [self setContents: (id)activeTab];
    else
        [self setContents: (id)inactiveTab];
    
    [CATransaction commit];
    
}

//begin devika
- (void) setBrowserLabel: (NSString*) browserlabel {
    [CATransaction begin];
    [CATransaction setValue: (id) kCFBooleanTrue forKey: kCATransactionDisableActions];
    //devika
    SFLabelLayer *tabLabel = [[self sublayers] firstObject];
    tabLabel.string = browserlabel;
    
    [CATransaction commit];
}
// end devika

@end
