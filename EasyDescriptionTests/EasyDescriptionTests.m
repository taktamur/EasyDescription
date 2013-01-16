//
//  EasyDescriptionTests.m
//  EasyDescriptionTests
//
//  Created by 田村 孝文 on 2013/01/16.
//  Copyright (c) 2013年 田村 孝文. All rights reserved.
//

#import "EasyDescriptionTests.h"
#import "NSObject+EasyDescription.h"
#pragma mark - DummyObject
@interface Dummy:NSObject
@property(nonatomic,strong)NSString *stringProperty;
@property(nonatomic)int intProperty;
@property(nonatomic)double doubleProperty;
@property(nonatomic)float floatProperty;
@property(nonatomic)BOOL boolProperty;
@end
@implementation Dummy
@synthesize stringProperty,intProperty,doubleProperty,floatProperty,boolProperty;
-(NSString *)description
{
    return [self easyDescription];
}
@end


#pragma mark - EasyDescriptionTests
@implementation EasyDescriptionTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    Dummy *dummy =[[Dummy alloc]init];
    dummy.stringProperty = @"string";
    dummy.intProperty=1;
    dummy.doubleProperty=2.0;
    dummy.floatProperty=3.0;
    dummy.boolProperty=YES;
    
    NSDictionary *properties = [dummy propertyDic];
    NSDictionary *ansers = @{@"stringProperty":@"string",
    @"intProperty":@1,
    @"doubleProperty":@2.0,
    @"floatProperty":@3.0,
    @"boolProperty":@YES };
    STAssertEqualObjects(properties, ansers, @"property dictionary is invalid.");
    NSLog( @"%@",dummy);
    NSString *anserDesctiption = @"Dummy{stringProperty=string;boolProperty=1;doubleProperty=2;intProperty=1;floatProperty=3}";
    STAssertEqualObjects(anserDesctiption, [dummy description], @"description invalid.");
}

@end
