//
//  ViewController.swift
//  SquareOverAll
//
//  Created by Alexander Kononok on 9/17/20.
//  Copyright © 2020 Alexander Kononok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fieldSquareView: UIView!
    
    var square: UIView!
    var x: CGFloat = 0
    var y: CGFloat = 0

    let sideOfTheSquare: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func drawSquareButton(_ sender: Any) {
        drawSquare()
    }
    
    func generateNewColor() {
        let red = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        
        square.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
    }
    
    func drawSquare() {
        square = UIView()
        square.frame = CGRect(x: x, y: y, width: sideOfTheSquare, height: sideOfTheSquare)
        if x + (sideOfTheSquare * 2) < fieldSquareView.frame.width {
            fieldSquareView.addSubview(square)
            x += sideOfTheSquare
            generateNewColor()
            drawSquare()
        } else if y + (sideOfTheSquare * 2) < fieldSquareView.frame.height {
            y += sideOfTheSquare
            x = 0
            fieldSquareView.addSubview(square)
            generateNewColor()
            drawSquare()
        } else {
            fieldSquareView.addSubview(square)
            generateNewColor()
            x = 0
            y = 0
        }
    }
    
}

