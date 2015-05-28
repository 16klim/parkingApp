//
//  ViewController.swift
//  ParkingApp
//
//  Created by Kate Wang on 4/15/15.
//  Copyright (c) 2015 K2A & Co. All rights reserved.
//

import UIKit
import Parse


class SeniorLotViewController: UIViewController {
    
    private let spacesKey = "SeniorLotSpaces"
    let numSpaces = 58
    
    @IBOutlet var fiftyEight: UIButton!
    @IBOutlet var fiftyNine: UIButton!
    @IBOutlet var sixty: UIButton!
    @IBOutlet var sixtyOne: UIButton!
    @IBOutlet var sixtyTwo: UIButton!
    @IBOutlet var sixtyThree: UIButton!
    @IBOutlet var sixtyFour: UIButton!
    @IBOutlet var sixtyFive: UIButton!
    @IBOutlet var sixtySix: UIButton!
    @IBOutlet var sixtySeven: UIButton!
    @IBOutlet var sixtyEight: UIButton!
    @IBOutlet var sixtyNine: UIButton!
    @IBOutlet var seventy: UIButton!
    @IBOutlet var seventyOne: UIButton!
    @IBOutlet var seventyTwo: UIButton!
    @IBOutlet var seventyThree: UIButton!
    @IBOutlet var seventyFour: UIButton!
    @IBOutlet var seventyFive: UIButton!
    @IBOutlet var seventySix: UIButton!
    @IBOutlet var seventySeven: UIButton!
    @IBOutlet var seventyEight: UIButton!
    @IBOutlet var seventyNine: UIButton!
    @IBOutlet var eighty: UIButton!
    @IBOutlet var eightyOne: UIButton!
    @IBOutlet var eightyTwo: UIButton!
    
    var spaceButtons = [UIButton]()
    var spaces: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false] //a shortened array of booleans representing just the four spaces we are testing
    
    //var spaces: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false] //an array of booleans
    
    //@IBOutlet var parkingSpace: [UIButton]!
    //@IBOutlet weak var parkingSpace1: UIButton!
    //var isClaimed : Bool = false
    
    
    // get Array with the app's tag order
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userDefaults = NSUserDefaults.standardUserDefaults() // setting a reference to the global user defaults store area
        if let spaces = userDefaults.arrayForKey(spacesKey) {
            self.spaces = spaces as [Bool]
        }
        
        var index = 0
        spaceButtons = [fiftyEight!, fiftyNine!, sixty!, sixtyOne!, sixtyTwo!, sixtyThree!, sixtyFour!, sixtyFive!, sixtySix!, sixtySeven!, sixtyEight!, sixtyNine!, seventy!, seventyOne!, seventyTwo!, seventyThree!, seventyFour!, seventyFive!, seventySix!, seventySeven!, seventyEight!, seventyNine!, eighty!, eightyOne!, eightyTwo!]
        for space in spaceButtons {
            if spaces[index] == true { // space is occupied
                space.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 100)
            } else {
                space.backgroundColor = UIColor(red: 0, green: 255, blue: 0, alpha: 100)
            }
            index = index + 1
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func claim(index: Int, button: UIButton) { //pass the index and the button so we know the index number
        let alert = UIAlertController(title: "Are you sure you would like to claim this spot?", message: " ", preferredStyle: .Alert)
        let yesAction = UIAlertAction(title: "Yes", style: .Default, handler: {(action) in self.updateParkingSpaceColor(button, claimed: true)})
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        spaces[index] = true //reassign the specific index number to true
        updateUserDefaults()
    }
    
    func declaim(index: Int, button: UIButton) {
        let alert = UIAlertController(title: "Are you sure you would like to unclaim this spot?", message: " ", preferredStyle: .Alert)
        let yesAction = UIAlertAction(title: "Yes", style: .Default, handler: {(action) in self.updateParkingSpaceColor(button, claimed: false)})
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        spaces[index] = false
        updateUserDefaults()
    }
    
    func updateUserDefaults() { // forcing call of function to use updateTags
        let userDefaults = NSUserDefaults.standardUserDefaults() // setting a reference to the global user defaults store area
        
        userDefaults.setObject(spaces, forKey: spacesKey) // replacing whatever was in array with new array
        // Swift will throw away all old spaces and replace with new ones
        // Only changing one space but reseting entire value
        
        userDefaults.synchronize() // force immediate save to device
    }
    
    @IBAction func selectParkingSpace(sender: AnyObject) {
        let button = sender as UIButton
        let label = button.titleLabel
        let text = label?.text
        if let index = text?.toInt(){
            if !spaces[index - numSpaces] { //title is the number of the space that is stored in the title of the object
                claim(index - numSpaces, button: button)
            } else {
                declaim(index - numSpaces, button: button)
            }
        }
        
        //var index = Int(button.titleLabel?.text)
        
    }
    
    func updateParkingSpaceColor(button: UIButton, claimed: Bool){
        if claimed == true {
            button.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 100)
        } else {
            button.backgroundColor = UIColor(red: 0, green: 255, blue: 0, alpha: 100)
        }
    }
    
}


