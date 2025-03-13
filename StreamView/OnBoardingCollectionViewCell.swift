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
    
    
  /*  func setup(slide:OnBoardingSlide)
    {
        
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }*/
    func setup(slide: OnBoardingSlide) {
        print("📸 ImageView: \(slideImageView), 🏷 TitleLabel: \(slideTitleLabel), 📜 DescriptionLabel: \(slideDescriptionLabel)")

        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }

 
}
