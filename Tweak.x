//
//  Tweak.x
//  ZebraAutoComplete
//
//  Created by absidue on 08/09/2019.
//  Copyright © 2019 absidue. All rights reserved.
//

#import "Tweak.h"

NSMutableDictionary *prefs = nil;
NSString *prefsPath = @"/var/mobile/Library/Preferences/me.absidue.zebraautocomplete.plist";
BOOL alreadyCompleted = NO;

%group enabled

%hook ZBConsoleViewController

- (void)viewDidAppear:(BOOL)animated {
    alreadyCompleted = NO;
    %orig;
}

- (void)closeZebra {
    alreadyCompleted = YES;
    %orig;
}

- (void)restartSpringBoard {
    alreadyCompleted = YES;
    %orig;
}

- (void)close {
    alreadyCompleted = YES;
    %orig;
}

- (void)updateCompleteButton {
    %orig;
    prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:prefsPath];

    double timeout = 0.0;
    if (prefs) {
        timeout = [prefs[@"timeout"] doubleValue];
    }

    dispatch_block_t completeBlock = ^{
        if (!alreadyCompleted) {
            [self.completeButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        }
    };

    if (timeout == 0.0) {
        dispatch_async(dispatch_get_main_queue(), completeBlock);
    } else {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeout * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), completeBlock);
    }
}
%end

%end

%ctor {
    prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:prefsPath];

    BOOL enabled = YES;
    if (prefs) {
        enabled = [prefs[@"enabled"] boolValue];
    }

    if (enabled) %init(enabled);
}
