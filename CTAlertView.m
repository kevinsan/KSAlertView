//
//  KSAlertView.m
//  huizon
//
//  Created by Kevin San on 13-11-8.
//

#import "KSAlertView.h"

@implementation KSAlertView


+ (KSAlertView *)shareCTAlert
{
    static KSAlertView * singleClient;
    static dispatch_once_t pred;
    dispatch_once(&pred,^{
        singleClient=[[KSAlertView alloc] initManager];
    } );
    return singleClient;
}

- (id)initManager
{
    if (self=[super init]) {
        
    }
    return self;
}

//使用块语句初始化一个AlertView
-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message DelegateBlock:(void (^)(UIAlertView *alert,int index))block cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles
{
    IMP_BLOCK_SELF(CTAlertView)
    self.clickButtonAtIndex=nil;
    if (isIOS8) {
        if (self.alertController!=nil) {
            //移除前一个
            [self.alertController dismissViewControllerAnimated:NO completion:nil];
            self.alertController = nil;
        }
        self.clickButtonAtIndex = block;
        self.alertController = [UIAlertController alertControllerWithTitle:StringIsNullRetBlank(title)  message:message preferredStyle:UIAlertControllerStyleAlert];
        
        if (StringNotNullAndEmpty(cancelButtonTitle)) {
            // Create the actions.
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:StringIsNullRetBlank(cancelButtonTitle) style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                index = 0;
                if (block_self.clickButtonAtIndex) {
                    block_self.clickButtonAtIndex(nil,index);
                    block_self.clickButtonAtIndex=nil;
                }
            }];
            [self.alertController addAction:cancelAction];
        }
        
        if (StringNotNullAndEmpty(otherButtonTitles)){
            //如果第二个button不为空
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitles style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                index = 1;
                if (block_self.clickButtonAtIndex) {
                    block_self.clickButtonAtIndex(nil,index);
                    block_self.clickButtonAtIndex=nil;
                }
            }];
            // Add the actions.
            [self.alertController addAction:otherAction];
        }
    }else{
        if (self.alertView!=nil) {
            //移除前一个
            self.alertView.delegate = nil;
            [self.alertView dismissWithClickedButtonIndex:0 animated:NO];
            self.alertView = nil;
        }
        self.clickButtonAtIndex = block;
        if (StringNotNullAndEmpty(otherButtonTitles)) {
            self.alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles,nil];
        }else {
            self.alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
        }
    }
    return self;
}

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message DelegateBlock:(void(^)(UIAlertView *alert,int index))block cancelButtonTitle:(NSString *)cancelButtonTitle otherTitle1:(NSString *)title1 otherTitle2:(NSString *)title2
{
    IMP_BLOCK_SELF(CTAlertView)
    self.clickButtonAtIndex=nil;
    if (isIOS8) {
        if (self.alertController!=nil) {
            //移除前一个
            [self.alertController dismissViewControllerAnimated:NO completion:nil];
            self.alertController = nil;
        }
        self.clickButtonAtIndex = block;
        self.alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        // Create the actions.
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            index = 0;
            if (block_self.clickButtonAtIndex) {
                block_self.clickButtonAtIndex(nil,index);
                block_self.clickButtonAtIndex=nil;
            }
        }];
        [self.alertController addAction:cancelAction];
        if (StringNotNullAndEmpty(title1)&&StringNotNullAndEmpty(title2)) {
            //如果第二三个button不为空
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:title1 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                index = 1;
                if (block_self.clickButtonAtIndex) {
                    block_self.clickButtonAtIndex(nil,index);
                    block_self.clickButtonAtIndex=nil;
                }
            }];
            // Add the actions.
            [self.alertController addAction:otherAction];
            
            UIAlertAction *otherActionTwo = [UIAlertAction actionWithTitle:title2 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                index = 2;
                if (block_self.clickButtonAtIndex) {
                    block_self.clickButtonAtIndex(nil,index);
                    block_self.clickButtonAtIndex=nil;
                }
            }];
            // Add the actions.
            [self.alertController addAction:otherActionTwo];
        }
    }else{
        if (self.alertView!=nil) {
            //移除前一个
            self.alertView.delegate = nil;
            [self.alertView dismissWithClickedButtonIndex:0 animated:NO];
            self.alertView = nil;
        }
        self.clickButtonAtIndex = block;
        if (StringNotNullAndEmpty(title1)&&StringNotNullAndEmpty(title2)) {
            self.alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:title1,title2,nil];
        }else {
            self.alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
        }
    }
    return self;
}

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message DelegateBlock:(void(^)(UIAlertView *alert,int index))block cancelButtonTitle:(NSString *)cancelButtonTitle otherTitle1:(NSString *)title1 otherTitle2:(NSString *)title2 otherTitle3:(NSString *)title3
{
    IMP_BLOCK_SELF(CTAlertView)
    self.clickButtonAtIndex=nil;
    if (isIOS8) {
        if (self.alertController!=nil) {
            //移除前一个
            [self.alertController dismissViewControllerAnimated:NO completion:nil];
            self.alertController = nil;
        }
        self.clickButtonAtIndex = block;
        self.alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        // Create the actions.
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            index = 0;
            if (block_self.clickButtonAtIndex) {
                block_self.clickButtonAtIndex(nil,index);
                block_self.clickButtonAtIndex=nil;
            }
        }];
        [self.alertController addAction:cancelAction];
        if (StringNotNullAndEmpty(title1)&&StringNotNullAndEmpty(title2)&&StringNotNullAndEmpty(title3)) {
            //如果第二三四个button不为空
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:title1 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                index = 1;
                if (block_self.clickButtonAtIndex) {
                    block_self.clickButtonAtIndex(nil,index);
                    block_self.clickButtonAtIndex=nil;
                }
            }];
            // Add the actions.
            [self.alertController addAction:otherAction];
            
            UIAlertAction *otherActionTwo = [UIAlertAction actionWithTitle:title2 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                index = 2;
                if (block_self.clickButtonAtIndex) {
                    block_self.clickButtonAtIndex(nil,index);
                    block_self.clickButtonAtIndex=nil;
                }
            }];
            // Add the actions.
            [self.alertController addAction:otherActionTwo];
            
            UIAlertAction *otherActionThree = [UIAlertAction actionWithTitle:title3 style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                index = 3;
                if (block_self.clickButtonAtIndex) {
                    block_self.clickButtonAtIndex(nil,index);
                    block_self.clickButtonAtIndex=nil;
                }
            }];
            // Add the actions.
            [self.alertController addAction:otherActionThree];
        }
    }else{
        if (self.alertView!=nil) {
            //移除前一个
            self.alertView.delegate = nil;
            [self.alertView dismissWithClickedButtonIndex:0 animated:NO];
            self.alertView = nil;
        }
        self.clickButtonAtIndex = block;
        if (StringNotNullAndEmpty(title1)&&StringNotNullAndEmpty(title2)&&StringNotNullAndEmpty(title3)) {
            self.alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:title1,title2,title3,nil];
        }else {
            self.alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
        }
    }
    return self;
}

