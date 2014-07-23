//
//  OANSNumber.m
//  Build NSNumber
//
//  Created by sanlen on 7/23/14.
//  Copyright (c) 2014 Onet away. All rights reserved.
//

#import "OANSNumber.h"



@implementation OANSNumber

#define RETURN() do { \
    if (_type == INT) \
        return _value.i; \
    else if (_type == UINT) \
        return _value.u; \
    else \
        return _value.d; \
} while (0)



#define COMPARE(a, b) do { \
        __typeof__(a) __a_local = a; \
        __typeof__(b) __b_local = b; \
        BOOL __a_isnan = isnan(__a_local); \
        BOOL __b_isnan = isnan(__b_local); \
        if(__a_isnan && __b_isnan) \
            return NSOrderedSame; \
        else if(__a_isnan) \
            return NSOrderedAscending; \
        else if(__b_isnan) \
            return NSOrderedDescending; \
        else if(__a_local > __b_local) \
            return NSOrderedDescending; \
        else if(__a_local < __b_local) \
            return NSOrderedAscending; \
        else \
            return NSOrderedSame; \
} while(0)


#pragma mark - Factory Methods
+ (OANSNumber *)numberWithChar:(char)value
{
    return [[OANSNumber alloc] initWithChar:value];
}

+ (OANSNumber *)numberWithUnsignedChar:(unsigned char)value
{
    return [[OANSNumber alloc] initWithUnsignedChar:value];
}

+ (OANSNumber *)numberWithShort:(short)value
{
    return [[OANSNumber alloc] initWithShort:value];
}

+ (OANSNumber *)numberWithUnsignedShort:(unsigned short)value
{
    return [[OANSNumber alloc] initWithUnsignedShort:value];
}

+ (OANSNumber *)numberWithInt:(int)value
{
    return [[OANSNumber alloc] initWithInt:value];
}

+ (OANSNumber *)numberWithUnsignedInt:(unsigned int)value
{
    return [[OANSNumber alloc] initWithUnsignedInt:value];
}

+ (OANSNumber *)numberWithLong:(long)value
{
    return [[OANSNumber alloc] initWithLong:value];
}

+ (OANSNumber *)numberWithUnsignedLong:(unsigned long)value
{
    return [[OANSNumber alloc] initWithUnsignedLong:value];
}

+ (OANSNumber *)numberWithLongLong:(long long)value
{
    return [[OANSNumber alloc] initWithLongLong:value];
}

+ (OANSNumber *)numberWithUnsignedLongLong:(unsigned long long)value
{
    return [[OANSNumber alloc] initWithUnsignedLongLong:value];
}

+ (OANSNumber *)numberWithFloat:(float)value
{
    return [[OANSNumber alloc] initWithFloat:value];
}

+ (OANSNumber *)numberWithDouble:(double)value
{
    return [[OANSNumber alloc] initWithDouble:value];
}

+ (OANSNumber *)numberWithBool:(BOOL)value
{
    return [[OANSNumber alloc] initWithBool:value];
}

+ (OANSNumber *)numberWithInteger:(NSInteger)value
{
    return [[OANSNumber alloc] initWithInteger:value];
}

+ (OANSNumber *)numberWithUnsignedInteger:(NSUInteger)value
{
    return [[OANSNumber alloc] initWithUnsignedInteger:value];
}



#pragma mark - Init Methods
- (instancetype)initWithChar:(char)value
{
    return [self initWithLongLong:value];
}

- (instancetype)initWithUnsignedChar:(unsigned char)value
{
    return [self initWithUnsignedLongLong:value];
}

- (instancetype)initWithShort:(short)value
{
    return [self initWithLongLong:value];
}

- (instancetype)initWithUnsignedShort:(unsigned short)value
{
    return [self initWithUnsignedLongLong:value];
}

- (instancetype)initWithInt:(int)value
{
    return [self initWithLongLong:value];
}

- (instancetype)initWithUnsignedInt:(unsigned int)value
{
    return [self initWithUnsignedLongLong:value];
}

- (instancetype)initWithLong:(long)value
{
    return [self initWithLongLong:value];
}

- (instancetype)initWithUnsignedLong:(unsigned long)value
{
    return [self initWithUnsignedLongLong:value];
}

- (instancetype)initWithLongLong:(long long)value
{
    _type = INT;
    _value.i = value;
    return self;
}

- (instancetype)initWithUnsignedLongLong:(unsigned long long)value
{
    _type = UINT;
    _value.u = value;
    return self;
}

- (instancetype)initWithFloat:(float)value
{
    return [self initWithDouble:value];
}

- (instancetype)initWithDouble:(double)value
{
    _type = DOUBLE;
    _value.d = value;
    return self;
}

