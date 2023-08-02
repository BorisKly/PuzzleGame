//
//  Container.swift
//  Puzzle23
//
//  Created by Borys Klykavka on 08.07.2023.
//

import Foundation
import XServiceLocator

private var container = Container()

public func resolve<T>(_ item: T.Type) -> T {
    guard let value = try? container.resolve(item) else {
        fatalError("Can't find \(item)")
    }
    return value
}

public func register<T>(_ instance: T, for type: T.Type) {
    container = container.register(type, instance: instance)
}
