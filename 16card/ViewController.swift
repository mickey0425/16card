//
//  ViewController.swift
//  16card
//
//  Created by Mickey on 2019/3/13.
//  Copyright © 2019 Mickey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        emojiChoise.shuffle()
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    @IBOutlet var cardButton: [UIButton]!
    
   
    var flipCount:Int = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    
    var emojiChoise = ["🚷","🚯","🚳","🚱","🔞","📵","🚭","🆘","🔆","⚠️","✅","❇️","❌","🛑","❎","💀"]
    


    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButton.index(of: sender){
            filpCard(withEmoji: emojiChoise[cardNumber], on : sender)
        }else {
            print("error")
        }
        flipCount += 1
    
}
    
    func filpCard(withEmoji emoji: String, on button:UIButton){
        if button.currentTitle == emoji{
            button.setTitle("",for:UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }

    @IBAction func flipAll(_ sender: Any) {
        
        
        var i:Int = 0
        for button in cardButton {
            
                button.setTitle(emojiChoise[i],for:UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
                i += 1
            }
        flipCount += 1
    }
    
    @IBAction func resetCard(_ sender: Any) {
        emojiChoise.shuffle()
        for button in cardButton {
            button.setTitle("",for:UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            
        }
        flipCount = 0
    }
    
    
    
}
