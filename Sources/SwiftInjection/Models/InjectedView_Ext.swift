//
//  InjectedView_Ext.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/15/23.
//

import Foundation

public extension InjectedView {
    
    public func systemFont(stateId: String = "", nameId: String = "", description: String = "") -> InjectedView {
        self.addModifier(modifier: .systemFont(stateId: stateId, nameId: nameId, description: description))
    }
    public func font(stateId: String = "", nameId: String = "", sizeId: String = "", fontName: String? = nil, fontSize: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .font(stateId: stateId, nameId: nameId, sizeId: sizeId, fontName: fontName, fontSize: fontSize))
    }
    public func width(stateId: String = "", widthId: String = "", width: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .width(stateId: stateId, widthId: widthId, width: width))
    }
    public func height(stateId: String = "", heightId: String = "", height: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .height(stateId: stateId, heightId: heightId, height: height))
    }
    public func minWidth(stateId: String = "", widthId: String = "", width: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .minWidth(stateId: stateId, widthId: widthId, width: width))
    }
    public func maxWidth(stateId: String = "", widthId: String = "", width: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .maxWidth(stateId: stateId, widthId: widthId, width: width))
    }
    public func minHeight(stateId: String = "", heightId: String = "", height: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .minHeight(stateId: stateId, heightId: heightId, height: height))
    }
    public func maxHeight(stateId: String = "", heightId: String = "", height: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .maxHeight(stateId: stateId, heightId: heightId, height: height))
    }
    public func idealWidth(stateId: String = "", widthId: String = "", width: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .idealWidth(stateId: stateId, widthId: widthId, width: width))
    }
    public func idealHeight(stateId: String = "", heightId: String = "", height: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .idealHeight(stateId: stateId, heightId: heightId, height: height))
    }
    public func alignment(stateId: String = "", alignmentId: String = "", alignment: ZStackAlignment? = nil) -> InjectedView {
        self.addModifier(modifier: .alignment(stateId: stateId, alignmentId: alignmentId, alignment: alignment))
    }
    public func padding(stateId: String = "", edgeSetId: String = "", lengthId: String = "", edgeSet: InjectedEdgeSet? = nil, length: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .padding(stateId: stateId, edgeSetId: edgeSetId, lengthId: lengthId, edgeSet: edgeSet, length: length))
    }
    
    
    
    
    
    
    
    
    
    
    
    public func cornerRadius(stateId: String = "", valueId: String = "", radius: Double? = nil) -> InjectedView {
        self.addModifier(modifier: .cornerRadius(stateId: stateId, valueId: valueId, radius: radius))
    }
    
    public func borderline(stateId: String = "", widthId: String = "", colorId: String = "", width: Double? = nil, colorHex: String? = nil) -> InjectedView {
        self.addModifier(modifier: .borderline(stateId: stateId, widthId: widthId, colorId: colorId, width: width, colorHex: colorHex))
    }
    
    public func foregroundColor(stateId: String = "", valueId: String = "", colorHex: String? = nil) -> InjectedView {
        self.addModifier(modifier: .foregroundColor(stateId: stateId, valueId: valueId, colorHex: colorHex))
    }
    
    public func background(content: InjectedView, alignment: ZStackAlignment? = nil) -> InjectedView {
        self.addModifier(modifier: .background(content: content, alignment: alignment))
    }
    
    public func fullScreenCover(viewStore: InjectedView, isPresentedKey: String) -> InjectedView {
        self.addModifier(modifier: .fullScreenCover(viewStore: viewStore, isPresentedKey: isPresentedKey))
    }
    
    public func sheet(viewStore: InjectedView, isPresentedKey: String) -> InjectedView {
        self.addModifier(modifier: .sheet(viewStore: viewStore, isPresentedKey: isPresentedKey))
    }
}
