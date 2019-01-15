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
  
  @IBAction func dealThreeMoreCards(_ sender: UIButton) {
    game.numberOfCardsDealt += 3
    updateView()
  }
  private var game = Set()
  private var indicesOfPlayingCardViews = [Int]()
  
  @IBAction private func newGame() {
    game = Set()
    updateView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    newGame()
  }
  
  @objc private func testt() {
    print("hello")
  }
  
  private func updateView() {
    if indicesOfPlayingCardViews.count >= 81 { return }
    let grid = setGridSize(numberOfCards: game.numberOfCardsDealt - 1)
    for (i, subView) in indicesOfPlayingCardViews.enumerated() {
      view.subviews[subView].frame = grid[i]!.inset(by: UIEdgeInsets(top: 0, left: 5, bottom: 10, right: 5))
    }
    for i in indicesOfPlayingCardViews.endIndex..<game.numberOfCardsDealt {
      let rect = grid[i]!.inset(by: UIEdgeInsets(top: 0, left: 5, bottom: 10, right: 5))
      let cardView = PlayingCardView(frame: rect)
      addTapGesture(view: cardView)
      cardView.card = game.cards[i]!
      cardView.backgroundColor = UIColor.clear
      indicesOfPlayingCardViews.append(view.subviews.endIndex)
      view.addSubview(cardView)
    }
  }
  
  private func setGridSize(numberOfCards: Int) -> Grid {
    let columnCount = game.numberOfCardsDealt >= 24 ? 6 : 3
    let rowCount = Int((Double(numberOfCards) / Double(columnCount)).rounded(.up))
    let width = Int(view.bounds.width) - 10
    let height = Int(view.bounds.height) - 200
    return Grid(layout: Grid.Layout.dimensions(rowCount: rowCount, columnCount: columnCount),
                 frame: CGRect(x: gridConstants.startingX,
                               y: gridConstants.startingY,
                               width: width,
                               height: height))
  }
  
  private func addTapGesture(view: PlayingCardView) {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(testt))
    view.addGestureRecognizer(tapGesture)
  }
}

extension ViewController {
  private struct gridConstants {
    static let startingX = 5
    static let startingY = 60
  }
}
