//
//  TabManager.swift
//  Ecommerce
//
//  Created by Ritesh jung lama on 3/12/2025.
//



import Foundation

enum TabType: Int {
    case home = 0
    case cart = 1
    case favourite = 3
}

@Observable
class TagManager{
    var selectedTag: Int = TabType.home.rawValue;
    
    
    func updateSelectedTag(_ tag: TabType){
        selectedTag = tag.rawValue
    }
}
