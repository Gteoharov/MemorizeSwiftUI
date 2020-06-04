//
//  Array+Only.swift
//  Memorize
//
//  Created by Georgi Teoharov on 4.06.20.
//  Copyright © 2020 CS193p Freelancer. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
