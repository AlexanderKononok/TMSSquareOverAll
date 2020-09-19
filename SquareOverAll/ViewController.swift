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
    var widthSquare: CGFloat = 8
    var heightSquare: CGFloat = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func generateNewColor() {
        let red = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        square.backgroundColor = UIColor(displayP3Red: red, green: blue, blue: green, alpha: 1)
    }
    
    func newSquare(x: CGFloat, y: CGFloat, widthSquare: CGFloat, heightSquare: CGFloat) -> UIView {
        square = UIView()
        square.frame = CGRect(x: x, y: y, width: widthSquare, height: heightSquare)
        return square
    }
    
    func drawNewSquare() {
        fieldSquareView.addSubview(newSquare(x: x, y: y, widthSquare: widthSquare, heightSquare: heightSquare))
        generateNewColor()
        
        if square.frame.origin.x < fieldSquareView.frame.width - square.frame.width {
            fieldSquareView.addSubview(newSquare(x: x, y: y, widthSquare: widthSquare, heightSquare: heightSquare))
            generateNewColor()
            x += square.frame.width
            drawNewSquare()
        } else if square.frame.origin.y < fieldSquareView.frame.height - square.frame.height {
            fieldSquareView.addSubview(newSquare(x: x, y: y, widthSquare: widthSquare, heightSquare: heightSquare))
            generateNewColor()
            x = 0
            y += square.frame.width
            drawNewSquare()
        } else {
            x = 0
            y = 0
        }
    }
    
    @IBAction func drawSquareButton(_ sender: Any) {
        drawNewSquare()
    }
    
}

