//
//  ViewController.m
//  IAD-1508-Lab2-Bluetooth
//
//  Created by Christopher Gonzalez on 8/7/15.
//  Copyright (c) 2015 Christopher Gonzalez. All rights reserved.
//

#import "ViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import "TransferService.h"


@interface ViewController () <CBPeripheralManagerDelegate>

#pragma mark - Propertiessw2

@property (strong, nonatomic) NSData                                *dataToSend;
@property (strong, nonatomic) CBPeripheralManager                   *peripheralManager;
@property (strong, nonatomic) CBMutableCharacteristic               *transferCharacteristic;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView      *scanner;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray  *buttons;

@end

@implementation ViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
    
    for ( UIButton * i in _buttons) { i.enabled = NO; }
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [self.peripheralManager stopAdvertising];
    
    [super viewWillDisappear:animated];
    
}

#pragma mark - Peripheral Methods

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {

    if (peripheral.state != CBPeripheralManagerStatePoweredOn) { return; }
    
    NSLog(@"self.peripheralManager powered on.");
    
    self.transferCharacteristic = [ [CBMutableCharacteristic alloc] initWithType:[CBUUID UUIDWithString:TRANSFER_CHARACTERISTIC_UUID]
                                                                      properties:CBCharacteristicPropertyNotify
                                                                           value:nil
                                                                     permissions:CBAttributePermissionsReadable];
    
    CBMutableService *transferService = [ [CBMutableService alloc]  initWithType:[CBUUID UUIDWithString:TRANSFER_SERVICE_UUID]
                                                                         primary:YES];
    
    transferService.characteristics = @[self.transferCharacteristic];
    
    [self.peripheralManager addService:transferService];
    
}



- (void)peripheralManager:(CBPeripheralManager *)peripheral central:(CBCentral *)central
didSubscribeToCharacteristic:(CBCharacteristic *)characteristic {
    
    NSLog(@"Central subscribed to characteristic");
    
    [_scanner stopAnimating];
    
    for ( UIButton * i in _buttons) { i.enabled = YES; }
    
}

- (void)peripheralManager:(CBPeripheralManager *)peripheral central:(CBCentral *)central
didUnsubscribeFromCharacteristic:(CBCharacteristic *)characteristic {
    
    NSLog(@"Central unsubscribed from characteristic");
    
    [_scanner startAnimating];
    
    for ( UIButton * i in _buttons) { i.enabled = NO; }
    
}

#pragma mark - Action Methods

- (IBAction)switchChanged:(UISwitch*)sender {
    
    if (sender.on) {
        
        //sender.enabled = FALSE;
        [_scanner startAnimating];
        [self.peripheralManager startAdvertising: @{ CBAdvertisementDataServiceUUIDsKey : @[ [CBUUID UUIDWithString:TRANSFER_SERVICE_UUID] ] } ];
    
    }else{
        
        [_scanner stopAnimating];
        [self.peripheralManager stopAdvertising];
        
        for ( UIButton * i in _buttons) { i.enabled = NO; }
        
    }
    
}

- (IBAction)buttonPressed:(UIButton *)sender {
    
    NSInteger buttonValue = sender.tag;
    NSString * mystring = [NSString stringWithFormat: @"%li", (long)buttonValue ];
    
    NSLog(@"%@", mystring);
    
    self.dataToSend = [mystring dataUsingEncoding: NSUTF8StringEncoding];
    
    [_peripheralManager updateValue:self.dataToSend
                  forCharacteristic:_transferCharacteristic
               onSubscribedCentrals: nil];
    
}



@end








