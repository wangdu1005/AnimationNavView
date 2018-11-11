#import "GSKExampleDataCell.h"
#import "UIView+GSKLayoutHelper.h"

@interface GSKExampleDataCell ()
@property (nonatomic) UIButton *titleButton;
@property (nonatomic) UIButton *tableViewControllerButton;
@end

@implementation GSKExampleDataCell

+ (NSString *)reuseIdentifier {
    return NSStringFromClass(self);
}

+ (void)registerIn:(UITableView *)tableView {
    [tableView registerClass:self
      forCellReuseIdentifier:[self reuseIdentifier]];
}

+ (CGFloat)height {
    return 60;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.titleButton = [[UIButton alloc] init];
    [self configureButton:self.titleButton];
    
    self.tableViewControllerButton = [[UIButton alloc] init];
    [self.tableViewControllerButton setTitle:@"木柵動物園"
                                    forState:UIControlStateNormal];
    [self configureButton:self.tableViewControllerButton];
}

- (void)configureButton:(UIButton *)button {
    [button setTitleColor:[UIColor blueColor]
                 forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor]
                 forState:UIControlStateDisabled];
    [button addTarget:self
               action:@selector(didTapButton:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button];
}

- (void)setData:(GSKExampleData *)data {
    _data = data;
    [self.titleButton setTitle:data.title forState:UIControlStateNormal];
    
    self.titleButton.enabled = NO;
    self.tableViewControllerButton.hidden = NO;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.data.viewControllerClass) {
        self.titleButton.frame = self.bounds;
    } else {
        CGFloat buttonHeight = self.height / 2;
        
        self.titleButton.width = self.width;
        self.titleButton.height = buttonHeight;
        
        float X_Co = (self.frame.size.width - (self.width / 2))/2;
//        float Y_Co = (self.frame.size.height - buttonHeight)/2;
        [self.tableViewControllerButton setFrame:CGRectMake(X_Co, buttonHeight, self.width / 2, buttonHeight)];

    }
}

- (void)didTapButton:(id)sender {
    if (sender == self.tableViewControllerButton) {
        [self.delegate exampleDataCellDidTapTableViewButton:self];
    }
}

@end
