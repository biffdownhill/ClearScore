//
//  Stubbable.swift
//  SynergyTradeCenter
//
//  Created by Edward Downhill on 03/10/2023.
//

import Foundation

protocol Stubbable {
    static func stub() -> Self
}

extension Stubbable {
    func setting<T>(_ keyPath: WritableKeyPath<Self, T>,
                    to value: T) -> Self {
        var stub = self
        stub[keyPath: keyPath] = value
        return stub
    }
}