- (instancetype)initWithBool:(BOOL)value
{
    return [self initWithLongLong:value];
}

- (instancetype)initWithInteger:(NSInteger)value
{
    return [self initWithLongLong:value];
}

- (instancetype)initWithUnsignedInteger:(NSUInteger)value
{
    return [self initWithUnsignedLongLong:value];
}

#pragma mark - Getter Methods
- (char)charValue
{
    RETURN();
}

- (unsigned char)unsignedCharValue
{
    RETURN();
}

- (short)shortValue
{
    RETURN();
}

- (unsigned short)unsignedShortValue
{
    RETURN();
}

- (int)intValue
{
    RETURN();
}

- (unsigned int)unsignedIntValue
{
    RETURN();
}

- (long)longValue
{
    RETURN();
}

- (unsigned long)unsignedLongValue
{
    RETURN();
}

- (long long)longLongValue
{
    RETURN();
}

- (unsigned long long)unsignedLongLongValue
{
    RETURN();
}

- (float)floatValue
{
    RETURN();
}

- (double)doubleValue
{
    RETURN();
}


- (BOOL)boolValue
{
    if (_type == INT) {
        return _value.i != 0;
    } else if (_type == UINT) {
        return _value.u != 0;
    } else {
        return _value.d != 0;
    }
}

- (NSInteger)integerValue
{
    RETURN();
}

- (NSUInteger)unsignedIntegerValue
{
    RETURN();
}

#pragma mark - String conversion and comparision
- (NSString *)stringValue
{
    return [self descriptionWithLocale:nil];
}

- (NSComparisonResult)compare:(OANSNumber *)otherNumber
{
    int selfType = _type;
    int otherType = otherNumber->_type;
    
    if (selfType > otherType) {
        return -[otherNumber compare:self];
    }
    
    if (selfType == INT) {
        if (otherType == INT) {
            COMPARE([self longLongValue], [otherNumber longLongValue]);
        } else if (otherType == UINT) {
            if ([self longLongValue] < 0) {
                return NSOrderedAscending;
            } else {
                COMPARE([self unsignedLongLongValue], [otherNumber unsignedLongLongValue]);
            }
        } else {
            double other = [otherNumber doubleValue];
            double longLongMaxPlusOne = LLONG_MAX + 1ULL;
            if (other >= longLongMaxPlusOne) {
                return NSOrderedAscending;
            }
            if (other < LLONG_MIN) {
                return NSOrderedDescending;
            }
            double pureIntegerStart = 1LL << DBL_MANT_DIG;
            if (other >= pureIntegerStart || other <= -pureIntegerStart) {
                COMPARE([self longLongValue], (long long)other);
            } else {
                COMPARE([self doubleValue], other);
            }
        }
    } else if (selfType == UINT) {
        if (otherType == UINT) {
            COMPARE([self unsignedLongLongValue], [otherNumber unsignedLongLongValue]);
        } else {
            double other = [otherNumber doubleValue];
            if (other < 0) {
                return NSOrderedDescending;
            }
            double unsignedLongLongMaxPlusOne = (double)(LLONG_MAX + 1ULL) * 2.0;
            if (other >= unsignedLongLongMaxPlusOne) {
                return NSOrderedAscending;
            }
            double pureIntegerStart = 1LL << DBL_MANT_DIG;
            if(other >= pureIntegerStart) {
                COMPARE([self unsignedLongLongValue], (unsigned long long)other);
            } else {
                COMPARE([self doubleValue], other);
            }
        }
    } else {
        COMPARE([self doubleValue], [otherNumber doubleValue]);
    }
}

- (BOOL)isEqualToNumber:(OANSNumber *)number
{
    return [self compare:number] == NSOrderedSame;
}

- (NSString *)descriptionWithLocale:(id)locale
{
    if (_type == INT) {
        return [[NSString alloc] initWithFormat:@"lld" locale:locale, _value.i];
    } else if (_type == UINT) {
        return [[NSString alloc] initWithFormat:@"llu" locale:locale, _value.u];
    } else {
        return [[NSString alloc] initWithFormat:@"f" locale:locale, _value.d];
    }
}

#pragma mark - NSObject
- (BOOL)isEqual:(id)other
{
    if (![other isKindOfClass:[OANSNumber class]]) {
        return NO;
    }
    
    return [self isEqualToNumber:other];
}

- (NSUInteger)hash
{
    if (_type != DOUBLE) {
        return [self unsignedIntegerValue];
    }
    
    if (_value.d == floor(_value.d)) {
        return [self unsignedIntegerValue];
    }
    
    if (isnan(_value.d)) {
        return 0;
    }
    
    if (_value.d == 0.0) {
        return 0;
    }
    
    return _value.u;
}

@end



























