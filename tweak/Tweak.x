//
//  Tweak.x
//  ZebraAutoComplete
//
//  Created by absidue on 2019-09-08.
//  Copyright © 2019 absidue. All rights reserved.
//

#import "Tweak.h"

NSMutableDictionary *prefs = nil;
NSString *prefsPath = @"/var/mobile/Library/Preferences/me.absidue.zebraautocomplete.plist";
BOOL aborted = NO;

void refreshPrefs();

%group enabled

%hook ZBConsoleViewController

- (void)viewDidAppear:(BOOL)animated {
    aborted = NO;
    %orig;
}

- (void)closeZebra {
    aborted = YES;
    %orig;
}

- (void)restartSpringBoard {
    aborted = YES;
    %orig;
}

- (void)close {
    aborted = YES;
    %orig;
}

- (void)writeToConsole:(NSString *)str atLevel:(ZBLogLevel)level {
    %orig;
    if (!aborted) {
        if (level == ZBLogLevelError) {
            refreshPrefs();
            if ([prefs objectForKey:@"abortOnError"] && [prefs[@"abortOnError"] boolValue]) {
                aborted = YES;
            }
        } else if (level == ZBLogLevelWarning) {
            refreshPrefs();
            if ([prefs objectForKey:@"abortOnWarning"] && [prefs[@"abortOnWarning"] boolValue]) {
                aborted = YES;
            }
        }
    }
}

- (void)updateCompleteButton {
    %orig;

    if (!aborted) {
        refreshPrefs();

        double timeout = 0.0;
        if (prefs) {
            timeout = [prefs[@"timeout"] doubleValue];
        }

        dispatch_block_t completeBlock = ^{
            if (!aborted) {
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
}
%end

%end

void refreshPrefs() {
    prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:prefsPath];
}

%ctor {
    refreshPrefs();

    BOOL enabled = YES;
    if (prefs) {
        enabled = [prefs[@"enabled"] boolValue];
    }

    if (enabled) {
        %init(enabled);
    }
}
