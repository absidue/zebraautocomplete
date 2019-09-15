//
//  Preferences.m
//  ZebraAutoCompletePrefs
//
//  Created by absidue on 08/09/2019.
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

- (void)killZebra:(id)sender {
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/usr/bin/killall"];
    [task setArguments:[NSArray arrayWithObjects:@"Zebra", nil]];
    [task launch];
}

@end
