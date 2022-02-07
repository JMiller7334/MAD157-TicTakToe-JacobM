//
//  ViewController.swift
//  MAD157-TicTacToe-JacobM
//
//  Created by student on 2/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var a1: UIButton!
    @IBOutlet var a2: UIButton!
    @IBOutlet var a3: UIButton!
    
    @IBOutlet var b1: UIButton!
    @IBOutlet var b2: UIButton!
    @IBOutlet var b3: UIButton!
    
    @IBOutlet var c1: UIButton!
    @IBOutlet var c2: UIButton!
    @IBOutlet var c3: UIButton!
    
    var turn = "Xs"
    var count = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetGame()
    }
    
    func resetGame(){
        turn = "Xs"
        count = 0
        label.text = ("turn: \(turn)")
        a1.setImage(UIImage(named: "Placeholders"), for: .normal)
        a2.setImage(UIImage(named: "Placeholders"), for: .normal)
        a3.setImage(UIImage(named: "Placeholders"), for: .normal)
        
        b1.setImage(UIImage(named: "Placeholders"), for: .normal)
        b2.setImage(UIImage(named: "Placeholders"), for: .normal)
        b3.setImage(UIImage(named: "Placeholders"), for: .normal)
        
        c1.setImage(UIImage(named: "Placeholders"), for: .normal)
        c2.setImage(UIImage(named: "Placeholders"), for: .normal)
        c3.setImage(UIImage(named: "Placeholders"), for: .normal)
    }
    
    func checkList(a:UIButton, b:UIButton, c:UIButton, victory:Bool)->Bool{
        //check for winning strategies
        if victory != true{
            var score = 0
            score = 0
            if a.currentImage == (UIImage(named: turn)){
                score = score + 1
            }
            if b.currentImage == (UIImage(named: turn)){
                score = score + 1
            }
            if c.currentImage == (UIImage(named: turn)){
                score = score + 1
            }
            if (score == 3){
                return true
            }
            else{
                return false
            }
        }
        else{
            return true // if the player has already won leave it that way
        }
    }
    
    func buttonFunction(currentButton:UIButton){
        if label.text == ("WINNER:\(turn)"){
            resetGame()
        }
        if label.text == ("DRAW"){
            resetGame()
        }
        if currentButton.currentImage == UIImage(named: "Placeholders"){
            currentButton.setImage(UIImage(named: turn), for: .normal)
            
            var won = false
            count = count + 1
            
            
            // vertical
            won = checkList(a: a1, b: a2, c: a3, victory: won)
            won = checkList(a: b1, b: b2, c: b3, victory: won)
            won = checkList(a: c1, b: c2, c: c3, victory: won)
            // horizontal
            won =  checkList(a: a1, b: b1, c: b2, victory: won)
            won = checkList(a: a2, b: b2, c: c2, victory: won)
            won = checkList(a: a3, b: b3, c: c3, victory: won)
            //cross way
            won = checkList(a: a1, b: b2, c: c3, victory: won)
            won = checkList(a: a3, b: b2, c: c1, victory: won)
            
            if (won == true){
                label.text = ("WINNER:\(turn)")
            }
            else{
                if turn == "Xs"{
                    turn = "Os"
                    label.text = "TURN: \(turn)"
                    
                }
                else{
                    turn = "Xs"
                    label.text = "TURN: \(turn)"
                    
                }
                if (count >= 9){
                    label.text = ("DRAW")
                }
            }
        }
    }
    
    //Actions
    @IBAction func A1Pressed(){
        buttonFunction(currentButton: a1)
    }
    @IBAction func A2Pressed(){
        buttonFunction(currentButton: a2)
    }
    @IBAction func A3Pressed(){
        buttonFunction(currentButton: a3)
    }
    
    @IBAction func B1Pressed(){
        buttonFunction(currentButton: b1)
    }
    @IBAction func B2Pressed(){
        buttonFunction(currentButton: b2)
    }
    @IBAction func B3Pressed(){
        buttonFunction(currentButton: b3)
    }
    
    @IBAction func C1Pressed(){
        buttonFunction(currentButton: c1)
    }
    @IBAction func C2Pressed(){
        buttonFunction(currentButton: c2)
    }
    @IBAction func C3Pressed(){
        buttonFunction(currentButton: c3)
    }
}

