//
//  CardsContainer.swift
//  GraphicalSet
//
//  Created by Darko Mijatovic on 1/16/19.
//  Copyright © 2019 Darko Mijatovic. All rights reserved.
//

import UIKit

class CardsContainer: UIView {
  
  private(set) var numberOfCardsDealt = 0
  
  override func layoutSubviews() {
    super.layoutSubviews()
    for (i, subView) in subviews.enumerated() {
      subView.frame = grid[i]!.insetBy(dx: 5, dy: 5)
    }
  }
  
  private func updateView() {
    if subviews.count >= 81 { return }
    let grid = getGridSize()
    for i in cardContainer.subviews.endIndex..<game.numberOfCardsDealt {
      let rect = grid[i]!.insetBy(dx: 5, dy: 5)
      let cardView = PlayingCardView(frame: rect)
      addTapGesture(view: cardView)
      cardView.card = game.cards[i]!
      cardView.backgroundColor = UIColor.clear
      cardContainer.addSubview(cardView)
    }
  }
  
  private func getGridSize() -> Grid {
    let columnCount = numberOfCardsDealt >= 24 ? 6 : 3
    let rowCount = Int((Double(numberOfCardsDealt) / Double(columnCount)).rounded(.up))
    return Grid(layout: Grid.Layout.dimensions(rowCount: rowCount, columnCount: columnCount),frame: CGRect(x: 10, y: 0, width: bounds.width + 20, height: bounds.height + 10))
  }
  
}



extension CardsContainer {
  private struct GridConstants {
    static let startingX: CGFloat = 10
    static let startingY: CGFloat = 0
  }
}
