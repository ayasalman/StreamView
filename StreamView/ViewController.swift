//
//  ViewController.swift
//  StreamView
//
//  Created by Aya on 23/02/2025.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{
   
    
    @IBOutlet weak var scrollView: UIScrollView!
       @IBOutlet weak var pageControl: UIPageControl!
    
    
  
    
   
    
 /*   let myVC = ViewController(nibName: "OnBoarding_3VC", bundle: nil)
    present(myVC, animated: true, completion: nil)
   
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    
       // setupPages()
        
    }
    
    
    
    

    
   /* private func setupPages() {
           let pages = [OnBoarding_1VC(), OnBoarding_2VC(), OnBoarding_3VC()]
           scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count), height: view.frame.height)
           scrollView.isPagingEnabled = true
           scrollView.delegate = self

          // for (index, page) in pages.enumerated() {
          //     page.frame = CGRect(x: CGFloat(index) * view.frame.width, y: 0, width: view.frame.width, height: view.frame.height)
       //        scrollView.addSubview(page)
       //    }

           pageControl.numberOfPages = pages.count
       }

       func scrollViewDidScroll(_ scrollView: UIScrollView) {
           let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
           pageControl.currentPage = Int(pageIndex)
       }
*/
}

