//
//  ViewController.swift
//  calculator
//
//  Created by Cntt28 on 4/15/17.
//  Copyright © 2017 Cntt28. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var numberOnScreen:Double = 0; //so tren man hinh
    var previousNumber:Double = 0; //so truoc
    var performingMath = false
    var operation = 0; // vung nho
    var reset = false // reset so sau khi nhan button "="
    var dot = false // Dau "." thap phan
    //var negative = false // So am
    
    
    @IBAction func numbers(_ sender: UIButton) {
        if(performingMath == true)
        {
            if(reset == true){  // Kiem tra dieu kien
                label.text = "" //Tra text ve rong
                reset = false
            }
            
            if(sender.tag != 17 && sender.tag != 18 && sender.tag != 19){ //Neu khong nhan vao 2 button "." va "-"
                label.text = String(sender.tag-1)  // So se bang tag - 1 (vi 0-tag1, 1-tag2, ....)
                numberOnScreen = Double(label.text!)!  // Ep kieu ve double
                performingMath = false
            }
            
            if (sender.tag == 17 && dot == false){  //Neu click vao button "."
                label.text = label.text! + "." //Them dau "." vao
                dot = true
            }
            
            if(sender.tag == 18){ //Neu click vao button "-"
                label.text = String(Double(label.text!)! * -1)
            }
            
            if(sender.tag == 19){ //click vao button %
                label.text = String(Double(label.text!)! / 100)
            }
        }
        else{
            if(reset == true){
                label.text = ""
                reset = false
            }
            
            if (sender.tag != 17 && sender.tag != 18){
                label.text = label.text! + String(sender.tag-1)
                numberOnScreen = Double(label.text!)!
            }
        
            if (sender.tag == 17 && dot == false){
                label.text = label.text! + "."
                dot = true
            }
            
            if(sender.tag == 18){
                
                label.text = String(Double(label.text!)! * -1)
            }
            if(sender.tag == 19){
                label.text = String(Double(label.text!)! / 100)
            }
        }
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if(label.text != "" && sender.tag != 11 && sender.tag != 16){  //Kiem tra dieu kien khi click vao 4 button "+", "-", "x", "/"
            
            previousNumber = Double(label.text!)!
            
            if(sender.tag == 12){
                label.text = "/";
                reset = true
                dot = false
               
            }
            else if (sender.tag == 13){
                label.text = "x";
                reset = true
                dot = false
                
            }
            else if (sender.tag == 14){
                label.text = "-";
                reset = true
                dot = false
               
            }
            else if (sender.tag == 15){
                label.text = "+";
                reset = true
                dot = false
                
            }
            operation = sender.tag
            performingMath = true;
            
        }
        else if (sender.tag == 16){ //Khi click button "="
            
            reset = true
            dot = false
            
            
            if (operation == 12){
                label.text = String(previousNumber / numberOnScreen)
            }
            else if (operation == 13){
                label.text = String(previousNumber * numberOnScreen)
            }
            else if (operation == 14){
                label.text = String(previousNumber - numberOnScreen)
            }
            else if (operation == 15){
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        
        else if (sender.tag == 11){ //Click button "C"
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
            dot = false
            
        }
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

