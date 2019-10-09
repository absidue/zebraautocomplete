//
//  Preferences.m
//  ZebraAutoCompletePrefs
//
//  Created by absidue on 2019-09-08.
//  Copyright © 2019 absidue. All rights reserved.
//

#include "Preferences.h"

@implementation ZACPrefsListController

- (NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers = [self loadSpecifiersFromPlistName:@"Prefs" target:self];
    }

    return _specifiers;
}

- (void)closeZebra:(id)sender {
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/usr/bin/killall"];
    [task setArguments:[NSArray arrayWithObjects:@"Zebra", nil]];
    [task launch];
}

@end
