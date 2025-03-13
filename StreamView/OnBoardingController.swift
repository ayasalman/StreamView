//
//  OnBoardingController.swift
//  StreamView
//
//  Created by Aya on 14/03/2025.
//

import UIKit

class OnBoardingController: UIViewController {

    
    @IBOutlet weak var signInButtonOutlet: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
    var slides : [OnBoardingSlide] = []
    var currentPage  = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1
            {
                nextButton.setTitle("Get Started", for: .normal)
                pageControl.isHidden = true
                signInButtonOutlet.isHidden = false
            }
            else{
                nextButton.setTitle("Next", for: .normal)
                pageControl.isHidden = false
                signInButtonOutlet.isHidden = true
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        setupSlides()
        print("Slides count: \(slides.count)")

        setupCollectionView()
        setupPageControl()
        setupLayout()
        updatePageControlIndicators() // Ensure the first indicator is correct
    }
    
    
    

    private func setupSlides() {
        slides = [
            OnBoardingSlide(title: "Watching can be from anywhere", description: "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incididunt sed do eiusmod tempor incididunt", image: UIImage(named: "onBoardingImageOne")!),
            OnBoardingSlide(title: "Complete list of movies", description: "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incididunt sed do eiusmod tempor incididunt", image: UIImage(named: "onBoardingImageTwo")!),
            OnBoardingSlide(title: "Spent Time with Loved Ones!", description: "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incididunt sed do eiusmod tempor incididunt", image: UIImage(named: "onBoardingImageThree")!)
        ]
    }
    
    

    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(OnBoardingCollectionViewCell.self, forCellWithReuseIdentifier: "OnBoardingCollectionViewCell")

    }
    
    

    private func setupPageControl() {
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
    }
    
    

    private func setupLayout() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
        }
        
        signInButtonOutlet.isHidden = true
        pageControl.isHidden = false
    }
    
    

    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if currentPage == slides.count - 1
        {
            print("go to the next Page")
        }
        else
        {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            print("Scrolling to item: \(currentPage)")
            collectionView.layoutIfNeeded()
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            //pageControl.currentPage = currentPage
        }
    }
    @IBAction func signInButton(_ sender: Any) {
    }
    
    
    func createIndicatorImage(size: CGSize, cornerRadius: CGFloat, color: UIColor) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            let rect = CGRect(origin: .zero, size: size)
            let path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
            color.setFill()
            path.fill()
        }
    }

    
    
}

extension OnBoardingController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(OnBoardingCollectionViewCell.self, forCellWithReuseIdentifier: OnBoardingCollectionViewCell.identifier)

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier, for: indexPath) as? OnBoardingCollectionViewCell else {
            fatalError("❌ Could not dequeue OnBoardingCollectionViewCell - Check Nib registration")
        }

        let slide = slides[indexPath.row]
        print("✅ Successfully dequeued cell with slide title: \(slide.title)")
        
        cell.setup(slide: slide)
        print("📸 Image: \(cell.slideImageView?.image), 🏷 Title: \(cell.slideTitleLabel?.text), 📜 Description: \(cell.slideDescriptionLabel?.text)")

        return cell
    }

    
    /*func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCollectionViewCell", for: indexPath) as! OnBoardingCollectionViewCell
        cell.setup(slide: slides[indexPath.row])
        return cell
    }*/
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    // Ensures the collection view scrolls smoothly without gaps
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // Updates indicators instantly when scrolling ends
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
        updatePageControlIndicators()
    }

    // Ensures smooth snapping to pages
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageWidth = collectionView.frame.width
        let estimatedPage = (scrollView.contentOffset.x + velocity.x * 60) / pageWidth
        let newPage = Int(round(estimatedPage))
        targetContentOffset.pointee = CGPoint(x: CGFloat(newPage) * pageWidth, y: 0)
        
        // Update pageControl instantly when scrolling stops
        DispatchQueue.main.async {
            self.currentPage = newPage
            self.pageControl.currentPage = self.currentPage
            self.updatePageControlIndicators()
        }
    }

    // Updates indicators while scrolling smoothly
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let offsetX = scrollView.contentOffset.x
        let newPage = Int((offsetX + width / 2) / width)
        
        if currentPage != newPage {
            currentPage = newPage
            updatePageControlIndicators()
        }
    }

    // Centralized function to update page indicator appearance
    func updatePageControlIndicators() {
        for i in 0..<pageControl.numberOfPages {
            let isCurrentPage = (i == pageControl.currentPage)
            let size = isCurrentPage ? CGSize(width: 24, height: 6) : CGSize(width: 6, height: 6)
            let color: UIColor = isCurrentPage ? .black : .gray
            let cornerRadius: CGFloat = 3

            let indicatorImage = createIndicatorImage(size: size, cornerRadius: cornerRadius, color: color)
            pageControl.setIndicatorImage(indicatorImage, forPage: i)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
            if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.invalidateLayout()  // Forces layout recalculation
            }
            self.collectionView.reloadData()  // Reload content after rotation
            
            // Ensure we stay on the correct page after rotation
            let indexPath = IndexPath(item: self.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        })
    }
}
