//
//  Tweak.x
//  ZebraAutoComplete
//
//  Created by absidue on 08/09/2019.
//  Copyright © 2019 absidue. All rights reserved.
//

#import "Tweak.h"

double timeout = 1.0;

%group enabled

%hook ZBConsoleViewController

- (void)updateCompleteButton {
    %orig;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeout * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        [self.completeButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    });
}
%end

%end

%ctor {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/me.absidue.zebraautocomplete.plist"];
    BOOL enabled = YES;
    if (prefs) {
        timeout = [prefs[@"timeout"] doubleValue];
        enabled = [prefs[@"enabled"] boolValue];
    }
    if (enabled == YES) {
        %init(enabled);
    }
}
