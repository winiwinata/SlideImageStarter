//
//  PageViewController.swift
//  SlideImage
//
//  Created by 羅壽之 on 2020/12/17.
//

import UIKit

protocol PageIndexDelegate {
    func updatePageIndex(currentIndex: Int)
}


class PageViewController: UIPageViewController, UIPageViewControllerDataSource,  UIPageViewControllerDelegate  {
    
    var photoSet = [String]()
    var currentIndex = 0
    
    var indexDelegate: PageIndexDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the data source to itself
        dataSource = self
        delegate = self

        // Create the first image content screen
        if let startingViewController = contentViewController(at: 0) {
        setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }

    }
    
    // MARK: - UIPageViewControllerDataSource methods

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = currentIndex - 1
        if index < 0 {
            return nil
        }
        else {
            currentIndex = index
            return contentViewController(at: currentIndex)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let index = currentIndex + 1
        if index >= photoSet.count {
            return nil
        }
        else {
            currentIndex = index
            return contentViewController(at: currentIndex)
        }
    }
    
    func contentViewController(at index: Int) -> ImageContentViewController? {

        // Create a new view controller and pass suitable data.
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "ImageContentViewController") as? ImageContentViewController {
            
            pageContentViewController.imageName = photoSet[index]
     
            return pageContentViewController
        }
        
        return nil
    }
    
 

    // MARK: - UIPageViewControllerDelegate methods
       
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed {
            indexDelegate?.updatePageIndex(currentIndex: currentIndex)
        }
    }

}
