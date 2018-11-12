//
//  AnimalModel.h
//  AnimationNavView
//
//  Created by wangdu on 2018/11/12.
//  Copyright © 2018 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface AnimalModel : NSObject

@property (strong, nonatomic) NSString *animalName;
@property (strong, nonatomic) NSString *animalImageUrl;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *interpretation;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

- (NSDictionary *)toDictionary;

- (NSString *)validateForInsert;

- (void)insertUser:(void (^)(NSURLSessionDataTask *operation, id responseObject))success
           failure:(void (^)(NSURLSessionDataTask *operation, NSError *error))failure;

@end
