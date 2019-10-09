//
//  Tweak.h
//  ZebraAutoComplete
//
//  Created by absidue on 08/09/2019.
//  Copyright © 2019 absidue. All rights reserved.
//

#import <UIKit/UIButton.h>

@interface ZBConsoleViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *completeButton;

- (void)updateCompleteButton;
- (void)closeZebra;
- (void)restartSpringBoard;
- (void)close;
@end
