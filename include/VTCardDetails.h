//
//  VTCardDetails.h
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/9/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#ifndef __VTMobileSDK_VTCardDetails_H__
#define __VTMobileSDK_VTCardDetails_H__

#import <Foundation/Foundation.h>

@interface VTCardDetails : NSObject

@property(nonatomic,copy) NSString* card_number;
@property(nonatomic,copy) NSString* card_cvv;
@property(nonatomic,copy) NSString* bank;
@property(nonatomic,copy) NSString* gross_amount;

@property(nonatomic,assign) NSInteger card_exp_month;
@property(nonatomic,assign) NSInteger card_exp_year;

@property(nonatomic,assign) BOOL secure;


-(NSString*) getParamUrl;
-(NSString*) getBankParam;

@end


#endif