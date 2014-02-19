//
//  PooViewController.m
//  Rubber
//
//  Created by crazypoo on 14-2-19.
//  Copyright (c) 2014年 crazypoo. All rights reserved.
//

#import "PooViewController.h"
#import "PooRubberTouchViewController.h"

@interface PooViewController ()
@property (nonatomic, retain)UITableView *rubberTableView;
@property (nonatomic, retain)PooRubberTouchViewController *rubber;
@property (nonatomic,retain) CATransition *lastAnimation;

@end

@implementation PooViewController
@synthesize rubberTableView = _rubberTableView;
@synthesize rubber = _rubber;
@synthesize lastAnimation;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.rubberTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.rubberTableView.delegate = self;
    self.rubberTableView.dataSource = self;
    [self.view addSubview:self.rubberTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *searchIdentifier = @"search Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:searchIdentifier];
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:searchIdentifier
                 ];
        
    }
    NSString *imagename = [NSString stringWithFormat:@"%ld.png",(long)indexPath.row];
    cell.imageView.image = [UIImage imageNamed:imagename];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    CATransition *animation = [CATransition animation];
//    animation.delegate = self;
//    animation.duration = 0.7;
//    animation.timingFunction = UIViewAnimationCurveEaseInOut;
//    animation.type = @"rippleEffect";
//    [[self.view layer] addAnimation:animation forKey:@"animation"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backhome) name:@"backhome" object:[UIApplication sharedApplication]];
    self.rubber = [[PooRubberTouchViewController alloc] init];
    self.rubber.imagenumber = indexPath.row;
//    self.rubber.modalPresentationStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:self.rubber animated:YES completion:nil];
}

- (void)backhome{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.rubberTableView reloadData];
    [self.view reloadInputViews];
}

@end
