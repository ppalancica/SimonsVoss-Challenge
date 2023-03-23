//
//  LockListViewController.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 23.03.2023.
//

import UIKit

final class LockListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension LockListViewController {
    
    func setupUI() {}
}
