//
//  APIManager.h
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "BDBOAuth1SessionManager.h"
#import "BDBOAuth1SessionManager+SFAuthenticationSession.h"
#import "Tweets.h"

@interface APIManager : BDBOAuth1SessionManager

+ (instancetype)shared;

- (void)getHomeTimelineWithCompletion:(void(^)(NSArray *tweets, NSError *error))completion;
- (void)postStatusWithText:(NSString *)text completion:(void (^)(Tweets *, NSError *))completion;
- (void)favorite:(Tweets *)tweet completion:(void (^)(Tweets *, NSError *))completion;
- (void)unFavorite:(Tweets *)tweet completion:(void (^)(Tweets *, NSError *))completion;
- (void)reTweet:(Tweets *)tweet completion:(void (^)(Tweets *, NSError *))completion;
- (void)unreTweet:(Tweets *)tweet completion:(void (^)(Tweets *, NSError *))completion;
@end
