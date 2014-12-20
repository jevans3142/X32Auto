//
//  group_cue.swift
//  QLab From CSV
//
//  Created by Jay Anslow on 20/12/2014.
//  Copyright (c) 2014 Jay Anslow. All rights reserved.
//

import Foundation

class GroupCue : Cue {
    var cueNumber : String?
    var cueName : String {
        var name = ""
        if comment != nil {
            name += comment! + " "
        }
        if page != nil {
            name += "(" + page! + ") "
        }
        name = name + "<" + getChildrenShortNames() + ">"
        return name
    }
    var cueShortName : String {
        let childCueShortNames = getChildrenShortNames()
        return "\(cueNumber)<\(childCueShortNames)>"
    }
    var children : [Cue]
    var comment : String?
    var page : String?
    var preWait : Float = 0
    
    init(cueNumber : String, comment : String?, page : String?, children : [Cue]) {
        self.cueNumber = cueNumber
        self.comment = comment
        self.page = page
        self.children = children
    }
    func create() {
        // TODO
    }
    
    private func getChildrenShortNames() -> String {
        var names : String = ""
        for cue in children {
            names += cue.cueShortName + "/"
        }
        return names.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "\""))
    }
}