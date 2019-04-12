//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  HunLiJiDylib.h
//  HunLiJiDylib
//
//  Created by GarrettGao on 2019/1/3.
//  Copyright (c) 2019年 HunBoHui. All rights reserved.
//

#import <Foundation/Foundation.h>

#define INSERT_SUCCESS_WELCOME @"\n               🎉!!！congratulations!!！🎉\n👍----------------insert dylib success----------------👍"

@interface CustomViewController

@property (nonatomic, copy) NSString* newProperty;

+ (void)classMethod;

- (NSString*)getMyName;

- (void)newMethod:(NSString*) output;

@end
