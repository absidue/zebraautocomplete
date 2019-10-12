//
//  Tweak.h
//  ZebraAutoComplete
//
//  Created by absidue on 2019-09-08.
//  Copyright © 2019 absidue. All rights reserved.
//

#import <UIKit/UIButton.h>

typedef enum {
    ZBLogLevelDescript,
    ZBLogLevelInfo,
    ZBLogLevelWarning,
    ZBLogLevelError
} ZBLogLevel;

@interface ZBConsoleViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *completeButton;

- (void)closeZebra;
- (void)restartSpringBoard;
- (void)close;
- (void)updateCompleteButton;
- (void)writeToConsole:(NSString *)str atLevel:(ZBLogLevel)level;
@end
