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
    
  func  addPageControl()
    {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 75, width: UIScreen.main.bounds.width, height: 50))
        self.pageControl.numberOfPages = pages.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.white
        self.pageControl.pageIndicatorTintColor = UIColor.darkGray
        self.pageControl.currentPageIndicatorTintColor = UIColor.systemPink
       // self.pageControl.current
        self.view.addSubview(pageControl)
        
       
        
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
