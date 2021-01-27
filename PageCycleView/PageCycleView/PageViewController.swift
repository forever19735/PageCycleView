//
//  PageViewController.swift
//  PageCycleView
//
//  Created by john.lin on 2021/1/25.
//

import UIKit
import SnapKit

class PageViewController: UIPageViewController {
    private let imageViewControllers: [ImageViewController] = [
        .init(image: UIImage(named: "image1")!),
        .init(image: UIImage(named: "image2")!),
        .init(image: UIImage(named: "image3")!)]
    var currentIndex: Int = 0
    fileprivate var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        startTimer()
    }
    
    func setUp() {
        self.dataSource = self
        self.delegate = self
        if let firstImageVC = imageViewControllers.first {
            setViewControllers([firstImageVC], direction: .forward, animated: false)
        }
    }
    
    func getImageViewController(by index: Int) -> ImageViewController? {
        if index < 0 {
            return imageViewControllers.last
        } else if index >= imageViewControllers.count {
            return imageViewControllers.first
        } else {
            return imageViewControllers[index]
        }
    }
}

extension PageViewController {
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(auto), userInfo: nil, repeats: true)
//        stopTimer()
//        let dispatchTimer = DispatchSource.makeTimerSource()
//        dispatchTimer.schedule(wallDeadline: .now()+1, repeating: 1)
//        dispatchTimer.setEventHandler { [weak self] in
//            DispatchQueue.main.async {
//                self?.auto()
//            }
//        }
//        dispatchTimer.resume()
//
//        timer = dispatchTimer
    }
    
    func stopTimer() {
//        timer?.cancel()
        timer?.invalidate()
//        timer = nil
    }
    
    @objc func auto() {
        currentIndex = (currentIndex == 3 - 1) ? 0 : currentIndex + 1
        print("現在 \(currentIndex)")
        guard let vc = getImageViewController(by: currentIndex) else { return }
        self.setViewControllers([vc], direction: .forward, animated: true, completion: nil)
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        getImageViewController(by: currentIndex - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        getImageViewController(by: currentIndex + 1)
    }
}

extension PageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = viewControllers?.first as? ImageViewController,
              let currentIndex = imageViewControllers.firstIndex(of: currentVC) else {
            return
        }
        self.currentIndex = currentIndex
    }
}
