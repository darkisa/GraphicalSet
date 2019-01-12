//
//  PlayingCardView.swift
//  GraphicalSet
//
//  Created by Darko Mijatovic on 1/9/19.
//  Copyright © 2019 Darko Mijatovic. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {
  
  var card = Card()
  
  override func draw(_ rect: CGRect) {
    let path = UIBezierPath()
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
      path.move(to: startingPoint)
      path.addLine(to: CGPoint(x: bounds.midX, y: bounds.height * SizeRatio.verticalLineToBoundsRatio))
      path.addLine(to: CGPoint(x: bounds.width * (1 - SizeRatio.horizontalStartingPoint) , y: bounds.height * SizeRatio.verticalStartingPoint))
      path.close()
    case .square:
      path.move(to: startingPoint)
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
      UIColor.red.withAlphaComponent(0.5).setFill()
      UIColor.red.setStroke()
    case .green:
      UIColor.green.withAlphaComponent(0.5).setFill()
      UIColor.green.setStroke()
    case .purple:
      UIColor.purple.withAlphaComponent(0.5).setFill()
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

extension PlayingCardView {
  private struct SizeRatio {
    static let horizontalStartingPoint: CGFloat = 0.375
    static let verticalStartingPoint: CGFloat = 0.66
    static let verticalLineToBoundsRatio: CGFloat = 0.33
  }
  
  private var startingPoint: CGPoint {
    return CGPoint(x: bounds.width * SizeRatio.horizontalStartingPoint, y: bounds.height * SizeRatio.verticalStartingPoint)
  }
}
