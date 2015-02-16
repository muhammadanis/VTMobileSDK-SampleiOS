//
//  VTTokenData.h
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/11/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface VTTokenData : JSONModel

@property NSString* token_id;
@property NSString<Optional>* bank;

@end
