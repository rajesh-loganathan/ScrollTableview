//
//  ViewController.m
//  ScrollTableview
//
//  Created by Rajesh on 05/07/14.
//  Copyright (c) 2014 Rajesh. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController ()
{
    NSArray *tableDataArray;
    UITextField *tableHeader_txt;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    tableDataArray = [[NSArray alloc]initWithObjects:@10,@20,@3,@2,@6, nil];
    tableHeader_txt= [[UITextField alloc] initWithFrame:CGRectMake(60, 10, 187, 24)];
    
	[self scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)scrollView
{
    int x = 10;
    int y = 10;
    for(int i=0; i<5; i++)
    {
        
        _Rating_Tableview =[[UITableView alloc]init];
        
        //-- Dynamic tableview height
        NSString *height = [tableDataArray objectAtIndex:i];
        if (height.intValue<7)
        {
            _Rating_Tableview.frame = CGRectMake(x, y, 300, height.intValue * 50);
        }
        else
        {
            _Rating_Tableview.frame = CGRectMake(x, y, 300, 6* 50);
        }
        
        _Rating_Tableview.dataSource=self;
        _Rating_Tableview.delegate=self;
        _Rating_Tableview.tag = i;
        _Rating_Tableview.scrollEnabled=YES;
        _Rating_Tableview.userInteractionEnabled=YES;
        _Rating_Tableview.separatorColor = [UIColor clearColor];
        
        //-- Tableborder
        _Rating_Tableview.layer.borderColor = [UIColor blackColor].CGColor;
        _Rating_Tableview.layer.borderWidth = 1.0f;
        _Rating_Tableview.layer.cornerRadius = 5.0f;
        
        _Rating_Tableview.backgroundColor = [UIColor greenColor];
        [_MainScrollview addSubview:_Rating_Tableview];
        x=x+310;
    }
    _MainScrollview.contentSize = CGSizeMake(x,300);
}

//-- Tableview delegate properties

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *rows = [tableDataArray objectAtIndex:tableView.tag];
    switch (tableView.tag)
    {
        case 0:
            return rows.intValue;
            break;
        case 1:
            return rows.intValue;
            break;
        case 2:
            return rows.intValue;
            break;
        case 3:
            return rows.intValue;
            break;
        case 4:
            return rows.intValue;
            break;
        default:
            return 10;
            break;
    }
}
/*
-(CGFloat) tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    _Rating_Tableview.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 0)];
    _Rating_Tableview.tableHeaderView.userInteractionEnabled = NO;

    [tableHeader_txt setFont:[UIFont boldSystemFontOfSize:20]];
    tableHeader_txt.text = @"Select Your Rating";
    tableHeader_txt.delegate = self;
    tableHeader_txt.clipsToBounds = YES;
    [tableHeader_txt.layer setBackgroundColor: [[UIColor lightGrayColor] CGColor]];
    [tableHeader_txt.layer setMasksToBounds:YES];
    _Rating_Tableview.tableHeaderView.backgroundColor = [UIColor lightGrayColor];
    [_Rating_Tableview.tableHeaderView addSubview:tableHeader_txt];
    return _Rating_Tableview.tableHeaderView;
}
 */

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib=nil;
        nib  = [[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.textLabel.text = @"Hello";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"\n\n Table view tag = %d ", tableView.tag);
    NSLog(@"\n Table Row = %d ", indexPath.row);
    // Your custom operation
}

@end