+(void)AlertShow:(NSString*)title message:(NSString *)message DelegateBlock:(void(^)(UIAlertView *alert,int index))block cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles
{
    //    [[UIApplication sharedApplication] keyWindow].windowLevel=UIWindowLevelStatusBar;
    CTAlertView *alert=[[CTAlertView shareCTAlert] initWithTitle:title message:message DelegateBlock:block cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles];
    [alert show];
}

+(void)AlertShow:(NSString*)message
{
    [CTAlertView AlertShow:nil message:message DelegateBlock:^(UIAlertView *alert,int index){
        
    }cancelButtonTitle:kMessageOkButtonTitle otherButtonTitles:nil];
}

+(void)AlertShow:(NSString*)title message:(NSString*)message
{
    [CTAlertView AlertShow:title
                     message:message
               DelegateBlock:^(UIAlertView *alert,int index){
                   
               }
           cancelButtonTitle:kMessageOkButtonTitle
           otherButtonTitles:nil];
}

+(void)AlertShow:(NSString *)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle
{
    [CTAlertView AlertShow:title message:message DelegateBlock:^(UIAlertView *alert,int index){
        
    }cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
}
+(void)AlertShow:(NSString *)title message:(NSString*)message cancelButtonTitle:(NSString*)cancelButtonTitle otherButtonTitle:(NSString*)otherButtonTitle
{
    [CTAlertView AlertShow:title
                     message:message
               DelegateBlock:^(UIAlertView *alert,int index){
                   
               }
           cancelButtonTitle:cancelButtonTitle
           otherButtonTitles:otherButtonTitle];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    index=(int)buttonIndex;
    if (self.clickButtonAtIndex) {
        self.clickButtonAtIndex(self.alertView,index);
        self.clickButtonAtIndex=nil;
    }
}

- (void)show{
    if (isIOS8) {
        if (self.alertController != nil) {
            [[theApp topViewController] presentViewController:self.alertController animated:YES completion:nil];
        }
    }else{
        if (self.alertView != nil) {
            [self.alertView show];
        }
    }
}

@end
