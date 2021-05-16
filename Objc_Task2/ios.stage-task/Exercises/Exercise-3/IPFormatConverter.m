#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    NSString *result = @"";
    
    if (numbersArray != nil) {
        
        int length = ([numbersArray count]>4) ? 4 : [numbersArray count];
        
        if (length > 0) {
            
            for(int i=0; i < 4; i++) {
                NSNumber *num;
                if (i < length) {
                    num = numbersArray[i];
                }
                else {
                    num = @0;
                }
                if ([num intValue] < 0) {
                    result = @"Negative numbers are not valid for input.";
                    break;
                }
                if ([num intValue] > 255) {
                    result = @"The numbers in the input array can be in the range from 0 to 255.";
                    break;
                }
                NSString *numStr = [num stringValue];
                result = [result stringByAppendingString: numStr];
                if (i<3) {
                    result = [result stringByAppendingString: @"."];
                }
            }
        }
    }
    return result;
}

@end
