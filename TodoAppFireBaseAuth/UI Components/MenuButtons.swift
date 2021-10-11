//
//  MenuButtons.swift
//  TodoAppFireBaseAuth
//
//  Created by Naveed Tahir on 07/10/2021.
//

import Foundation
import UIKit

enum MenuBtnType: String{
    case TodoList
    case Todo
}

class MenuButton: RoundButton{
    
    func setListMbBtnLayout(){
        setTitleColor(.white, for: .normal)
        backgroundColor  = App.Color.mbListBtnBackground
    }
    
    func setTodoMbBtnLayout(){
        setTitleColor(.black, for: .normal)
        backgroundColor  = App.Color.mbtodoBtnBackground
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
