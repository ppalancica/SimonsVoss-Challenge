//
//  LockTableViewCell.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 29.03.2023.
//

import UIKit

final class LockTableViewCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }

    @IBOutlet private weak var lockNameLabel: UILabel!
    @IBOutlet private weak var buildingShortcutLabel: UILabel!
    @IBOutlet private weak var floorLabel: UILabel!
    @IBOutlet private weak var roomNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure(with viewModel: LockCellViewModelType) {
        lockNameLabel.text = viewModel.lockName
        buildingShortcutLabel.text = viewModel.buildingShortcut
        floorLabel.text = viewModel.floor
        roomNumberLabel.text = viewModel.roomNumber
    }
}
