//
//  VTProduct.h
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/10/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol VTProduct
@end

@interface VTProduct : JSONModel

@property(nonatomic,copy) NSString* productId;
@property(nonatomic,copy) NSString* name;

@property(nonatomic,assign) BOOL limitless;

@property(nonatomic,assign) NSInteger price;
@property(nonatomic,assign) NSInteger quantity;


@end
