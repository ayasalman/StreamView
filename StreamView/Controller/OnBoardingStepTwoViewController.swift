//
//  OnBoarding_2VC.swift
//  StreamView
//
//  Created by Aya on 23/02/2025.
//

import UIKit

class OnBoardingStepTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    
    @IBAction func continueToPageThree(_ sender: Any) {
        
        let OnBordingThreeNavigation = OnBoardingStepThreeViewController(nibName: "OnBoardingStepThreeViewController", bundle: nil)
       
       // OnBordingThreeNavigation.modalPresentationStyle = .fullScreen
        //self.present(OnBordingThreeNavigation, animated: true)
//        addChild(OnBordingThreeNavigation)
//        OnBordingThreeNavigation.view.frame = view.bounds
//            view.addSubview(OnBordingThreeNavigation.view)
//        OnBordingThreeNavigation.didMove(toParent: self)
        
        self.navigationController?.pushViewController(OnBordingThreeNavigation, animated: true)
    }
    
}
