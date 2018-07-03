//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "TweetCellTableViewCell.h"
@interface TimelineViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tweetTableView;
@property (strong, nonatomic) NSMutableArray *tweetList;
@property (strong, nonatomic) UIRefreshControl *refresher;
@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.refresher = [UIRefreshControl new];
    self.tweetTableView.delegate = self;
    self.tweetTableView.dataSource = self;
    self.tweetTableView.rowHeight = 300;
    // Get timeline
    [self FetchTweets];
    [self.refresher addTarget:self action:@selector(FetchTweets)forControlEvents:UIControlEventValueChanged];
    [self.tweetTableView insertSubview:self.refresher atIndex:0];
}

-(void)FetchTweets{
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            self.tweetList = [NSMutableArray arrayWithArray:tweets];
            [self.tweetTableView reloadData];
            [self.refresher endRefreshing];
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
    }];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tweetList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TweetCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    Tweets *tweet1 = self.tweetList[indexPath.row];
    [cell setWithTweet:tweet1];
    return cell;
    
    
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
