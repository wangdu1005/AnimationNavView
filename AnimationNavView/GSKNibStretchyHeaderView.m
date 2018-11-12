#import "GSKNibStretchyHeaderView.h"
#import <GSKStretchyHeaderView/GSKGeometry.h>

static const BOOL kNavBar = YES;

@interface GSKNibStretchyHeaderView ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *userAssetsLabel;
@property (weak, nonatomic) IBOutlet UILabel *navigationTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundBottomImageView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *accountSwitchSegmented;
@end

@implementation GSKNibStretchyHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];

    UIColor *bgColor = [UIColor colorWithRed:113.0f/255.0f
                                       green:210.0f/255.0f
                                        blue:105.0f/255.0f
                                       alpha:1.0f];
    self.contentView.backgroundColor = bgColor;
    self.expansionMode = GSKStretchyHeaderViewExpansionModeImmediate;
    if (kNavBar) {
        self.minimumContentHeight = 80;
    } else {
        self.navigationTitleLabel.hidden = YES;
    }
}

- (void)didChangeStretchFactor:(CGFloat)stretchFactor {

    CGFloat alpha = CGFloatTranslateRange(stretchFactor, 0.3, 0.6, 0, 1);
    alpha = MAX(0, MIN(1, alpha));
    
    NSLog(@"stretchFactor: %.2f", stretchFactor);
    
    CGFloat alpha2 = CGFloatTranslateRange(stretchFactor, 0.3, 1, 0, 1);
    alpha2 = MAX(0, MIN(1, alpha2));
    
    NSLog(@"alpha2: %.2f", alpha2);

    self.userAssetsLabel.alpha = alpha;
    self.accountSwitchSegmented.alpha = alpha2;

    if (kNavBar) {
        self.backgroundImageView.alpha = alpha;

        CGFloat navTitleFactor = 0.4;
        CGFloat navTitleAlpha = 0;
        if (stretchFactor < navTitleFactor) {
            navTitleAlpha = CGFloatTranslateRange(stretchFactor, 0, navTitleFactor, 1, 0);
        }

//        NSLog(@"%.2f", navTitleAlpha);
        self.navigationTitleLabel.alpha = navTitleAlpha;
    }
}


@end
