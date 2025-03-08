//
//  OnBoardingCollectionViewCell.swift
//  StreamView
//
//  Created by Aya on 08/03/2025.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnBoardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    
    
    @IBOutlet weak var slideTitleLabel: UILabel!
    
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    
    func setup(slide:OnBoardingSlide)
    {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
    
    func setupBlur(slide: OnBoardingSlide, isLastSlide: Bool) {
            slideImageView.image = slide.image
            
            if isLastSlide {
                addBlurEffect()
            } else {
                removeBlurEffect()
            }
        }
        
        private func addBlurEffect() {
            removeBlurEffect() // Prevent multiple blur layers

            let blurEffect = UIBlurEffect(style: .dark) // Change to .light if needed
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = slideImageView.bounds
            blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            slideImageView.addSubview(blurView)
        }
        
        private func removeBlurEffect() {
            slideImageView.subviews.forEach { subview in
                if subview is UIVisualEffectView {
                    subview.removeFromSuperview()
                }
            }
        }
    
}
