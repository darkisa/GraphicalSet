//
//  PlayingCardView.swift
//  GraphicalSet
//
//  Created by Darko Mijatovic on 1/9/19.
//  Copyright © 2019 Darko Mijatovic. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {
  
    static private var cardNumber = 5
    private var game = Set()

    override func draw(_ rect: CGRect) {
      let path = UIBezierPath()
      let card = game.cards[0]!
      drawSymbol(of: card, path: path)
      setColor(of: card)
      setFill(of: card, path: path)
      path.lineWidth = 5.0
      path.stroke()
    }
  
  

}

extension PlayingCardView {
  private func drawSymbol(of card: Card, path: UIBezierPath) {
    switch card.symbol {
    case .triangle:
      path.move(to: CGPoint(x: bounds.midX - 75, y: bounds.midY + 75))
      path.addLine(to: CGPoint(x: bounds.midX, y: bounds.midY - 75))
      path.addLine(to: CGPoint(x: bounds.midX + 75, y: bounds.midY + 75))
      path.close()
    case .square:
      path.move(to: CGPoint(x: bounds.midX - 75, y: bounds.midY - 75))
      path.addLine(to: CGPoint(x: bounds.midX + 75, y: bounds.midY - 75))
      path.addLine(to: CGPoint(x: bounds.midX + 75, y: bounds.midY + 75))
      path.addLine(to: CGPoint(x: bounds.midX - 75, y: bounds.midY + 75))
      path.close()
    case .circle:
      path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
    }
  }
  
  private func setColor(of card: Card) {
    switch card.color {
    case .red:
      UIColor.red.setFill()
      UIColor.red.setStroke()
    case .green:
      UIColor.green.setFill()
      UIColor.green.setStroke()
    case .purple:
      UIColor.purple.setFill()
      UIColor.purple.setStroke()
    }
  }
  
  private func setFill(of card: Card, path: UIBezierPath) {
    switch card.fill {
    case .solid: path.fill()
    case .striped:
      for i in stride(from: 0, through: Int(bounds.maxY), by: 15){
        path.move(to: CGPoint(x: 0, y: i))
        path.addLine(to: CGPoint(x: bounds.maxX, y: CGFloat(i)))
      }
      path.addClip()
    case .open: break
    }
  }
}
