//
//  OnBoarding_1VC.swift
//  StreamView
//
//  Created by Aya on 23/02/2025.
//

import UIKit

class OnBoardingStepOneViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ContinueToPageTwo(_ sender: Any) {
        let OnBordingTwoNavigation = OnBoardingStepTwoViewController(nibName: "OnBoardingStepTwoViewController", bundle: nil)
       
        OnBordingTwoNavigation.modalPresentationStyle = .fullScreen
        self.present(OnBordingTwoNavigation, animated: true)
        }
        
    }
    


   

