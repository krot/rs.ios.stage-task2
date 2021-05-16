#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    NSInteger count = 0;
    
    for (int i=0; i< [array count]; i++) {
        
        for (int j=i; j < [array count]; j++) {
            
            if (i != j) {
                
                int diff = 0;
                if ([array[i] intValue] > [array[j] intValue]) {
                    diff = [array[i] intValue] - [array[j] intValue];
                }
                else {
                    diff = [array[j] intValue] - [array[i] intValue];
                }
                if (diff == [number intValue]) {
                    count++;
                }
            }
        }
    }
    
    return count;
}

@end
