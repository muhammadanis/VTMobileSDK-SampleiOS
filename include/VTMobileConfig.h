//
//  VTMobileConfig.h
//  VTMobileSDK
//
//  Created by Muhammad Anis on 2/9/15.
//  Copyright (c) 2015 Veritrans Indonesia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VTMobileConfig : NSObject

+(NSString*) ClientKey;
+(void) setClientKey: (NSString*)val;

+(BOOL) isProduction;
+(void) setIsProduction:(BOOL)val;


@end
