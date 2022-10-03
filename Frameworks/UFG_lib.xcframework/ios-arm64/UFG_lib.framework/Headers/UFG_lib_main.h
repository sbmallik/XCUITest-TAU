//
//  UFG_lib_main.h
//  UFG-lib
//
//  Created by Clement Barry on 24/08/2020.
//

#import <Foundation/Foundation.h>
@import UIKit;

//! Project version number for UFG_lib.
FOUNDATION_EXPORT double UFG_libVersionNumber;

//! Project version string for UFG_lib.
FOUNDATION_EXPORT const unsigned char UFG_libVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <UFG_lib/PublicHeader.h>

@interface UFG_lib_main : NSObject

+ (UFG_lib_main *)sharedUFG;
+ (NSString *)versionString;

- (void)dumpIncludingScreenshot:(UIImage *)screenshot
             fullPageScreenshot:(UIImage *)fullPageScreenshot
                       synopsis:(NSString *)synopsis
                          named:(NSString *)name
                    orientation:(UIInterfaceOrientation)orientation
                         traits:(UITraitCollection *)traitCollection
              resizeResolutions:(NSDictionary* (^)(void))resizeHandler
          withCompletionHandler:(void (^)(NSURL *fileUrl, NSString *name, NSDictionary *userInfo))completionHandler;

@end
