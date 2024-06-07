//
//  LoginViewModel.swift
//  34th-SOPT-Assignment
//
//  Created by 오연서 on 6/7/24.
//

import UIKit

 final class LoginViewModel {
          
     var errMessage: ((String?) -> Void)?
     let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
     let pwRegEx = "[A-Za-z0-9!_@$%^&+=]{8,20}"


     func checkValid(id: String?, password: String?) -> Bool {
         
         guard let id = id, !id.isEmpty else {
             errMessage?("아이디가 비어있습니다.")
             return false
         }
         guard let password = password, !password.isEmpty else {
             errMessage?("비밀번호가 비어있습니다.")
             return false
         }
         
         if id.range(of: emailRegEx, options: .regularExpression) == nil {
             errMessage?("아이디가 유효하지 않습니다.")
             return true
         }

         if password.range(of: pwRegEx, options: .regularExpression) == nil {
             errMessage?("비밀번호가 유효하지 않습니다.")
             return true
         }
         
         return false
//         isValid?(true)
     }
 }
