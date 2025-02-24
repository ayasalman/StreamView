//
//  PageVC.swift
//  StreamView
//
//  Created by Aya on 23/02/2025.
//

import UIKit

class PageVC: UIPageViewController , UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    var pageControl = UIPageControl()
    
    
    lazy var pages: [UIViewController] = {
      let firstVC = OnBoarding_1VC(nibName: "OnBoarding_1VC", bundle: nil)
      let secondVC = OnBoarding_2VC(nibName: "OnBoarding_2VC", bundle: nil)
       let thirdVC =  OnBoarding_3VC(nibName: "OnBoarding_3VC", bundle: nil)
        return [firstVC, secondVC, thirdVC]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = pages.first
        {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        addPageControl()
    }
    
    func addPageControl() {
        pageControl = UIPageControl()
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.darkGray
        pageControl.currentPageIndicatorTintColor = UIColor.systemIndigo
        
        // Add the pageControl to the view
        self.view.addSubview(pageControl)
        
        // Set Auto Layout constraints
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }

    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentVC = pageViewController.viewControllers![0]
        self.pageControl.currentPage = pages.firstIndex(of: pageContentVC)!
       
        
        
    }

    

    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else
        {
            return nil
        }
        
        let previousIndex = currentIndex - 1
        
        guard previousIndex >= 0 else
        {
            return nil
        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else
        {
            return nil
        }
        
        let afterIndex = currentIndex + 1
        
        guard afterIndex < pages.count else
        {
            return nil
        }
        
        
        
        return pages[afterIndex]
    }
    
   

}
