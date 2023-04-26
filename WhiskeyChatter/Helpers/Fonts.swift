//
//  Fonts.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 4/20/23.
//

import Foundation
import SwiftUI

extension Font {
    public static var header: Font {
        return Font.custom("Bebas Neue", size: 30)
    }
    
    public static var currentUserDisplay: Font {
        return Font.custom("Bebas Neue", size: 14)
    }
    
    public static var tabBar: Font {
        return Font.custom("Bebas Neue", size: 15)
    }
    
    public static var feedText: Font {
        return Font.custom("Bebas Neue", size: 18)
    }
    
    public static var feedReplyCount: Font {
        return Font.custom("Bebas Neue", size: 12)
    }
    
    public static var bodyParagraph: Font {
        return Font.custom("LexendDeca-Regular", size: 14)
    }
    
    public static var button: Font {
        return Font.custom("LexendDeca-SemiBold", size: 14)
    }
    
    public static var smallText: Font {
        return Font.custom("LexendDeca-Regular", size: 10)
    }
    
    public static var settings: Font {
        return Font.custom("LexendDeca-Regular", size: 16)
    }
    
    public static var titleText: Font {
        return Font.custom("LexendDeca-Bold", size: 23)
    }
    
    public static var pageTitle: Font {
        return Font.custom("LexendDeca-SemiBold", size: 33)
    }
    
    public static var chatHeading: Font {
        return Font.custom("LexendDeca-SemiBold", size: 19)
    }
    
    public static var chatName: Font {
        return Font.custom("LexendDeca-SemiBold", size: 12)
    }
}