class EmersonViewController: UIViewController {
    
    private let spacesKey = "EmersonSpaces"
    
    //@IBOutlet var parkingSpace: [UIButton]!
    //@IBOutlet weak var parkingSpace1: UIButton!
    //var isClaimed : Bool = false
    
    var spaces: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false] //an array of booleans
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userDefaults = NSUserDefaults.standardUserDefaults() // setting a reference to the global user defaults store area
        if let spaces = userDefaults.arrayForKey(spacesKey) {
            self.spaces = spaces as [Bool]
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func claim(index: Int, button: UIButton) { //pass the index and the button so we know the index number
        let alert = UIAlertController(title: "Are you sure you would like to claim this spot?", message: " ", preferredStyle: .Alert)
        let yesAction = UIAlertAction(title: "Yes", style: .Default, handler: {(action) in self.updateParkingSpaceColor(button, claimed: true)})
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        spaces[index] = true //reassign the specific index number to true
        updateUserDefaults()
    }
    
    func declaim(index: Int, button: UIButton) {
        let alert = UIAlertController(title: "Are you sure you would like to unclaim this spot?", message: " ", preferredStyle: .Alert)
        let yesAction = UIAlertAction(title: "Yes", style: .Default, handler: {(action) in self.updateParkingSpaceColor(button, claimed: false)})
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        spaces[index] = false
        updateUserDefaults()
    }
    
    func updateUserDefaults() { // forcing call of function to use updateTags
        let userDefaults = NSUserDefaults.standardUserDefaults() // setting a reference to the global user defaults store area
        
        userDefaults.setObject(spaces, forKey: spacesKey) // replacing whatever was in array with new array
        // Swift will throw away all old spaces and replace with new ones
        // Only changing one space but reseting entire value
        
        userDefaults.synchronize() // force immediate save to device
    }
    
    @IBAction func selectParkingSpace(sender: AnyObject) {
        let button = sender as UIButton
        let label = button.titleLabel
        let text = label?.text
        if let index = text?.toInt(){
            if !spaces[0] { //title is the number of the space that is stored in the title of the object
                claim(0, button: button)
            } else {
                declaim(0, button: button)
            }
        }
        
        //var index = Int(button.titleLabel?.text)
        
    }
    
    func updateParkingSpaceColor(button: UIButton, claimed: Bool){
        if claimed == true {
            button.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 100)
        } else {
            button.backgroundColor = UIColor(red: 0, green: 255, blue: 0, alpha: 100)
        }
    }
    
}


class BryantViewController: UIViewController {
    
    private let spacesKey = "BryantSpaces"
    
    //@IBOutlet var parkingSpace: [UIButton]!
    //@IBOutlet weak var parkingSpace1: UIButton!
    //var isClaimed : Bool = false
    
