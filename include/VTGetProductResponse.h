//
//  VTGetProductResponse.h
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/10/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VTBaseResponse.h"

@interface VTGetProductResponse : NSObject

@property(nonatomic,copy) NSString* merchantId;
@property(nonatomic,retain) NSMutableArray* products;

-(id)initWithMerchantIdAndProducts:(NSString*) merchantId products:(NSMutableArray*) products;
+(instancetype) responseWithMerchantIdAndProducts:(NSString*)merchantId products:(NSMutableArray*) products;

@end
