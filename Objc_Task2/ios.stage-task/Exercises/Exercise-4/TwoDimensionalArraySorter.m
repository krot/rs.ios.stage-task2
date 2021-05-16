#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

NSInteger intSort(id num1, id num2, void *context)
{
    int v1 = [num1 intValue];
    int v2 = [num2 intValue];
    if (v1 < v2)
        return NSOrderedAscending;
    else if (v1 > v2)
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}

NSInteger strSort(id str1, id str2, void *context)
{
    
    return [str1 caseInsensitiveCompare:str2];
    
}

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSArray *numArray = @[];
    NSArray *strArray = @[];
    
    for (int i=0; i<[array count]; i++) {
        id item = [array objectAtIndex:i];
        if ([item isKindOfClass:[NSArray class]]) {
            for (int j=0; j<[item count]; j++) {
                
                id object = [item objectAtIndex:j];
                if ([object isKindOfClass:[NSNumber class]]) {
                    numArray = [numArray arrayByAddingObject:object];
                }
                else {
                    strArray = [strArray arrayByAddingObject:object];
                }
            }
        }
    }
    
    int strCount = [strArray count];
    int numCount = [numArray count];
    
    
    NSArray *sortedIntArray;
    NSArray *sortedStrArray;
    
    
    if (numCount>0) {
        sortedIntArray = [numArray sortedArrayUsingFunction:intSort context:NULL];
    }
    if (strCount>0) {
        sortedStrArray = [strArray sortedArrayUsingFunction:strSort context:NULL];
    }
    
    if (numCount == 0 && strCount>0) {
        return sortedStrArray;
    }
    if (numCount > 0 && strCount == 0) {
        return sortedIntArray;
    }
    if (numCount > 0 && strCount > 0) {
        NSArray *newSortedStrArray = @[];
        for (int i = [sortedStrArray count]-1; i>=0; i--) {
            newSortedStrArray = [newSortedStrArray arrayByAddingObject:sortedStrArray[i]];
        }
        return @[sortedIntArray, newSortedStrArray];
    }
    
    return @[];
    
}

@end
