//
//  VTMobileSDK.h
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/9/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VTGetProductResponse.h"
#import "VTHttpContainer.h"
#import "VTChargeResponse.h"
#import "VTChargeRequest.h"
#import "VTTokenRequest.h"
#import "VTTokenResponse.h"
#import "VTConfirmTransactionRequest.h"
#import "VTConfirmTransactionResponse.h"


@interface VTMobile : NSObject

+(void) getAllProducts:(void(^)(VTGetProductResponse* response, NSException* exception)) completionHandler;

+(void) getToken:(void(^) (VTTokenResponse* response, NSException* exception)) completionHandler withRequest:(VTTokenRequest*) tokenRequest;

+(void) charge:(void(^)(VTChargeResponse* response, NSException* exception)) completionHandler withChargeRequest:(VTChargeRequest*) chargeRequest;

+(void) confirmTransaction:(void(^)(VTConfirmTransactionResponse* response, NSException* exception))completionHandler withRequest:(VTConfirmTransactionRequest*) transactionRequest;

@end