    var spaces: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false] //an array of booleans
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let spaces = userDefaults.arrayForKey("BryantSpaces") {
            self.spaces = spaces as [Bool]
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func claim(index: Int, button: UIButton) { //pass the index and the button so we know the index number
        let alert = UIAlertController(title: "Are you sure you would like to claim this spot?", message: " ", preferredStyle: .Alert)
        let yesAction = UIAlertAction(title: "Yes", style: .Default, handler: {(action) in self.updateParkingSpaceColor(button, claimed: true)})
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        spaces[index] = true //reassign the specific index number to true
        updateUserDefaults()
    }
    
    func declaim(index: Int, button: UIButton) {
        let alert = UIAlertController(title: "Are you sure you would like to unclaim this spot?", message: " ", preferredStyle: .Alert)
        let yesAction = UIAlertAction(title: "Yes", style: .Default, handler: {(action) in self.updateParkingSpaceColor(button, claimed: false)})
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        spaces[index] = false
        updateUserDefaults()
    }
    
    func updateUserDefaults() { // forcing call of function to use updateTags
        let userDefaults = NSUserDefaults.standardUserDefaults() // setting a reference to the global user defaults store area
        
        userDefaults.setObject(spaces, forKey: spacesKey) // replacing whatever was in array with new array
            // Swift will throw away all old spaces and replace with new ones
            // Only changing one space but reseting entire value
        
        userDefaults.synchronize() // force immediate save to device
    }

    
    @IBAction func selectParkingSpace(sender: AnyObject) {
        let button = sender as UIButton
        let label = button.titleLabel
        let text = label?.text
        if let index = text?.toInt(){
            if !spaces[0] { //title is the number of the space that is stored in the title of the object
                claim(0, button: button)
            } else {
                declaim(0, button: button)
            }
        }
        
        //var index = Int(button.titleLabel?.text)
        
    }
    
    func updateParkingSpaceColor(button: UIButton, claimed: Bool){
        if claimed == true {
            button.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 100)
        } else {
            button.backgroundColor = UIColor(red: 0, green: 255, blue: 0, alpha: 100)
        }
    }
    
}


class AdminLotViewController: UIViewController {
    
    private let spacesKey = "AdminLotSpaces"
    
    //@IBOutlet var parkingSpace: [UIButton]!
    //@IBOutlet weak var parkingSpace1: UIButton!
    //var isClaimed : Bool = false
    
    var spaces: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false] //an array of booleans
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userDefaults = NSUserDefaults.standardUserDefaults() // setting a reference to the global user defaults store area
        if let spaces = userDefaults.arrayForKey(spacesKey) {
            self.spaces = spaces as [Bool]
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func claim(index: Int, button: UIButton) { //pass the index and the button so we know the index number
        let alert = UIAlertController(title: "Are you sure you would like to claim this spot?", message: " ", preferredStyle: .Alert)
        let yesAction = UIAlertAction(title: "Yes", style: .Default, handler: {(action) in self.updateParkingSpaceColor(button, claimed: true)})
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        spaces[index] = true //reassign the specific index number to true
        updateUserDefaults()
    }
    
    func declaim(index: Int, button: UIButton) {
        let alert = UIAlertController(title: "Are you sure you would like to unclaim this spot?", message: " ", preferredStyle: .Alert)
        let yesAction = UIAlertAction(title: "Yes", style: .Default, handler: {(action) in self.updateParkingSpaceColor(button, claimed: false)})
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        spaces[index] = false
        updateUserDefaults()
    }
    
    func updateUserDefaults() { // forcing call of function to use updateTags
        let userDefaults = NSUserDefaults.standardUserDefaults() // setting a reference to the global user defaults store area
        
        userDefaults.setObject(spaces, forKey: spacesKey) // replacing whatever was in array with new array
        // Swift will throw away all old spaces and replace with new ones
        // Only changing one space but reseting entire value
        
        userDefaults.synchronize() // force immediate save to device
    }
    
    @IBAction func selectParkingSpace(sender: AnyObject) {
        let button = sender as UIButton
        let label = button.titleLabel
        let text = label?.text
        if let index = text?.toInt(){
            if !spaces[0] { //title is the number of the space that is stored in the title of the object
                claim(0, button: button)
            } else {
                declaim(0, button: button)
            }
        }
        
        //var index = Int(button.titleLabel?.text)
        
    }
    
    func updateParkingSpaceColor(button: UIButton, claimed: Bool){
        if claimed == true {
            button.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 100)
        } else {
            button.backgroundColor = UIColor(red: 0, green: 255, blue: 0, alpha: 100)
        }
    }
    
}


class KelloggViewController: UIViewController {
    
    private let spacesKey = "KelloggViewSpaces"
    
    //@IBOutlet var parkingSpace: [UIButton]!
    //@IBOutlet weak var parkingSpace1: UIButton!
    //var isClaimed : Bool = false
    
