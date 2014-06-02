//
//  DUViewController.h
//  Duel-BLE
//
//  Created by Hemant Sharma on 2014-05-23.
//  Copyright (c) 2014 Hemant Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DUViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIView) NSMutableArray *opponentTable;

-(void)setOpponentTable:(NSMutableArray*)opponentTable;
-(void)checkForOpponents;



@end
