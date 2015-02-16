//
//  VTChargeRequest.h
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/11/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VTBaseRequest.h"
#import "VTProduct.h"
#import "VTTokenData.h"

@interface VTChargeRequest : JSONModel

@property(nonatomic,copy) NSString* client_key;
@property(nonatomic,copy) NSString* payment_type;
@property(nonatomic,copy) NSString* email;
@property(nonatomic,strong) VTTokenData* token_data;
@property(nonatomic,retain) NSMutableArray<VTProduct>* item_details;

@end
