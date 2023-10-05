//
//  InjectedModifierModels.swift
//  
//
//  Created by Blake Osonduagwueki on 9/25/23.
//

import Foundation
import SwiftUI

public enum InjectedFontDesign: String, Codable  {
    case none
    var render: Font.Design {
        return .default
    }
}
public enum InjectedFontWidth: String, Codable {
    case none
    var render: Font.Width {
        return .compressed
    }
}
public enum InjectedTextLineStylePattern: String, Codable {
    case none
    var render: Text.LineStyle.Pattern {
        return .dash
    }
}
public enum InjectedTextTruncation: String, Codable {
    case none
    var render: Text.TruncationMode {
        return .head
    }
}
public enum InjectedBlendMode: String, Codable {
    case  none
    var render: BlendMode {
        .color
    }
}
public enum InjectedTextAlignment: String, Codable {
    case none
    var render: TextAlignment {
        .center
    }
}
public enum InjectedImageScale: String, Codable {
    case none
    var render: Image.Scale {
        .medium
    }
}
public enum InjectedAnimation: String, Codable {
    case none
    var render: Animation {
        return .default
    }
}
public enum InjectedButtonStyle: String, Codable {
    case none
    var render: any PrimitiveButtonStyle {
        DefaultButtonStyle()
    }
}
public enum InjectedProgressViewStyle: String, Codable {
    case none
}
public enum InjectedPickerStyle: String, Codable {
    case none
    var render: any PickerStyle {
        DefaultPickerStyle()
    }
}
public enum InjectedSymbolRenderingMode: String, Codable {
    case none
    var render: SymbolRenderingMode {
        .hierarchical
    }
}
public enum InjectedResizingMode: String, Codable {
    case none
    var render: Image.ResizingMode {
        .stretch
    }
}
public enum InjectedImageRenderingMode: String, Codable {
    case none
    var render: Image.TemplateRenderingMode {
        .original
    }
}
public enum InjectdDatePickerStyle: String, Codable {
    case none
    var render: any DatePickerStyle {
        DefaultDatePickerStyle()
    }
}
 
public enum InjectedVisbility: String, Codable {
    case none
    var render: Visibility {
        Visibility.automatic
    }
}

public enum InjectedPopoverAttachmentAnchor: String, Codable {
    case none
    var render: PopoverAttachmentAnchor {
        .point(.bottom)
    }
}

public enum InjectedEdge: String, Codable {
    case none
    var render: Edge {
        .bottom
    }
}

public enum InjectedKeyboardType: String, Codable {
    case none
    var render: UIKeyboardType {
        .default
    }
}

public enum InjectedTextInputAutoCapitalization: String, Codable {
    case none
    var render: TextInputAutocapitalization {
        .never
    }
}

public enum InjectedTextContentType: String, Codable {
    case none
    var render: UITextContentType {
        .name
    }
}

public enum InjectedRoundedCornerStyle: String, Codable {
    case none
    var render: RoundedCornerStyle {
        .circular
    }
}
