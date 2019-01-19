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
    for _ in 0..<12 {
      addCardSubviewToCardContainer()
    }
  }
  
  private func addCardSubviewToCardContainer() {
    if game.cards.isEmpty { return }
    let card = game.cards.popLast()
    let cardView = PlayingCardView()
    addTapGesture(view: cardView)
    cardView.card = card!!
    cardsContainer.addSubview(cardView)
  }
  
  private func updateView() {
    let gameSummary = game.gameSummary
    let selectedCards = game.gameSummary.selectedCards
    switch gameSummary.action {
    case .remove: removeCards(cardIndices: selectedCards)
    case .deselect: deselectCards(cardIndices: selectedCards)
    case .noaction: break
    }
    game.gameSummary.action = .noaction
    game.gameSummary.selectedCards = []
  }
  
  private func removeCards(cardIndices: [Int]) {
    for i in cardIndices {
      let subView = cardsContainer.subviews[i]
      subView.removeFromSuperview()
    }
  }
  
  private func deselectCards(cardIndices: [Int]) {
    for i in cardIndices {
      let subView = cardsContainer.subviews[i] as? PlayingCardView
      subView?.selected = false
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    newGame()
  }
  
  private func addTapGesture(view: PlayingCardView) {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectCard))
    view.addGestureRecognizer(tapGesture)
  }
  
  @objc private func selectCard(sender: UITapGestureRecognizer) {
    if let view = sender.view as? PlayingCardView {
      view.selected = view.selected == true ? false : true
      game.addToSelection(newCardIndex: cardsContainer.subviews.index(of: view)!)
    }
    updateView()
  }

}
