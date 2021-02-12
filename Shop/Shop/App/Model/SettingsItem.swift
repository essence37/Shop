//
//  SettingsItem.swift
//  Shop
//
//  Created by Пазин Даниил on 23.01.2021.
//

import UIKit

enum SettingsUnit {
    case profile
}

struct SettingsItem {
    let image: UIImage
    let title: String
    let unit: SettingsUnit
    
    static func allSettingItems() -> [SettingsItem] {
        return [
            SettingsItem(image: UIImage(systemName: "person")!, title: "Profile", unit: .profile)
        ]
    }
    
}
