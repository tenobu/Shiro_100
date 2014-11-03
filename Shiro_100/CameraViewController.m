//
//  CameraViewController.m
//  Shiro_100
//
//  Created by 寺内 信夫 on 2014/11/02.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (retain, nonatomic) UIDocumentInteractionController *dic;

@end

@implementation CameraViewController

- (void)viewDidLoad
{

	[super viewDidLoad];
    // Do any additional setup after loading the view.

	[NSTimer scheduledTimerWithTimeInterval: 0.1f
									 target: self
								   selector: @selector( button_Camera_Action: )
								   userInfo: nil
									repeats: NO];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void)viewWillAppear:(BOOL)animated
{
	
}

- (void)viewDidAppear:(BOOL)animated
{
	
}

- (void)viewWillDisappear:(BOOL)animated
{
	
}

- (void)viewDidDisappear:(BOOL)animated
{
	
}

- (IBAction)button_Camera_Action:(id)sender
{
	
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	
	picker.delegate = self;
	
	picker.sourceType    = UIImagePickerControllerSourceTypeCamera;
	picker.allowsEditing = YES;
	
	[self presentViewController: picker animated: YES completion: nil];
	
}

- (IBAction)button_Regist_Action:(id)sender
{

	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	
	picker.delegate = self;
	
	picker.sourceType    = UIImagePickerControllerSourceTypePhotoLibrary;
	picker.allowsEditing = YES;
	
	[self presentViewController: picker animated: YES completion: nil];
	
}

- (void)imagePickerController: (UIImagePickerController *)picker
didFinishPickingMediaWithInfo: (NSDictionary *)info
{
	
	UIImage *chImage = info [UIImagePickerControllerOriginalImage];
	
	CGImageRef cgRef = chImage.CGImage;
	
	chImage = [[UIImage alloc] initWithCGImage: cgRef
										 scale: 1.0
								   orientation: UIImageOrientationUp];
	
	[self.imageView setImage: chImage];
	
	[picker dismissViewControllerAnimated: YES completion: nil];
	
	[self performSelector: @selector( shareInstagram ) withObject: self afterDelay: 1.0f];
	
}

- (void)imagePickerControllerDidCancel: (UIImagePickerController *)picker
{
	
	[picker dismissViewControllerAnimated: YES completion: nil];
	
}

- (void)shareInstagram
{
	
	UIImage *image = self.imageView.image;
	
	NSURL *instagramURL = [NSURL URLWithString: @"instagram://app"];
	
	if ( ! [[UIApplication sharedApplication] canOpenURL: instagramURL] ) {
		
		NSLog( @"Instagramがインストールされていない" );
		
		return;
		
	}
	
	NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent: @"Documents/image.igo"];
	
	NSURL *fileURL = [NSURL fileURLWithPath: filePath];
	
	[UIImagePNGRepresentation(image) writeToFile: filePath atomically: YES];
	
	//	CGRect rect = CGRectMake( 0, 0, 0, 0 );
	//	NSString *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent: @"Documents/image.ig"];
	//	NSURL *igImageHookFile = [[NSURL alloc] initWithString: [NSString stringWithFormat: @"file://%@", jpgPath]];
	
	self.dic = [UIDocumentInteractionController interactionControllerWithURL: fileURL];
	
	self.dic.annotation = [NSDictionary dictionaryWithObject: @"#私のマックブックプロ #IntelCore7"
													  forKey: @"InstagramCaption"];
	
	self.dic.delegate = self;
	
	BOOL present = [self.dic presentOpenInMenuFromRect: self.view.frame
												inView: self.view
											  animated: YES];
	
	if ( ! present ) {
		
		NSLog(@"このファイルを開けるアプリが存在しない。");
		
	}
	
	
	
	//	NSString *savePath = [NSHomeDirectory() stringByAppendingPathComponent: @"Documents/Test.ig"];
	//
	//	[UIImagePNGRepresentation(image) writeToFile: savePath atomically: YES];
	//
	//	CGRect rect = CGRectMake( 0, 0, 0, 0 );
	//	NSString *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent: @"Documents/Test.ig"];
	//	NSURL *igImageHookFile = [[NSURL alloc] initWithString: [NSString stringWithFormat: @"file://%@", jpgPath]];
	//
	//	self.dic.UTI = @"com.instagran.photo";
	//	self.dic = [self setupControllerWithURL: igImageHookFile usingDelegate: self];
	//	self.dic = [UIDocumentInteractionController interactionControllerWithURL: igImageHookFile];
	//
	//	[self.dic presentOpenInMenuFromRect: rect inView: self.view animated: YES];
	//
	////	NSURL *instagramURL = [NSURL URLWithString: @"instagram://media?id=MEDIA_ID&tag?name=#徳島城"];
	////	NSURL *instagramURL = [NSURL URLWithString: @"instagram://media?id=MEDIA_ID"];
	//	NSURL *instagramURL = [NSURL URLWithString: @"instagram://tag?name=AAAA"];
	//
	//	if ( [[UIApplication sharedApplication] canOpenURL: instagramURL] ) {
	//
	//		[[UIApplication sharedApplication] openURL: instagramURL];
	//
	//		[self.dic presentOpenInMenuFromRect: rect inView: self.view animated: YES];
	//
	//	} else {
	//
	//		NSLog( @"No Instagram Found" );
	//
	//	}
	
}

- (UIDocumentInteractionController *)setupControllerWithURL: (NSURL *)fileURL usingDelegate: (id < UIDocumentInteractionControllerDelegate >)interactionDelegate
{
	
	UIDocumentInteractionController *interactionController = [UIDocumentInteractionController interactionControllerWithURL: fileURL];
	
	interactionController.delegate = interactionDelegate;
	
	return interactionController;
	
}

@end
