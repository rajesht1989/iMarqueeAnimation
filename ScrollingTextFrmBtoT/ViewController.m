//
//  ViewController.m
// iMarqueeAnimation
//
//  Created by Rajesh on 20/02/14.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSTimer *timer;
UILabel *label ;
NSTimer *timer;

float timeDuration;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    self.toolbar.frame.origin.y;
//    timer =[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(scrollText:) userInfo:nil repeats:YES];
//    label = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 250, 20)];
//    
//    label.text =@"This is a string to be scroll";
//    [self.view addSubview:label];
//    
//}
//
//-(void)scrollText:(id)parameter{
//    if (label.frame.origin.y <= 50) {
//        [label setFrame:CGRectMake(label.frame.origin.x, 400, label.frame.size.width, label.frame.size.height)];
//    }
//    else
//    [label setFrame:CGRectMake(label.frame.origin.x, label.frame.origin.y-5, label.frame.size.width, label.frame.size.height)];
//}

-(void)viewDidLoad  {
    
    [super viewDidLoad];
    timeDuration=1.0f;
    timer = [NSTimer scheduledTimerWithTimeInterval:timeDuration   target:self selector:@selector(marqueeAnimation) userInfo:nil repeats:YES];
}

-(void)marqueeAnimation{
    
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(100, -100, 100, 100)];
    [imgView setImage:[UIImage imageNamed:@"img.jpg"]];
    [self.view addSubview:imgView];
    
    NSString *keyPath = @"transform.translation.y";
    
    CAKeyframeAnimation *translation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    
    translation.duration = 5;
    translation.autoreverses = NO;
    NSMutableArray *values = [[NSMutableArray alloc] init];
    [values addObject:[NSNumber numberWithFloat:0.0f]];
    CGFloat height = [[UIScreen mainScreen] applicationFrame].size.height;
    [values addObject:[NSNumber numberWithFloat:height]];
    translation.values = values;
    
    NSMutableArray *timingFunctions = [[NSMutableArray alloc] init];
    [timingFunctions addObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    translation.timingFunctions = timingFunctions;
    
    [imgView.layer addAnimation:translation forKey:keyPath]; 
    
}

@end
