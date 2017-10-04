//
//  ViewController.m
//  lab2ForgotMyiPad
//
//  Created by Joseph Sheckels on 4/2/15.
//  Copyright (c) 2015 FullSail. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

#define TRANSFER_SERVICE_UUID           @"06B280C1-419D-4D87-810E-00D88B506717"
#define TRANSFER_CHARACTERISTIC_UUID    @"CD570797-087C-4008-B692-7835A1246377"

static AVAudioPlayer* dyuPlayer = nil;
static AVAudioPlayer* igbosPlayer = nil;
static AVAudioPlayer* qwmtPlayer = nil;
static AVAudioPlayer* ripPlayer = nil;
static AVAudioPlayer* wPlayer = nil;
static AVAudioPlayer* ykmPlayer = nil;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.connectedDevices = [[NSMutableArray alloc] init];
    
    NSString *path = [NSString stringWithFormat:@"%@/DYU.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    // Create audio player object and initialize with URL to sound
    dyuPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    NSString *path2 = [NSString stringWithFormat:@"%@/IGBOS.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl2 = [NSURL fileURLWithPath:path2];
    // Create audio player object and initialize with URL to sound
    igbosPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl2 error:nil];
    
    NSString *path3 = [NSString stringWithFormat:@"%@/QWMT.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl3 = [NSURL fileURLWithPath:path3];
    // Create audio player object and initialize with URL to sound
    qwmtPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl3 error:nil];
    
    NSString *path4 = [NSString stringWithFormat:@"%@/RIP.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl4 = [NSURL fileURLWithPath:path4];
    // Create audio player object and initialize with URL to sound
    ripPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl4 error:nil];
    
    NSString *path5 = [NSString stringWithFormat:@"%@/W.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl5 = [NSURL fileURLWithPath:path5];
    // Create audio player object and initialize with URL to sound
    wPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl5 error:nil];
    
    NSString *path6 = [NSString stringWithFormat:@"%@/YKM.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl6 = [NSURL fileURLWithPath:path6];
    // Create audio player object and initialize with URL to sound
    ykmPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl6 error:nil];
    
    _centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    _data = [[NSMutableData alloc] init];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    // You should test all scenarios
    if (central.state != CBCentralManagerStatePoweredOn) {
        return;
    }
    
    if (central.state == CBCentralManagerStatePoweredOn) {
        // Scan for devices
        [_centralManager scanForPeripheralsWithServices:@[[CBUUID UUIDWithString:TRANSFER_SERVICE_UUID]] options:@{ CBCentralManagerScanOptionAllowDuplicatesKey : @YES }];
        NSLog(@"Scanning started");
    }
}


- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI {
    
    NSLog(@"Discovered %@ at %@", peripheral.name, RSSI);
    
    if (peripheral.state == CBPeripheralStateDisconnected)
    {
        if (![self.connectedDevices containsObject:peripheral])
        {
            // Save a local copy of the peripheral, so CoreBluetooth doesn't get rid of it
            [self.connectedDevices addObject:peripheral];
        }
        // And connect
        NSLog(@"Connecting to peripheral %@", peripheral);
        [_centralManager connectPeripheral:peripheral options:nil];
    }
    else
    {
        peripheral.delegate = self;
        [peripheral discoverServices:@[[CBUUID UUIDWithString:TRANSFER_SERVICE_UUID]]];
    }
}


- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    NSLog(@"Failed to connect");
    //[self cleanup];
    [self.connectedDevices removeObject:peripheral];
}


- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    NSLog(@"Connected");
    
    peripheral.delegate = self;
    
    [peripheral discoverServices:@[[CBUUID UUIDWithString:TRANSFER_SERVICE_UUID]]];
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
    if (error) {
        //[self cleanup];
        return;
    }
    
    for (CBService *service in peripheral.services) {
        [peripheral discoverCharacteristics:@[[CBUUID UUIDWithString:TRANSFER_CHARACTERISTIC_UUID]] forService:service];
    }
    // Discover other characteristics
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
    if (error) {
        //[self cleanup];
        return;
    }
    
    for (CBCharacteristic *characteristic in service.characteristics) {
        if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:TRANSFER_CHARACTERISTIC_UUID]]) {
            [peripheral setNotifyValue:YES forCharacteristic:characteristic];
        }
    }
}


- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    if (error) {
        NSLog(@"Error");
        return;
    }
    
    NSString *stringFromData = [[NSString alloc] initWithData:characteristic.value encoding:NSUTF8StringEncoding];
    
    // Have we got everything we need?
    if ([stringFromData isEqualToString:@"1"])
        [dyuPlayer play];
    else if ([stringFromData isEqualToString:@"2"])
        [igbosPlayer play];
    else if ([stringFromData isEqualToString:@"3"])
        [qwmtPlayer play];
    else if ([stringFromData isEqualToString:@"4"])
        [ripPlayer play];
    else if ([stringFromData isEqualToString:@"5"])
        [wPlayer play];
    else if ([stringFromData isEqualToString:@"6"])
        [ykmPlayer play];
    
}


- (void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    
    if (![characteristic.UUID isEqual:[CBUUID UUIDWithString:TRANSFER_CHARACTERISTIC_UUID]]) {
        return;
    }
    
    if (characteristic.isNotifying) {
        
        NSLog(@"Notification began on %@", characteristic);
        
    } else {
        
        // Notification has stopped
        //[_centralManager cancelPeripheralConnection:peripheral];
        
    }
}

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    [self.connectedDevices removeObject:peripheral];
}

- (void)cleanup {
    
    // See if we are subscribed to a characteristic on the peripheral
    if (_discoveredPeripheral.services != nil) {
        for (CBService *service in _discoveredPeripheral.services) {
            if (service.characteristics != nil) {
                for (CBCharacteristic *characteristic in service.characteristics) {
                    if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:TRANSFER_CHARACTERISTIC_UUID]]) {
                        if (characteristic.isNotifying) {
                            [_discoveredPeripheral setNotifyValue:NO forCharacteristic:characteristic];
                            return;
                        }
                    }
                }
            }
        }
    }
    
    [_centralManager cancelPeripheralConnection: _discoveredPeripheral];
}


@end
