//
//  VTChargeResponse.h
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/10/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface VTChargeResponse : JSONModel

@property(nonatomic,copy) NSString<Optional>* approval_code;
@property(nonatomic,copy) NSString<Optional>* status_code;
@property(nonatomic,copy) NSString<Optional>* transaction_time;
@property(nonatomic,copy) NSString<Optional>* gross_amount;
@property(nonatomic,copy) NSString<Optional>* transaction_status;
@property(nonatomic,copy) NSString<Optional>* masked_card;
@property(nonatomic,copy) NSString<Optional>* fraud_status;
@property(nonatomic,copy) NSString<Optional>* status_message;
@property(nonatomic,copy) NSString<Optional>* bank;
@property(nonatomic,copy) NSString<Optional>* order_id;
@property(nonatomic,copy) NSString<Optional>* payment_type;
@property(nonatomic,copy) NSString* transaction_id;


@end
