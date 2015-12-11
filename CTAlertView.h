//
//  KSAlertView.h
//
//
//  Created by Kevin San on 15-12-11.
//

#import <Foundation/Foundation.h>

#define kMessageOkButtonTitle @"确认"
#define IMP_BLOCK_SELF(type) __weak type *block_self=self;
/**
 判断字符串不为空并且不为空字符串
 @param str : 要判断的字符串
 @return 返回BOOL表示结果
 */
UIKIT_STATIC_INLINE BOOL StringNotNullAndEmpty(NSString* str)
{
    return ((NSNull *)str!=[NSNull null] && str!=nil&&![str isEqualToString:@""]);
}
typedef     void (^ClickButtonAtIndex)(UIAlertView* alert,int index);
@interface KSAlertView : NSObject<UIAlertViewDelegate>
{
    __block int index;
}

+ (KSAlertView *)shareCTAlert;
- (void)show;
@property (nonatomic,copy) ClickButtonAtIndex clickButtonAtIndex;
@property (nonatomic,strong) UIAlertView *alertView;
@property (nonatomic,strong) UIAlertController *alertController;

///使用块语句初始化一个alertView
-(id)initWithTitle:(NSString *)title message:(NSString *)message DelegateBlock:(void(^)(UIAlertView *alert,int index))block cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles;
///初始化一个三个参数的alertview
-(id)initWithTitle:(NSString *)title message:(NSString *)message DelegateBlock:(void(^)(UIAlertView *alert,int index))block cancelButtonTitle:(NSString *)cancelButtonTitle otherTitle1:(NSString *)title1 otherTitle2:(NSString *)title2;

-(id)initWithTitle:(NSString *)title message:(NSString *)message DelegateBlock:(void(^)(UIAlertView *alert,int index))block cancelButtonTitle:(NSString *)cancelButtonTitle otherTitle1:(NSString *)title1 otherTitle2:(NSString *)title2 otherTitle3:(NSString *)title3;

+(void)AlertShow:(NSString*)title message:(NSString *)message DelegateBlock:(void(^)(UIAlertView *alert,int index))block cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles;

+(void)AlertShow:(NSString*)message;

+(void)AlertShow:(NSString*)title message:(NSString*)message;

+(void)AlertShow:(NSString *)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle;

+(void)AlertShow:(NSString *)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle otherButtonTitle:(NSString*)otherButtonTitle;

@end