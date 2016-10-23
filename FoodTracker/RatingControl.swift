//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Onésimo Ramos Magallón on 04/08/16.
//  Copyright © 2016 Onésimo Ramos Magallón. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    // MARK: Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()  
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = #imageLiteral(resourceName: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        for _ in 0..<5 {
            let button = UIButton()
            
            button.setImage(emptyStarImage, for: UIControlState())
            button.setImage(filledStarImage, for: .selected)
            button.setImage(filledStarImage, for: [.highlighted, .selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped), for: .touchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the lenght of the button plus spacing.
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
            print(button.frame.origin.y)
            print(button.frame.origin.x)
        }
        updateButtonSelectionStates()
    }
    
    override var intrinsicContentSize: CGSize {
        let buttonSize =  44 //Int(frame.size.height)
        let width = 44 //(buttonSize + spacing) * starCount
        
        return CGSize(width: width, height: buttonSize)
    }
    
//    override func intrinsicContentSize() -> CGSize {
//        let buttonSize = Int(frame.size.height)
//        let width = (buttonSize + spacing) * starCount
//        
//        return CGSize(width: width, height: buttonSize)
//    }
    
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) -> Void {
        rating = ratingButtons.index(of: button)! + 1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates(){
        for(index, button) in ratingButtons.enumerated(){
            // If the index of a button is less than the rating, that button should be selected
            button.isSelected = index < rating
        }
    }

}
