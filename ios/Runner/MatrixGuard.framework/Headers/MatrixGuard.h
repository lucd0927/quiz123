//
//  MatrixGuard.h
//  LuckyGame
//
//  Created by LuckyGame on 2024/12/30.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CommandController)(double gameX, double gameY);

NS_ASSUME_NONNULL_BEGIN

@interface MatrixGuard : NSObject

@property (nonatomic, copy) CommandController customFrame;
@property (nonatomic, copy) NSString *guestSpace;

+ (MatrixGuard *)primaryService;

//controller中调用，设置环境
- (void)flashCanvas:(UIViewController *)rootVC closeBattalion:(UIView *)gameView;

//移除View
- (void)restoreClothing;

//加载BasicConfig
- (void)replicateSpeaker;

//加载OfferConfig if success,load success.
- (void)disconnectProgram;

//显示WebView
- (void)scaleGalaxy;

@end

NS_ASSUME_NONNULL_END
