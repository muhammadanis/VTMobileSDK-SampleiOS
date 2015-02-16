//
//  VTConfirmTransactionRequest.h
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/12/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface VTConfirmTransactionRequest : JSONModel

@property NSString* client_key;
@property NSString* transaction_id;

@end
