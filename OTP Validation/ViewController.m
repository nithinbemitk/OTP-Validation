//
//  ViewController.m
//  OTP Validation
//
//  Created by Nithin.k on 22/05/17.
//  Copyright © 2017 NK Dreams. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    _otpOne.delegate = self;
    _otpTwo.delegate = self;
    
    _otpThree.delegate = self;
    _otpFour.delegate = self;
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    if (textField == _otpOne)
    {
        [_otpTwo becomeFirstResponder];
    }
    else if (textField == _otpTwo)
    {
        [_otpThree becomeFirstResponder];
    }
    else if (textField == _otpThree)
    {
        [_otpFour becomeFirstResponder];
    }
    
    return NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (string.length > 0 && ![[NSScanner scannerWithString:string] scanInt:NULL])
        return NO;
    
    NSUInteger oldLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
    if (newLength == 1) {
        if (textField == _otpOne)
        {
            [self performSelector:@selector(setNextResponder:) withObject:_otpTwo afterDelay:0.2];
        }
        else if (textField == _otpTwo)
        {
            [self performSelector:@selector(setNextResponder:) withObject:_otpThree afterDelay:0.2];
        }
        else if (textField == _otpThree)
        {
            [self performSelector:@selector(setNextResponder:) withObject:_otpFour afterDelay:0.2];
        }
    }
 
    
    return newLength <= 1;
}

- (void)setNextResponder:(UITextField *)nextResponder
{
    [nextResponder becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)verifyClicked:(id)sender {
    if(_otpOne.text.length > 0 || _otpTwo.text.length > 0 || _otpThree.text.length > 0 || _otpFour.text.length > 0)
    {
        UIAlertController *alerView = [UIAlertController alertControllerWithTitle:@"Message" message:@"Valid" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alerView addAction:okButton];
        [self presentViewController:alerView animated:YES completion:nil];
    }
    else
    {
        UIAlertController *alerView = [UIAlertController alertControllerWithTitle:@"Message" message:@"OTP can't be blank" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alerView addAction:okButton];
        [self presentViewController:alerView animated:YES completion:nil];
    }
}
@end
