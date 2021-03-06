//
//  ComposeViewController.m
//  twitter
//
//  Created by Nkenna Aniedobe on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *tweetButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeButton;

@end
@implementation ComposeViewController
- (IBAction)onClose:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)didTweet:(id)sender {
    APIManager *API = [APIManager new];
    [API postStatusWithText:self.textField.text completion:^(Tweets *tweet, NSError *error) {
        if(tweet){
            NSLog(@"roflmao");
            [self.delegate hasTweet:tweet];
        }
        else{
            NSLog(@"uh oh");
        }
    }];
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
