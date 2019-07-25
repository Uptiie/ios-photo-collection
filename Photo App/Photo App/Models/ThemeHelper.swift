//
//  ThemeHelper.swift
//  Photo App
//
//  Created by Uptiie on 7/25/19.
//  Copyright © 2019 Walcenberg, Inc. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "themePreferenceKey"
    var themePreference: String? {
       let userDefaults = UserDefaults.standard
        let chosenTheme = userDefaults.string(forKey: themePreferenceKey)
        return chosenTheme
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Light", forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
}
