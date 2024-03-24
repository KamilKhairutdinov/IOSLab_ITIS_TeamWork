//
//  Observable.swift
//  Bookshelf
//
//  Created by Rustem on 24.03.2024.
//

import UIKit

class Observable<Tvalue> {

    typealias Listener = (Tvalue) -> Void

    var value: Tvalue {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    private var listener: Listener?

    init(_ value: Tvalue) {
        self.value = value
    }

    func bind(_ listener: Listener?) {
        self.listener = listener
    }
}
