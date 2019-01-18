//
//  CardsContainer.swift
//  GraphicalSet
//
//  Created by Darko Mijatovic on 1/16/19.
//  Copyright © 2019 Darko Mijatovic. All rights reserved.
//

import UIKit

class CardsContainer: UIView {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    let numberOfSubviews = subviews.count
    let grid = getGridSize(numberOfSubviews: numberOfSubviews)
    for (i, subView) in subviews.enumerated() {
      subView.frame = grid[i]!.insetBy(dx: Constants.dxInset, dy: Constants.dyInset)
      subView.backgroundColor = UIColor.clear
    }
  }
  
//  private func addTapGesture(view: PlayingCardView) {
//    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectCard))
//    view.addGestureRecognizer(tapGesture)
//  }
  
  private func getGridSize(numberOfSubviews: Int) -> Grid {
    let columnCount = numberOfSubviews >= 24 ? 6 : 3
    let rowCount = Int((Double(numberOfSubviews) / Double(columnCount)).rounded(.up))
    return Grid(layout: Grid.Layout.dimensions(rowCount: rowCount, columnCount: columnCount),
                 frame: CGRect(x: Constants.startingX,
                               y: Constants.startingY,
                           width: bounds.width - Constants.dxInset,
                          height: bounds.height - Constants.dyInset))
  }
}

extension CardsContainer {
  private struct Constants {
    static let startingX: CGFloat = 0
    static let startingY: CGFloat = 0
    static let dxInset: CGFloat = 5
    static let dyInset: CGFloat = 5
  }
}
