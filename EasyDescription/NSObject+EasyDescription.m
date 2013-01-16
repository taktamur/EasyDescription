//
//  NSObject+EasyDescription.m
//  EasyDescription
//
//  Created by 田村 孝文 on 2013/01/16.
//  Copyright (c) 2013年 Áî∞Êùë Â≠ùÊñá. All rights reserved.
//

#import "NSObject+EasyDescription.h"
#import <objc/runtime.h>

#import "Underscore.h"

#pragma mark - NSObjecet+EasyDescription
@implementation NSObject (EasyDescription)
-(NSDictionary *)propertyDic
{
    NSMutableDictionary *properties = [[NSMutableDictionary alloc]init];
    NSUInteger propertyListCount;
    objc_property_t *propertyList = class_copyPropertyList([self class], &propertyListCount);
    for( int i=0; i<propertyListCount; i++ ){
        objc_property_t property = propertyList[i];
        NSString *propertyName = [NSString stringWithCString:property_getName(property)
                                                    encoding:NSASCIIStringEncoding];
        id propertyValue = [self valueForKey:propertyName];
        [properties setObject:propertyValue forKey:propertyName];
    }
    return properties;
}
-(NSString *)easyDescription
{
    NSDictionary *originalPropertes = [self propertyDic];
    NSArray *descriptions = Underscore.dict(originalPropertes)
    .map(^(id key,id obj){ return [NSString stringWithFormat:@"%@=%@",key,obj];})
    .values.unwrap;
    return [NSString stringWithFormat:@"%@{%@}",NSStringFromClass([self class]),
            [descriptions componentsJoinedByString:@";"]];
}

@end
