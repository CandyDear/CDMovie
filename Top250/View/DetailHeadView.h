//
//  DetailHeadView.h
//  CDMovie
//
//  Created by mac04 on 15/8/30.
//  Copyright (c) 2015年 mac04. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailHeadView : UIView
@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *directorsLabel;
@property (strong, nonatomic) IBOutlet UILabel *actorsLabel;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;


@property(nonatomic,weak) UINavigationController *navigationController;
@end
