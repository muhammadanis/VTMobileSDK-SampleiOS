//
//  VTTokenResponse.h
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/11/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface VTTokenResponse : JSONModel

@property(nonatomic,assign) NSInteger status_code;
@property(nonatomic,copy) NSString* status_message;
@property(nonatomic,copy) NSString<Optional>* redirect_url;
@property(nonatomic,copy) NSString* token_id;
@property(nonatomic,copy) NSString<Optional>* bank;

@end
