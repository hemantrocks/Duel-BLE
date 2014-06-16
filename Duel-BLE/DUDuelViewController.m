//
//  DUDuelViewController.m
//  Duel-BLE
//
//  Created by Aaron Stuckert on 2014-06-10.
//  Copyright (c) 2014 Hemant Sharma. All rights reserved.
//

#import "DUDuelViewController.h"

@interface DUDuelViewController ()

@end

@implementation DUDuelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

    
    
    /*  ***** START BLE SIGNAL STRENGTH SCAN LOOP *****  */
    
    // Get initial Compass position
    
    /*  ***** PLAY MUSIC *****  */
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"Sounds/Afterlife" //I added folder path.. may not be correct way to do it...
                                         ofType:@"mp3"]];
    
    NSError *error;
    _audioPlayer = [[AVAudioPlayer alloc]
                    initWithContentsOfURL:url
                    error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        _audioPlayer.delegate = self;
        [_audioPlayer prepareToPlay];
    }
    
    /*  ***** END PLAY MUSIC *****  */
    
    
    /*  ***** END BLE SIGNAL STRENGTH SCAN LOOP *****  */
    
    // CALL drawGun
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)drawGun
{
    // Start Timer? (I'm forgetting why this was needed, if shot data is passed instantaneously)
    // If host, determine winner???
    // Close BLE connection
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
