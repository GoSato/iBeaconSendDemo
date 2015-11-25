//
//  ViewController.swift
//  CoreLocation002
//

import UIKit
import CoreLocation
import CoreBluetooth

class ViewController: UIViewController, CBPeripheralManagerDelegate {
    
    // LocationManager.
    var myPheripheralManager:CBPeripheralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // PeripheralManagerを定義.
        myPheripheralManager = CBPeripheralManager(delegate: self, queue: nil)
        
    }
    
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager) {
        
        // iBeaconのUUID.
        let myProximityUUID = NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")
        
        // iBeaconのIdentifier.
        let myIdentifier = "akabeacon"
        
        // Major.
        let myMajor : CLBeaconMajorValue = 1
        
        // Minor.
        let myMinor : CLBeaconMinorValue = 2
        
        // BeaconRegionを定義.
        let myBeaconRegion = CLBeaconRegion(proximityUUID: myProximityUUID!, major: myMajor, minor: myMinor, identifier: myIdentifier)
        
        // Advertisingのフォーマットを作成.
        let myBeaconPeripheralData = NSDictionary(dictionary: myBeaconRegion.peripheralDataWithMeasuredPower(nil))
        
        
        // Advertisingを発信.
        myPheripheralManager.startAdvertising(myBeaconPeripheralData as? [String : AnyObject])
    }
}