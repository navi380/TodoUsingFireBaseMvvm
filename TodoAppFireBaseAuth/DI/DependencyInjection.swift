//
//  DependencyInjection.swift
//  TodoAppFireBaseAuth
//
//  Created by Naveed Tahir on 06/10/2021.
//

import Foundation

class Injection{
    public static let provide = Injection()

    func SignupViewModelInjection() -> SignupViewModel{
        return SignupViewModel(repository: FireBaseDataRepository.shared)
    }
    
    func LoginViewModelInjection() -> LoginViewModel{
        return LoginViewModel(repository: FireBaseDataRepository.shared)
    }
    
    func TodoViewModelInjection() -> TodoViewModel{
        return TodoViewModel(repository: PostDataRepository.shared)
    }
    
}

