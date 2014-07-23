//
//  OANSNumber.h
//  Build NSNumber
//
//  Created by sanlen on 7/23/14.
//  Copyright (c) 2014 Onet away. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OANSNumber : NSObject {
    
    enum { INT, UINT, DOUBLE } _type;
    union {
        long long i;
        unsigned long long u;
        double d;
    } _value;
}

#pragma mark - Init Methods
- (instancetype)initWithChar:(char)value;
- (instancetype)initWithUnsignedChar:(unsigned char)value;
- (instancetype)initWithShort:(short)value;
- (instancetype)initWithUnsignedShort:(unsigned short)value;
- (instancetype)initWithInt:(int)value;
- (instancetype)initWithUnsignedInt:(unsigned int)value;
- (instancetype)initWithLong:(long)value;
- (instancetype)initWithUnsignedLong:(unsigned long)value;
- (instancetype)initWithLongLong:(long long)value;
- (instancetype)initWithUnsignedLongLong:(unsigned long long)value;
- (instancetype)initWithFloat:(float)value;
- (instancetype)initWithDouble:(double)value;
- (instancetype)initWithBool:(BOOL)value;
- (instancetype)initWithInteger:(NSInteger)value;
- (instancetype)initWithUnsignedInteger:(NSUInteger)value;

#pragma mark - Getter Methods
- (char)charValue;
- (unsigned char)unsignedCharValue;
- (short)shortValue;
- (unsigned short)unsignedShortValue;
- (int)intValue;
- (unsigned int)unsignedIntValue;
- (long)longValue;
- (unsigned long)unsignedLongValue;
- (long long)longLongValue;
- (unsigned long long)unsignedLongLongValue;
- (float)floatValue;
- (double)doubleValue;
- (BOOL)boolValue;
- (NSInteger)integerValue;
- (NSUInteger)unsignedIntegerValue;

#pragma mark - String conversion and comparision
- (NSString *)stringValue;
- (NSComparisonResult)compare:(OANSNumber *)otherNumber;
- (BOOL)isEqualToNumber:(OANSNumber *)number;
- (NSString *)descriptionWithLocale:(id)locale;

@end







































