//
//  CardModel.swift
//  Developers
//
//  Created by Kathiravan Murali on 23/01/24.
//

import SwiftUI

struct Card : Identifiable
{
    var id = UUID()
    var title : String
    var headline : String
    var imageName : String
    var callToAction : String
    var message : String
    var gradientColors : [Color]
}
