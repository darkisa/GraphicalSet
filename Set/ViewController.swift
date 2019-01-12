//
//  ViewController.swift
//  Set
//
//  Created by Darko Mijatovic on 12/26/18.
//  Copyright © 2018 Darko Mijatovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var score: UILabel!
  @IBOutlet weak var cardsRemaining: UILabel!
  
  private let game = Set()
  
  @IBAction private func newGame() {
    let game = Set()
    let grid = setGridSize(numberOfCards: game.numberOfCardsDealt)
    for i in 0...3 {
      let rect = grid[i]!.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 10))
      let cardView = PlayingCardView(frame: rect)
      cardView.card = game.cards[i]!
      cardView.backgroundColor = UIColor.white
      view.addSubview(cardView)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    newGame()
  }
  
  private func setGridSize(numberOfCards: Int) -> Grid {
    let columnCount = 3
    let rowCount = Int(ceil(Double(numberOfCards / columnCount)))
    let width = Int(view.bounds.width) - 10
    let height = Int(view.bounds.height) - 200
    return Grid(layout: Grid.Layout.dimensions(rowCount: rowCount, columnCount: columnCount),
                 frame: CGRect(x: gridConstants.startingX,
                               y: gridConstants.startingY,
                               width: width,
                               height: height))
  }

}

extension ViewController {
  private struct gridConstants {
    static let startingX = 10
    static let startingY = 60
  }
}
