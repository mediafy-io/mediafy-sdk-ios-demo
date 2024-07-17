/*
 * Mediafy SDK
 *
 * Copyright 2024 Mars Technologies Ltd. All rights reserved.
 */

#import <UIKit/UIKit.h>
#import "IntegrationCasesViewController.h"
#import "IntegrationAdFormat.h"
#import "IntegrationAdFormatDescriptor.h"
#import "IntegrationKind.h"
#import "IntegrationKindDescriptor.h"
#import "IntegrationCase.h"
#import "IntegrationCaseManager.h"

NSString * const cellID = @"IntegrationCaseCell";

@interface IntegrationCasesViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *integrationKindPicker;
@property (weak, nonatomic) IBOutlet UIButton *adFormatPicker;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) IntegrationKind currentIntegrationKind;
@property (nonatomic) IntegrationAdFormat currentAdFormat;
@property (nonatomic) NSString *filterText;
@property (nonatomic) NSArray<IntegrationCase *> *displayedCases;

@end

@implementation IntegrationCasesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchBar.delegate = self;
    
    self.displayedCases = IntegrationCaseManager.allCases;
    
    [self setupPickers];
}

// MARK: - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.displayedCases.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    UIListContentConfiguration *configuration = cell.defaultContentConfiguration;
    configuration.text = self.displayedCases[indexPath.row].title;
    cell.contentConfiguration = configuration;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    IntegrationCase * testCase = self.displayedCases[indexPath.row];
    
    UIViewController * viewController = testCase.configurationClosure();
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.title = testCase.title;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

// MARK: - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    self.filterText = searchBar.text ? : @"";
    [self filterTestCases];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    self.filterText = searchBar.text ? : @"";
    [self filterTestCases];
    [searchBar endEditing:YES];
}

- (void)filterTestCases {
    self.displayedCases = [[NSMutableArray alloc] init];
    
    self.displayedCases = [IntegrationCaseManager.allCases filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(IntegrationCase * _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return self.filterText.length == 0 || [evaluatedObject.title rangeOfString:self.filterText options:NSCaseInsensitiveSearch].length > 0;
    }]];
    
    self.displayedCases = [self.displayedCases filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(IntegrationCase * _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return self.currentIntegrationKind == IntegrationKindAll ? true : evaluatedObject.integrationKind == self.currentIntegrationKind;
    }]];
    
    self.displayedCases = [self.displayedCases filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(IntegrationCase * _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return self.currentAdFormat == IntegrationAdFormatAll ? true : evaluatedObject.adFormat == self.currentAdFormat;
    }]];
    
    [self.tableView reloadData];
}

- (void)setupPickers {
    UIAction * allIntegrationKindsAction = [UIAction actionWithTitle:@"All" image:nil identifier:nil handler:^(__kindof UIAction * _Nonnull action) {
        self.currentIntegrationKind = IntegrationKindAll;
        [self filterTestCases];
    }];
    
    NSMutableArray<UIAction *> * integrationKindActions = [[NSMutableArray alloc] initWithObjects:allIntegrationKindsAction, nil];
    
    for (int i = 0; i < IntegrationKindAll; ++i) {
        [integrationKindActions addObject:[UIAction actionWithTitle:[IntegrationKindDescriptor getDescriptionForIntegrationKind:(IntegrationKind)i] image:nil identifier:nil handler:^(__kindof UIAction * _Nonnull action) {
            self.currentIntegrationKind = (IntegrationKind)i;
            [self filterTestCases];
        }]];
    }
    
    self.integrationKindPicker.showsMenuAsPrimaryAction = YES;
    self.integrationKindPicker.changesSelectionAsPrimaryAction = YES;
    
    integrationKindActions.firstObject.state = UIMenuElementStateOn;
    
    UIMenu *integrationKindMenu = [UIMenu menuWithChildren:integrationKindActions];
    self.integrationKindPicker.menu = integrationKindMenu;
    
    UIAction * allAdFormatsAction = [UIAction actionWithTitle:@"All" image:nil identifier:nil handler:^(__kindof UIAction * _Nonnull action) {
        self.currentAdFormat = IntegrationAdFormatAll;
        [self filterTestCases];
    }];
    
    NSMutableArray<UIAction *> * adFormatsActions = [[NSMutableArray alloc] initWithObjects:allAdFormatsAction, nil];
    
    for (int i = 0; i < IntegrationAdFormatAll; ++i) {
        [adFormatsActions addObject:[UIAction actionWithTitle:[IntegrationAdFormatDescriptor getDescriptionForAdFormat:(IntegrationAdFormat)i] image:nil identifier:nil handler:^(__kindof UIAction * _Nonnull action) {
            self.currentAdFormat = (IntegrationAdFormat)i;
            [self filterTestCases];
        }]];
    }
    
    self.adFormatPicker.showsMenuAsPrimaryAction = YES;
    self.adFormatPicker.changesSelectionAsPrimaryAction = YES;
    
    adFormatsActions.firstObject.state = UIMenuElementStateOn;
    
    UIMenu *adFormatMenu = [UIMenu menuWithChildren:adFormatsActions];
    self.adFormatPicker.menu = adFormatMenu;
    
    self.currentIntegrationKind = IntegrationKindAll;
    self.currentAdFormat = IntegrationAdFormatAll;
    [self filterTestCases];
}

@end
