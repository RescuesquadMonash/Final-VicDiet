//
//  TutorialSwitch.swift
//  VicDiet
//
//  Created by Ming Yang on 13/5/19.
//  Copyright © 2019 Ming Yang. All rights reserved.
//

import UIKit

class TutorialSwitch: NSObject {

    var physicalInputGuideSwitch: Bool?
    var progressLevelGuideSwitch: Bool?
    var addOptionsGuideSwitch: Bool?
    var mainMenuGuideSwitch: Bool?
    
    init(physicalInputGuideSwitch: Bool, progressLevelGuideSwitch: Bool, addOptionsGuideSwitch: Bool,mainMenuGuideSwitch: Bool) {
        self.physicalInputGuideSwitch = physicalInputGuideSwitch
        self.progressLevelGuideSwitch = progressLevelGuideSwitch
        self.addOptionsGuideSwitch = addOptionsGuideSwitch
        self.mainMenuGuideSwitch = mainMenuGuideSwitch
    }
}
