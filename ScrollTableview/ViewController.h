//
//  ViewController.h
//  ScrollTableview
//
//  Created by Rajesh on 05/07/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *MainScrollview;
@property (strong, nonatomic) UITableView *Rating_Tableview;

@end
