//
//  VTTokenRequest.h
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/11/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VTCardDetails.h"
#import "JSONModel.h"

@interface VTTokenRequest : NSObject

@property VTCardDetails* cardDetails;

-(NSString*) getTokenUrl;

@end
