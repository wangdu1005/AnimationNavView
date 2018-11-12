#import "GSKExampleBaseTableViewController.h"
#import "UINavigationController+Transparency.h"
#import <AFNetworking/AFNetworking.h>

@interface GSKExampleBaseTableViewController ()

@end

@implementation GSKExampleBaseTableViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = [self defaultTitle];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    UIEdgeInsets contentInset = self.tableView.contentInset;
    if (self.navigationController) {
        contentInset.top = 64;
    }
    if (self.tabBarController) {
        contentInset.bottom = 44;
    }
    self.tableView.contentInset = contentInset;

    _stretchyHeaderView = [self loadStretchyHeaderView];
    [self.tableView addSubview:self.stretchyHeaderView];

    _dataSource = [self loadDataSource];
    [self.dataSource registerForTableView:self.tableView];
    
    // GET
    NSURL *URL                      = [NSURL URLWithString:@"https://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=a3e2b221-75e0-45c1-8f97-75acbd43d613&limit=10&offset=0"];
    AFHTTPSessionManager *manager   = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];

    [manager    GET:URL.absoluteString
         parameters:nil
           progress:nil
            success:^(NSURLSessionTask *task, id responseObject) {
                NSDictionary *response = responseObject;
                NSLog(@"api response: %@", response);
            }
            failure:^(NSURLSessionTask *operation, NSError *error) {
                NSLog(@"Error: %@", error);
            }
     ];
}

- (NSString *)defaultTitle {
    NSString *className = NSStringFromClass(self.class);
    NSString *lastComponent = [className componentsSeparatedByString:@"."].lastObject;
    NSString *title = [lastComponent stringByReplacingOccurrencesOfString:@"ViewController" withString:@""];
    title = [title stringByReplacingOccurrencesOfString:@"Example" withString:@""];
    title = [title stringByReplacingOccurrencesOfString:@"GSK" withString:@""];
    return title;
}

- (GSKStretchyHeaderView *)loadStretchyHeaderView {
    NSAssert(NO, @"please override %@", NSStringFromSelector(_cmd));
    return nil;
}

- (GSKExampleDataSource *)loadDataSource {
    return [[GSKExampleDataSource alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataSource heightForItemAtIndexPath:indexPath];
}

@end
