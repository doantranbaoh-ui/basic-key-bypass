#import <substrate.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
@interface BK:NSObject
-(void)checkKey:(id)k;
-(void)paid:(void(^)(void))c;
-(BOOL)checkLicense;
-(BOOL)isLicenseValid;
-(void)exitApp;
-(int)keyAttempts;
-(BOOL)isBlocked;
-(BOOL)isJailbroken;
-(BOOL)isCracked;
@end
%hook BK
-(void)checkKey:(id)k{}
-(void)paid:(void(^)(void))c{if(c)c();}
-(BOOL)checkLicense{return YES;}
-(BOOL)isLicenseValid{return YES;}
-(void)exitApp{}
-(int)keyAttempts{return 0;}
-(BOOL)isBlocked{return NO;}
-(BOOL)isJailbroken{return NO;}
-(BOOL)isCracked{return NO;}
%end
static id(*od)(id,SEL,id,void(^)(id,id,id));
static id nd(id s,SEL _,id r,void(^h)(id,id,id)){NSString*u=[[r URL]absoluteString];if([u containsString:@"getbasic.link"]||[u containsString:@"basic-key"]){NSDictionary*f=@{@"success":@YES,@"status":@"active"};id d=[NSJSONSerialization dataWithJSONObject:f options:0 error:nil];id resp=[[NSHTTPURLResponse alloc]initWithURL:[r URL]statusCode:200 HTTPVersion:@"HTTP/1.1"headerFields:@{}];if(h)h(d,resp,nil);return nil;}return od?od(s,_,r,h):nil;}
%ctor{%init;Class c=objc_getClass("NSURLSession");if(c)MSHookMessageEx(c,@selector(dataTaskWithRequest:completionHandler:),(IMP)&nd,(IMP*)&od);NSLog(@"[BK] OK");}
