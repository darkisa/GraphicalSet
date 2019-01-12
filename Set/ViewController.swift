//
//  ViewController.swift
//  Set
//
//  Created by Darko Mijatovic on 12/26/18.
//  Copyright © 2018 Darko Mijatovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
//  @IBAction func touchCard(_ sender: UIButton) {
//    let touchedCardIndex = cardButtons.index(of: sender)!
//    game.addToSelection(newCardIndex: touchedCardIndex)
//    if game.numberOfCardsSelected() == 3 {
//      if game.doSelectedCardsMatch() {
//      game.assignNewCards()
//      game.clearSelectedCards()
//      setAttributesOfCardButtons()
//      updateGameMetrics(changeBy: 3)
//      } else {
//        game.clearSelectedCards()
//        updateGameMetrics(changeBy: -5)
//      }
//    }
//    highlightSelectedCards()
//  }
  
  @IBOutlet weak var score: UILabel!
  @IBOutlet weak var cardsRemaining: UILabel!
  
//  @IBAction func dealThreeMoreCards(_ sender: UIButton) {
//    let visibleCards = cardButtons.filter { $0.isHidden == false}.count
//    if game.cards.count <= 24 || visibleCards >= 24 {
//      sender.isEnabled = false
//    } else {
//      sender.isEnabled = true
//      game.numberOfCardsDealt += 3
//      updateGameMetrics(changeBy: 0)
//      setVisibilityOfCards()
//    }
//  }
//
  @IBAction private func newGame() {
    let grid = Grid(layout: Grid.Layout.dimensions(rowCount: 10, columnCount: 4), frame: CGRect(x: 60, y: 60, width: 300, height: 500))
    print(grid.cellSize)
    let game = Set()
    for i in 0...3 {
      let rect = grid[i]!
      let cardView = PlayingCardView(frame: rect)
      cardView.card = game.cards[i]!
      cardView.backgroundColor = UIColor.white
      view.addSubview(cardView)
    }
  }
//
  override func viewDidLoad() {
    super.viewDidLoad()
    newGame()
//    setVisibilityOfCards()
//    updateGameMetrics(changeBy: 0)
  }
//
//  private var game = Set()
//
//  private func cardsRemainingCount() -> Int {
//    return 81 - game.numberOfCardsDealt
//  }
//
//  private func updateGameMetrics(changeBy: Int) {
//    game.score += changeBy
//    score.text = "Score: \(game.score)"
//    cardsRemaining.text = "Number of Cards Remaining: \(cardsRemainingCount())"
//  }
//
//  private func setVisibilityOfCards() {
//    for index in cardButtons.indices {
//      if index < game.numberOfCardsDealt && cardButtons[index].isEnabled == true {
//        cardButtons[index].isHidden = false
//      } else {
//        cardButtons[index].isHidden = true
//      }
//    }
//  }
//
//  private func highlightSelectedCards() {
//    for index in game.indicesOfDeselectedCards {
//      let cardButton = cardButtons[index]
//      cardButton.layer.borderWidth = 0
//      cardButton.layer.borderColor = UIColor.clear.cgColor
//    }
//    game.indicesOfDeselectedCards.removeAll()
//    for index in game.indicesOfSelectedCards {
//      let cardButton = cardButtons[index]
//      cardButton.layer.borderWidth = 3.0
//      cardButton.layer.borderColor = UIColor.blue.cgColor
//    }
//  }
//
//  private func setAttributesOfCardButtons() {
//    for (index, cardButton) in cardButtons.enumerated() {
//      if let card = game.cards[index] {
//        let attributedText = createAttributedString(card: card)
//        cardButton.setAttributedTitle(attributedText, for: UIControl.State.normal)
//      } else {
//        cardButton.isHidden = true
//        cardButton.isEnabled = false
//      }
//    }
//  }
//
//  private func createAttributedString(card: Card) -> NSAttributedString {
//    let shading = getSymbolShading(of: card)
//    let attributes: [NSAttributedString.Key: Any] = [
//      .strokeWidth: shading,
//      .foregroundColor: (shading == -1 ? getSymbolColor(of: card).withAlphaComponent(0.3) : getSymbolColor(of: card))
//    ]
//    return NSAttributedString(string: getSymbol(of: card), attributes: attributes)
//  }
}
