//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  HunLiJiDylib.m
//  HunLiJiDylib
//
//  Created by GarrettGao on 2019/1/3.
//  Copyright (c) 2019年 HunBoHui. All rights reserved.
//

#import "HunLiJiDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>
#import <MDCycriptManager.h>

CHConstructor{
    NSLog(INSERT_SUCCESS_WELCOME);
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
#ifndef __OPTIMIZE__
        CYListenServer(6666);

        MDCycriptManager* manager = [MDCycriptManager sharedInstance];
        [manager loadCycript:NO];

        NSError* error;
        NSString* result = [manager evaluateCycript:@"UIApp" error:&error];
        NSLog(@"result: %@", result);
        if(error.code != 0){
            NSLog(@"error: %@", error.localizedDescription);
        }
#endif
        
    }];
}

// 会员验证Model处理 ================
CHDeclareClass(HLJUserPrivilegeResult)
CHOptimizedMethod0(self, unsigned long long, HLJUserPrivilegeResult, memberPrivilege) {
    return 1;   // 1代表会员
}

// 中间件本地判断是否是会员处理 =============
CHDeclareClass(HLJMediator)
CHOptimizedMethod0(self, BOOL, HLJMediator, HLJMediator_isMember) {
    return YES; // 是否是会员永远返回 YES
}

// 脚本替换入口 ==============
CHConstructor{
    
    CHLoadLateClass(HLJUserPrivilegeResult);
    CHClassHook0(HLJUserPrivilegeResult, memberPrivilege);
    
    CHLoadLateClass(HLJMediator);
    CHClassHook0(HLJMediator, HLJMediator_isMember);
}

