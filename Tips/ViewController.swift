//
//  ViewController.swift
//  Tips
//
//  Created by Alex Hsieh on 2017/11/13.
//  Copyright © 2017年 Alex Hsieh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var tipsLabel: UILabel!
    @IBOutlet weak var tipsPercentLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var percendSlider: UISlider!
    
    @IBAction func tipsSlider(_ sender: Any) {
      
        tipsPercentLabel.text = "Tips(\(Int(percendSlider.value))%)"
    }
    
    var slider:Int = 0
    var TipsCalculate:Float = 0
    var TotalPrice:Float = 0
    
    @IBAction func calculateButton(_ sender: UIButton) {
        //收鍵盤
        view.endEditing(true)
        
        if priceTextField.text == "" {
            let MistakeAlert = UIAlertController(title: "錯誤", message: "請輸入數字", preferredStyle: .alert)
            let OkAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }
            MistakeAlert.addAction(OkAction)
            present(MistakeAlert, animated: true , completion: nil)
            
        }else{
            
            slider = Int(percendSlider.value)
            TipsCalculate = Float(priceTextField.text!)! * Float(slider) / 100
            TotalPrice = Float(priceTextField.text!)! + TipsCalculate
            
            tipsLabel.text = "$\(String(TipsCalculate))"
            totalPriceLabel.text = "$\(String(TotalPrice))"
            
        }
    }
    
    @IBAction func cleanButton(_ sender: Any) {
        priceTextField.text = ""
        tipsPercentLabel.text = "Tips(0%)"
        tipsLabel.text = "$0.00"
        totalPriceLabel.text = "$0.00"
        
        slider = 0
        TipsCalculate = 0
        TotalPrice = 0
        percendSlider.value = 0
        
        view.endEditing(true)
    }
    
    
    //點任意地方收鍵盤
    @IBAction func gesture(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

