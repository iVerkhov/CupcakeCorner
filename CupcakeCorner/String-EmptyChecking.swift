//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Игорь Верхов on 10.09.2023.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
