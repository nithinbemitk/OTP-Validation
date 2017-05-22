//
//  ViewController.h
//  OTP Validation
//
//  Created by Nithin.k on 22/05/17.
//  Copyright © 2017 NK Dreams. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *otpOne;
@property (strong, nonatomic) IBOutlet UITextField *otpTwo;
@property (strong, nonatomic) IBOutlet UITextField *otpThree;
@property (strong, nonatomic) IBOutlet UITextField *otpFour;

- (IBAction)verifyClicked:(id)sender;
@end

