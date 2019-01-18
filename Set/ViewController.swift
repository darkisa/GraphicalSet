//
//  ViewController.swift
//  Set
//
//  Created by Darko Mijatovic on 12/26/18.
//  Copyright © 2018 Darko Mijatovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var cardsContainer: CardsContainer!
  @IBAction func dealThreeMoreCards(_ sender: UIButton) {
    for _ in 0..<3 {
      addCardSubviewToCardContainer()
    }
  }
  private var game = Set()
  
  @IBAction private func newGame() {
    game = Set()
    for _ in 0..<game.numberOfCardsDealt {
      addCardSubviewToCardContainer()
    }
  }
  
  private func addCardSubviewToCardContainer() {
    if game.cards.isEmpty { return }
    let card = game.cards.popLast()
    let cardView = PlayingCardView()
    cardView.card = card!!
    cardsContainer.addSubview(cardView)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    newGame()
  }
  
  @objc private func selectCard() {
    print("hello")
  }
  

}
