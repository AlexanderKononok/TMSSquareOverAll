//
//  ViewController.swift
//  SquareOverAll
//
//  Created by Alexander Kononok on 9/17/20.
//  Copyright © 2020 Alexander Kononok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func startGameButtonPressed(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let gameViewController = storyboard.instantiateViewController(identifier: String(describing: GameViewController.self)) as! GameViewController
    
    //gameViewController.modalPresentationStyle = .fullScreen
    //self.present(gameViewController, animated: true)
    navigationController?.pushViewController(gameViewController, animated: true)
  }
  
}

