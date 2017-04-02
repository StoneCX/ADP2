//
//  UIColor+MCColor.m
//  ADPower
//
//  Created by chengxc on 2016/10/29.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "UIColor+MCColor.h"

@implementation UIColor (MCColor)


+ (instancetype)colorWithHexadecimal:(NSString *)Hex{
    
    //删除字符串中的空格并转为大写
    NSString *colorString = [[Hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    //非法字符串直接返回clearColor
    if(colorString.length <= 6) return [UIColor clearColor];
    
    //以0x开头则从下标为2开始取
    if([colorString hasPrefix:@"0X"] || [colorString hasPrefix:@"0x"]){
        colorString = [colorString substringFromIndex:2];
    }
    
    //以#开头则从下标为1开始取
    if([colorString hasPrefix:@"#"]){
        colorString = [colorString substringFromIndex:1];
    }
    
    //取完字符串不为6，返回clearColor
    if(colorString.length != 6) return [UIColor clearColor];
    
    //取出R G B 字符 再转为数字
    
    NSRange aRange;
    aRange.location = 0;
    aRange.length = 2;
    
    NSString *RString = [colorString substringWithRange:aRange];
    
    aRange.location = 2;
    NSString *GString = [colorString substringWithRange:aRange];
    
    aRange.location = 4;
    NSString *BString = [colorString substringWithRange:aRange];
    
    unsigned int r,g,b;
    [[NSScanner scannerWithString:RString] scanHexInt:&r];
    [[NSScanner scannerWithString:GString] scanHexInt:&g];
    [[NSScanner scannerWithString:BString] scanHexInt:&b];
    
    return [UIColor colorWithRed:(float)r/255.0 green:(float)g/255.0 blue:(float)b/255.0 alpha:1.0];
    

    
}

@end
