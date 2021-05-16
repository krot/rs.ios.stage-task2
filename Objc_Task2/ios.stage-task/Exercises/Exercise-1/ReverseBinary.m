#import "ReverseBinary.h"


UInt8 ReverseInteger(UInt8 n) {

    UInt8 bits[4] = {1, 2, 4, 8};
    UInt8 revBits[4] = {8, 4, 2, 1};
    
    UInt8 left = (n & (15 << 4)) >> 4;
    UInt8 right = n & 15;

    UInt8 leftRes = 0;
    UInt8 rightRes = 0;
    
    for(int i=0; i<4; i++) {
        if ((left & bits[i]) == bits[i]) {
            leftRes = leftRes | revBits[i];
        }
        if ((right & bits[i]) == bits[i]) {
            rightRes = rightRes | revBits[i];
        }
    }
    
    return (rightRes << 4) | leftRes;
    
}
