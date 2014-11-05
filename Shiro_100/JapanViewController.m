//
//  JapanViewController.m
//  Shiro_100
//
//  Created by 寺内 信夫 on 2014/11/04.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import "JapanViewController.h"

@interface JapanViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView_Japan;

@property (weak, nonatomic) IBOutlet UIButton *button_1_Select;
@property (weak, nonatomic) IBOutlet UIButton *button_2_Select;
@property (weak, nonatomic) IBOutlet UIButton *button_3_Select;
@property (weak, nonatomic) IBOutlet UIButton *button_4_Select;
@property (weak, nonatomic) IBOutlet UIButton *button_5_Select;
@property (weak, nonatomic) IBOutlet UIButton *button_6_Select;

@end

@implementation JapanViewController

- (void)viewDidLoad
{

	[super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning
{

	[super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (IBAction)button_1_Select_Action:(id)sender
{
	
	UIAlertController *ac = [UIAlertController alertControllerWithTitle: @"Title"
																message: @"Message"
														 preferredStyle: UIAlertControllerStyleActionSheet];

	UIAlertAction *cancel = [UIAlertAction actionWithTitle: @"cancel"
													 style: UIAlertActionStyleCancel
												   handler: ^( UIAlertAction *action ) {
		//キャンセルが押された時の処理
	}];
	
	[ac addAction: cancel];
	
	NSMutableArray *actionArray = [@[] mutableCopy]; //どれをタップしたか記憶のため
	for ( int i = 0; i < 14 ; i ++ ) {
		
		UIAlertAction *sub = [UIAlertAction actionWithTitle: [NSString stringWithFormat: @"ボタン%zd", i]
													  style: UIAlertActionStyleDefault
													handler: ^( UIAlertAction *action ) {
			
			NSLog(@"%zd番目",[actionArray indexOfObject:action]);
			NSLog(@"タップされたタイトル:%@",action.title);
			
		}];
		
		[actionArray addObject:sub];
		
		[ac addAction:sub];
	
	}
	
	[self presentViewController: ac
					   animated: YES
					 completion: nil];

}

- (IBAction)button_2_Select_Action:(id)sender
{
	
}

- (IBAction)button_3_Select_Action:(id)sender
{
	
}

- (IBAction)button_4_Select_Action:(id)sender
{
	
}

- (IBAction)button_5_Select_Action:(id)sender
{
	
}

- (IBAction)button_6_Select_Action:(id)sender
{
	
}

@end
