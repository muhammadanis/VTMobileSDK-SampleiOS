//
//  VTBaseRequest.h
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/11/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface VTBaseRequest : JSONModel

@property(nonatomic,copy) NSString* client_key;

@end
