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

    let widthSquare: CGFloat = 150
    let heightSquare: CGFloat = 150
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func drawSquareButton(_ sender: Any) {
        drawNewSquare()
    }
    
    func generateNewColor() {
        let red = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        square.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
    }
    
    func newSquare(x: CGFloat, y: CGFloat, widthSquare: CGFloat, heightSquare: CGFloat) -> UIView {
        square = UIView()
        square.frame = CGRect(x: x, y: y, width: widthSquare, height: heightSquare)
        return square
    }
    
    func drawNewSquare() {
        fieldSquareView.addSubview(newSquare(x: x, y: y, widthSquare: widthSquare, heightSquare: heightSquare))
        generateNewColor()

        if square.frame.origin.x + square.frame.width < fieldSquareView.frame.width - square.frame.width {
            fieldSquareView.addSubview(newSquare(x: x, y: y, widthSquare: widthSquare, heightSquare: heightSquare))
            x += square.frame.width
            generateNewColor()
            drawNewSquare()
        } else if square.frame.origin.y + square.frame.height < fieldSquareView.frame.height - square.frame.height {
            fieldSquareView.addSubview(newSquare(x: x, y: y, widthSquare: widthSquare, heightSquare: heightSquare))
            x = 0
            y += square.frame.width
            generateNewColor()
            drawNewSquare()
        } else {
            x = 0
            y = 0
        }
    }
    
}

