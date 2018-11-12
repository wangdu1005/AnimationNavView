#import "GSKExampleDataSource.h"
#import "ANVTableViewCell.h"

@interface GSKExampleDataSource ()
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic) NSMutableArray<NSNumber *> *rowHeights;
@end

@implementation GSKExampleDataSource

- (instancetype)init {
    self = [super init];
    if (self) {
        _displaysSectionHeaders = false;
        _numberOfSections = 1;
        _numberOfRowsInEverySection = kDefaultNumberOfRows;
        [self updateRowHeights];
        self.cellColors = @[[UIColor grayColor], [UIColor lightGrayColor]];
    }
    return self;
}

- (void)setNumberOfRowsInEverySection:(NSUInteger)numberOfRowsInEverySection {
    _numberOfRowsInEverySection = numberOfRowsInEverySection;
    [self updateRowHeights];
}

- (void)registerForTableView:(UITableView *)tableView {
    _scrollView = tableView;
    
    tableView.dataSource = self;
//    [GSKTableViewCell registerIn:tableView];
//    UINib *cellNib = [UINib nibWithNibName:@"ANVTableViewCell" bundle:nil];
//    [tableView registerNib:cellNib forCellReuseIdentifier:@"Cell"];
}

- (void)updateRowHeights {
    self.rowHeights = [NSMutableArray arrayWithCapacity:self.numberOfRowsInEverySection];
    for (NSUInteger i = 0; i < self.numberOfRowsInEverySection; ++i) {
        CGFloat height = 40 + arc4random_uniform(160);
        [self.rowHeights addObject:@(height)];
    }
}

#pragma mark - table view

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self titleForSection:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberOfRowsInEverySection;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ANVTableViewCell *cell = (ANVTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"ANVTableViewCell" owner:self options:nil];
    if(cell == nil) {
        cell = nibs[0];
    }

    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.nameLabel.text = @"Hello world";
    cell.locationLabel.text = @"homehomehome";
    cell.textViewHightConstraint.constant = 500;
    
    return cell;
}

#pragma mark - generic

- (CGFloat)heightForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return [self.rowHeights[indexPath.item] floatValue];
    return 500;
}

- (NSString *)titleForSection:(NSInteger)section {
    return self.displaysSectionHeaders ? [NSString stringWithFormat:@"Section #%@", @(section)] : nil;
}

@end
