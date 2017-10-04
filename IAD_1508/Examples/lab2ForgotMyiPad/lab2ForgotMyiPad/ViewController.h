//
//  ViewController.h
//  lab2ForgotMyiPad
//
//  Created by Joseph Sheckels on 4/2/15.
//  Copyright (c) 2015 FullSail. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController : NSViewController<CBCentralManagerDelegate, CBPeripheralDelegate>

@property (strong, nonatomic) CBCentralManager *centralManager;
@property (strong, nonatomic) CBPeripheral *discoveredPeripheral;
@property (strong, nonatomic) NSMutableData *data;
@property (strong, nonatomic) NSMutableArray* connectedDevices;

@end

