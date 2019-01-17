//
//  ViewController.swift
//  Set
//
//  Created by Darko Mijatovic on 12/26/18.
//  Copyright © 2018 Darko Mijatovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var cardContainer: UIView! 
  @IBAction func dealThreeMoreCards(_ sender: UIButton) {
    game.numberOfCardsDealt += 3
  }
  private var game = Set()
  
  @IBAction private func newGame() {
    game = Set()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    newGame()
  }
  
  @objc private func selectCard() {
    print("hello")
  }
  
  
  private func addTapGesture(view: PlayingCardView) {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectCard))
    view.addGestureRecognizer(tapGesture)
  }
}
