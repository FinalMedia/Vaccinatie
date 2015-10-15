//
//  UIImage+UIImageExtension.m
//  Vaccincatie
//
//  Created by Mark Westenberg on 15-10-15.
//  Copyright © 2015 Mark Westenberg. All rights reserved.
//

#import "UIImage+UIImageExtension.h"

@implementation UIImage (UIImageExtension)


+ (UIImage *) imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
