//
//  ImageViewController.swift
//  PageCycleView
//
//  Created by john.lin on 2021/1/25.
//

import UIKit
import SnapKit

class ImageViewController: UIViewController {
    var image: UIImage?
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        setupUI()
    }
    
    func setupUI() {
        self.view.addSubview(imageView)
        
        imageView.snp.makeConstraints({
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            $0.top.bottom.equalToSuperview()
        })
    }
}
