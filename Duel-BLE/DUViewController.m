//
//  DUViewController.m
//  Duel-BLE
//
//  Created by Hemant Sharma on 2014-05-23.
//  Copyright (c) 2014 Hemant Sharma. All rights reserved.
//

#import "DUViewController.h"

@interface DUViewController ()

@end

@implementation DUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //load images
    NSArray *imageNames = @[@"cowboy.png", @"cowboy-flipped.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    
    for(int i=0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    //animate
    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(46, 221, 228, 255)];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 0.8;
    
    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];
    
    
    //start timer
    [NSTimer    scheduledTimerWithTimeInterval:4
                target:self
                selector:@selector(checkForOpponents)
                userInfo:nil
                repeats:NO];

    
    //create NSMutableArray of BLE devices with our identifier
    
    
    
    
}


-(void)checkForOpponents{
    NSLog(@"checkForOpponents called.");
    
    // if mutableArray is length 0, inform player and switch to peripheral mode "saloon"
    [self goToSaloon];
}

-(void)goToSaloon{
    NSLog(@"goToSaloon called.");
    //close any running timers etc
    //stop being a CB manager
    //change view to saloon
    
    
    /*
    If you're in a Navigation Controller:
    
    ViewController *viewController = [[ViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
    or if you just want to present a new view:
        
        ViewController *viewController = [[ViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
     
     */
}

-(void)setOpponentTable:(NSMutableArray*)opponentTable
{
    _opponentTable = [opponentTable mutableCopy];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*  ~~~ MUTABLE COLLECTION OF IBOUTLETS  ~~~
 
 http://stackoverflow.com/questions/12576780/ios-and-mutable-iboutletcollections
 
 
 You may have declared the property as a mutable array, but I'm pretty sure that when your nib is loaded an immutable array will be assigned to it.
 
 Override the synthesised setter for opponentTable (I'm assuming you're using xcode4.4 or later and ARC):
 
 -(void)setOpponentTable:(NSMutableArray*)opponentTable
 {
 _opponentTable = [opponentTable mutableCopy];
 }
 You may also be able to achieve this by changing the property declaration from strong to copy, but that's a guess.
 
 
 */

// ~~~~~~~~  TIMER  ~~~~~~~~~~~~

/*
 [NSTimer scheduledTimerWithTimeInterval:2.0
 target:self
 selector:@selector(targetMethod:)
 userInfo:nil
 repeats:NO];
 
 This will create a timer that is fired after 2.0 seconds and calls targetMethod: on self with one argument, which is a pointer to the NSTimer instance.
 
 
 If you want to stop a timer that is one which repeats, (or stop a non-repeating timer before it fires) then you need to keep a pointer to the NSTimer instance that was created; often this will need to be an instance variable so that you can refer to it in another method. You can then call invalidate on the NSTimer instance:
 
 
 [myTimer invalidate];
 myTimer = nil;
 
 
 In many situations, however, you also want the option of invalidating the timer—perhaps even before it starts. In this case, you do need to keep a reference to the timer, so that you can send it an invalidate message whenever appropriate. If you create an unscheduled timer (see “Unscheduled Timers”), then you must maintain a strong reference to the timer (in a reference-counted environment, you retain it) so that it is not deallocated before you use it.
 
 
 
 
 ~ Unscheduled Timer & Using Invocation ~
 
 NSMethodSignature *sgn = [self methodSignatureForSelector:@selector(onTick:)];
 NSInvocation *inv = [NSInvocation invocationWithMethodSignature: sgn];
 [inv setTarget: self];
 [inv setSelector:@selector(onTick:)];
 
 NSTimer *t = [NSTimer timerWithTimeInterval: 1.0
 invocation:inv
 repeats:YES];
 and after that, you start the timer manually whenever you need like this:
 
 NSRunLoop *runner = [NSRunLoop currentRunLoop];
 [runner addTimer: t forMode: NSDefaultRunLoopMode];
 
 
 And as a note, onTick: method looks like this:
 
 
 -(void)onTick:(NSTimer *)timer {
 //do something
 }
 
 
 
 ~~~~~~~~~~   CONNECTING BLE   ~~~~~~~~~~~~~
 
 You need to keep CBPeripheral instance (by which you are working) strongly. For example in your view controller you need to have a property
 
 @property (strong, nonatomic) CBPeripheral *activePeripheral;
 
 Assign found peripheral to activePeripheral, after which do your stuff (connecting/discovering/etc...)
 
======================
 
 
 Before you call CBCentralManager methods, the state of the central manager object must be powered on, as indicated by the CBCentralManagerStatePoweredOn constant. This state indicates that the central device (your iPhone or iPad, for instance) supports Bluetooth low energy and that Bluetooth is on and available to use.
 
======================
 
 
 Retrieving Lists of Peripherals
 – retrieveConnectedPeripheralsWithServices:
 – retrievePeripheralsWithIdentifiers:
 
 
 
 
 
 
 
 // Scan for peripherals - specifically for our service's 128bit CBUUID
 
- (void)scan
{
    [self.centralManager scanForPeripheralsWithServices:@[[CBUUID UUIDWithString:TRANSFER_SERVICE_UUID]]
                                                options:@{ CBCentralManagerScanOptionAllowDuplicatesKey : @YES }];
    
    NSLog(@"Scanning started");
}
 
 
 */

@end
