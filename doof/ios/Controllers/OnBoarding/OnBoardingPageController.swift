//
//  OnBoardingPageController.swift
//  doof
//
//  Created by Emerson Victor on 22/11/18.
//  Copyright © 2018 BDSM. All rights reserved.
//

import UIKit

class OnBoardingPageController: UIPageViewController {
    // MARK: - Variables
    // Controllers
    lazy var controllers:[UIViewController] = {
        let mainSb = UIStoryboard(name: "Main", bundle: nil)
        
        let introduction = mainSb.instantiateViewController(withIdentifier: "Introduction")
        let objectives = mainSb.instantiateViewController(withIdentifier: "Objectives")
        let information = mainSb.instantiateViewController(withIdentifier: "Information")
        
        return [introduction, objectives, introduction]
    }()
    var pageControl = UIPageControl()
    
    // MARK: - Initializer
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        self.setupPageControl()
        
        // Set first view controller
        if let firstViewController = self.controllers.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }
    }
}

extension OnBoardingPageController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = self.controllers.index(of: viewController) else { return nil }
        
        let previousIndex = index - 1
        guard previousIndex >= 0 else { return nil }
        
        guard self.controllers.count > previousIndex else { return nil }
        
        return self.controllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = self.controllers.index(of: viewController) else { return nil }
        
        let nextIndex = index + 1
        guard self.controllers.count != nextIndex  else { return nil }
        
        guard self.controllers.count > nextIndex else { return nil }
        
        return self.controllers[nextIndex]
    }
}

extension OnBoardingPageController: UIPageViewControllerDelegate {
    func setupPageControl() {
        self.pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = self.controllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = self.controllers.index(of: pageContentViewController)!
    }
}