    var spaces: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false] //an array of booleans
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userDefaults = NSUserDefaults.standardUserDefaults() // setting a reference to the global user defaults store area
        if let spaces = userDefaults.arrayForKey(spacesKey) {
            self.spaces = spaces as [Bool]
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func claim(index: Int, button: UIButton) { //pass the index and the button so we know the index number
        let alert = UIAlertController(title: "Are you sure you would like to claim this spot?", message: " ", preferredStyle: .Alert)
        let yesAction = UIAlertAction(title: "Yes", style: .Default, handler: {(action) in self.updateParkingSpaceColor(button, claimed: true)})
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        spaces[index] = true //reassign the specific index number to true
        updateUserDefaults()
    }
    
    func declaim(index: Int, button: UIButton) {
        let alert = UIAlertController(title: "Are you sure you would like to unclaim this spot?", message: " ", preferredStyle: .Alert)
        let yesAction = UIAlertAction(title: "Yes", style: .Default, handler: {(action) in self.updateParkingSpaceColor(button, claimed: false)})
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        spaces[index] = false
        updateUserDefaults()
    }
    
    func updateUserDefaults() { // forcing call of function to use updateTags
        let userDefaults = NSUserDefaults.standardUserDefaults() // setting a reference to the global user defaults store area
        
        userDefaults.setObject(spaces, forKey: spacesKey) // replacing whatever was in array with new array
        // Swift will throw away all old spaces and replace with new ones
        // Only changing one space but reseting entire value
        
        userDefaults.synchronize() // force immediate save to device
    }
    
    @IBAction func selectParkingSpace(sender: AnyObject) {
        let button = sender as UIButton
        let label = button.titleLabel
        let text = label?.text
        if let index = text?.toInt(){
            if !spaces[0] { //title is the number of the space that is stored in the title of the object
                claim(0, button: button)
            } else {
                declaim(0, button: button)
            }
        }
        
        //var index = Int(button.titleLabel?.text)
        
    }
    
    func updateParkingSpaceColor(button: UIButton, claimed: Bool){
        if claimed == true {
            button.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 100)
        } else {
            button.backgroundColor = UIColor(red: 0, green: 255, blue: 0, alpha: 100)
        }
    }
    
}


class PoolParkingLotViewController: UIViewController {
    
    private let spacesKey = "PoolParkingSpaces"
    
    //@IBOutlet var parkingSpace: [UIButton]!
    //@IBOutlet weak var parkingSpace1: UIButton!
    //var isClaimed : Bool = false
    
    var spaces: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false] //an array of booleans
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userDefaults = NSUserDefaults.standardUserDefaults() // setting a reference to the global user defaults store area
        if let spaces = userDefaults.arrayForKey(spacesKey) {
            self.spaces = spaces as [Bool]
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func claim(index: Int, button: UIButton) { //pass the index and the button so we know the index number
        let alert = UIAlertController(title: "Are you sure you would like to claim this spot?", message: " ", preferredStyle: .Alert)
        let yesAction = UIAlertAction(title: "Yes", style: .Default, handler: {(action) in self.updateParkingSpaceColor(button, claimed: true)})
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        spaces[index] = true //reassign the specific index number to true
        updateUserDefaults()
    }
    
    func declaim(index: Int, button: UIButton) {
        let alert = UIAlertController(title: "Are you sure you would like to unclaim this spot?", message: " ", preferredStyle: .Alert)
        let yesAction = UIAlertAction(title: "Yes", style: .Default, handler: {(action) in self.updateParkingSpaceColor(button, claimed: false)})
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
        spaces[index] = false
        updateUserDefaults()
        
        // update NSUSerDefaults, pass entire array through NSUserDefaults
    }
    
    func updateUserDefaults() { // forcing call of function to use updateTags
        let userDefaults = NSUserDefaults.standardUserDefaults() // setting a reference to the global user defaults store area
        
        userDefaults.setObject(spaces, forKey: spacesKey) // replacing whatever was in array with new array
        // Swift will throw away all old spaces and replace with new ones
        // Only changing one space but reseting entire value
        
        userDefaults.synchronize() // force immediate save to device
    }
    
    @IBAction func selectParkingSpace(sender: AnyObject) {
        let button = sender as UIButton
        let label = button.titleLabel
        let text = label?.text
        if let index = text?.toInt(){
            if !spaces[0] { //title is the number of the space that is stored in the title of the object
                claim(0, button: button)
            } else {
                declaim(0, button: button)
            }
        }
        
        //var index = Int(button.titleLabel?.text)
        
    }
    
    func updateParkingSpaceColor(button: UIButton, claimed: Bool){
        if claimed == true {
            button.backgroundColor = UIColor(red: 255, green: 0, blue: 0, alpha: 100)
        } else {
            button.backgroundColor = UIColor(red: 0, green: 255, blue: 0, alpha: 100)
        }
    }
    
    func saveData(sender: Bool) {
        var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        
        
        
        defaults.synchronize()
    }
    
}