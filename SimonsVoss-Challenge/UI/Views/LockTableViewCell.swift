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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        lockNameLabel.backgroundColor = .clear
        buildingShortcutLabel.backgroundColor = .clear
        floorLabel.backgroundColor = .clear
        roomNumberLabel.backgroundColor = .clear
    }
    
    func configure(with viewModel: LockCellViewModelType, textToHighlight: String = "") {
        lockNameLabel.text = viewModel.lockName
        buildingShortcutLabel.text = viewModel.buildingShortcut
        floorLabel.text = viewModel.floor
        roomNumberLabel.text = viewModel.roomNumber
        
        highlightTextIfNeeded(textToHighlight, viewModel)
    }
}

extension LockTableViewCell {
    
    private func highlightTextIfNeeded(_ text: String, _ viewModel: LockCellViewModelType) {
        guard !text.isEmpty else { return }
        
        let textToHighlight = text.lowercased()
        
        if viewModel.lockName.lowercased().contains(textToHighlight) {
            lockNameLabel.backgroundColor = .systemGray
        }
        
        if viewModel.buildingShortcut.lowercased().contains(textToHighlight) {
            buildingShortcutLabel.backgroundColor = .systemGray
        }
        
        if viewModel.floor.lowercased().contains(textToHighlight) {
            floorLabel.backgroundColor = .systemGray
        }
        
        if viewModel.roomNumber.lowercased().contains(textToHighlight) {
            roomNumberLabel.backgroundColor = .systemGray
        }
    }
}
