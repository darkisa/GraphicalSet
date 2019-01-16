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
    updateView()
  }
  private var game = Set()
  
  @IBAction private func newGame() {
    game = Set()
    updateView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    newGame()
  }
  
  @objc private func selectCard() {
    print("hello")
  }
  
  private func updateView() {
    if cardContainer.subviews.count >= 81 { return }
    let grid = setGridSize(numberOfCards: game.numberOfCardsDealt - 1)
    for (i, subView) in cardContainer.subviews.enumerated() {
      subView.frame = grid[i]!.insetBy(dx: 5, dy: 5)
    }
    for i in cardContainer.subviews.endIndex..<game.numberOfCardsDealt {
      let rect = grid[i]!.insetBy(dx: 5, dy: 5)
      let cardView = PlayingCardView(frame: rect)
      addTapGesture(view: cardView)
      cardView.card = game.cards[i]!
      cardView.backgroundColor = UIColor.clear
      cardContainer.addSubview(cardView)
    }
  }
  
  private func setGridSize(numberOfCards: Int) -> Grid {
    let columnCount = game.numberOfCardsDealt >= 24 ? 6 : 3
    let rowCount = Int((Double(numberOfCards) / Double(columnCount)).rounded(.up))
    print(cardContainer.bounds.width)
    print(view.bounds.width)
    return Grid(layout: Grid.Layout.dimensions(rowCount: rowCount, columnCount: columnCount),
                 frame: CGRect(x: gridConstants.startingX,
                               y: gridConstants.startingY,
                               width: cardContainer.bounds.width + 20,
                               height: cardContainer.bounds.height + 10))
  }
  
  private func addTapGesture(view: PlayingCardView) {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectCard))
    view.addGestureRecognizer(tapGesture)
  }
}

extension ViewController {
  private struct gridConstants {
    static let startingX: CGFloat = 10
    static let startingY: CGFloat = 0
  }
}
