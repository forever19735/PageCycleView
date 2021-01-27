//
//  ViewController.swift
//  PageCycleView
//
//  Created by john.lin on 2021/1/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let pageVC = PageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        self.view.addSubview(pageVC.view)
        self.addChild(pageVC)
        pageVC.view.snp.makeConstraints({
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        })
    }
}
