//
//  InjectedView_Util.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 9/4/23.
//

import Foundation
public typealias InjectedContent = () -> InjectedView

public func vStack(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    alignmentKey: String = "",
    spacingKey: String = "",
    content: InjectedContent...) -> InjectedView {
        let content = content.map { $0() }.toTenLengthTuple()
         return   .vStack(viewStore: .init(id: id, modifiers: modifiers, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}

public func hStack(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    alignmentKey: String = "",
    spacingKey: String = "",
    content: InjectedContent...) -> InjectedView {
        let content = content.map { $0() }.toTenLengthTuple()
         return   .hStack(viewStore: .init(id: id, modifiers: modifiers, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}

public func zStack(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    alignmentKey: String = "",
    spacingKey: String = "",
    content: InjectedContent...) -> InjectedView {
        let content = content.map { $0() }.toTenLengthTuple()
         return   .zStack(viewStore: .init(id: id, modifiers: modifiers, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}

public func lazyVStack(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    alignmentKey: String = "",
    spacingKey: String = "",
    content: InjectedContent...) -> InjectedView {
        let content = content.map { $0() }.toTenLengthTuple()
         return   .lazyVStack(viewStore: .init(id: id, modifiers: modifiers, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}

public func lazyHStack(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    alignmentKey: String = "",
    spacingKey: String = "",
    content: InjectedContent...) -> InjectedView {
        let content = content.map { $0() }.toTenLengthTuple()
         return   .lazyHStack(viewStore: .init(id: id, modifiers: modifiers, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}
public func grid(id: String = "",
                 modifiers: [InjectedModifier] = [],
                 alignment: InjectedAlignment? = nil,
                 horizontalSpacing: Double? = nil,
                 verticalSpacing: Double? = nil,
                 content1: InjectedView = .empty(),
                 content2: InjectedView? = nil,
                 content3: InjectedView? = nil,
                 content4: InjectedView? = nil,
                 content5: InjectedView? = nil,
                 content6: InjectedView? = nil,
                 content7: InjectedView? = nil,
                 content8: InjectedView? = nil,
                 content9: InjectedView? = nil,
                 content10: InjectedView? = nil) -> InjectedView {
    .grid(viewStore: .init(id: id, modifiers: modifiers, alignment: alignment, horizontalSpacing: horizontalSpacing, verticalSpacing: verticalSpacing, content1: content1, content2: content2, content3: content3, content4: content4, content5: content5, content6: content6, content7: content7, content8: content8, content9: content9, content10: content10))
}
public func gridRow(id: String = "",
                 modifiers: [InjectedModifier] = [],
                 verticalAlignment: InjectedVerticalAlignment? = nil,
                 content1: InjectedView = .empty(),
                 content2: InjectedView? = nil,
                 content3: InjectedView? = nil,
                 content4: InjectedView? = nil,
                 content5: InjectedView? = nil,
                 content6: InjectedView? = nil,
                 content7: InjectedView? = nil,
                 content8: InjectedView? = nil,
                 content9: InjectedView? = nil,
                 content10: InjectedView? = nil) -> InjectedView {
    .gridRow(viewStore: .init(id: id, modifiers: modifiers, verticalAlignment: verticalAlignment, content1: content1, content2: content2, content3: content3, content4: content4, content5: content5, content6: content6, content7: content7, content8: content8, content9: content9, content10: content10))
}
public func lazyHGrid(id: String = "",
                      modifiers: [InjectedModifier] = [],
                      rows: [InjectedGridItem] = [],
                      verticalAlignment: InjectedVerticalAlignment = .center,
                      spacing: Double? = nil,
                      pinnedViews: InjectedPinnedScrollableViews = .none,
                      content1: InjectedView = .empty(),
                      content2: InjectedView? = nil,
                      content3: InjectedView? = nil,
                      content4: InjectedView? = nil,
                      content5: InjectedView? = nil,
                      content6: InjectedView? = nil,
                      content7: InjectedView? = nil,
                      content8: InjectedView? = nil,
                      content9: InjectedView? = nil,
                      content10: InjectedView? = nil) -> InjectedView {
    .lazyHGrid(viewStore: .init(id: id, modifiers: modifiers, verticalAlignment: verticalAlignment, spacing: spacing, pinnedViews: pinnedViews, content1: content1, content2: content2, content3: content3, content4: content4, content5: content5, content6: content6, content7: content7, content8: content8, content9: content9, content10: content10))
}
public func lazyVGrid(id: String = "",
                      modifiers: [InjectedModifier] = [],
                      columns: [InjectedGridItem] = [],
                      horizontalAlignment: InjectedHorizontalAlignment = .center,
                      spacing: Double? = nil,
                      pinnedViews: InjectedPinnedScrollableViews = .none,
                      content1: InjectedView = .empty(),
                      content2: InjectedView? = nil,
                      content3: InjectedView? = nil,
                      content4: InjectedView? = nil,
                      content5: InjectedView? = nil,
                      content6: InjectedView? = nil,
                      content7: InjectedView? = nil,
                      content8: InjectedView? = nil,
                      content9: InjectedView? = nil,
                      content10: InjectedView? = nil) -> InjectedView {
    .lazyVGrid(viewStore: .init(id: id, modifiers: modifiers, columns: columns, horizontalAlignment: horizontalAlignment, spacing: spacing, pinnedViews: pinnedViews, content1: content1, content2: content2, content3: content3, content4: content4, content5: content5, content6: content6, content7: content7, content8: content8, content9: content9, content10: content10))
}
public func list(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    listKey: String = "",
    content: InjectedContent = { .empty()}) -> InjectedView {
        .list(viewStore: .init(id: id, modifiers: modifiers, listKey: listKey, content: content()))
}

public func forEach(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    forEachKey: String = "",
    content: InjectedContent = { .empty() }) -> InjectedView {
        .forEach(viewStore: .init(id: id, modifiers: modifiers, forEachKey: forEachKey, content: content()))
}

public func text(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    textKey: String = "") -> InjectedView {
        .text(viewStore: .init(id: id, modifiers: modifiers, textKey: textKey))
}

public func field(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    textKey: String = "",
    content: InjectedContent = { .empty()}) -> InjectedView {
        .field(viewStore: .init(id: id, modifiers: modifiers, textKey: textKey, content: content()))
}

public func secureField(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    titleKey: String = "",
    title: String = "",
    textKey: String = "",
    promptKey: String? = nil,
    prompt: String = "") -> InjectedView {
        .secureField(viewStore: .init(id: id, modifiers: modifiers, titleKey: titleKey, title: title, textKey: textKey, promptKey: promptKey, prompt: prompt))
}

public func label(
    id: String = "",
    modifiers: [InjectedModifier],
    titleKey: String = "",
    imageKey: String = "",
    systemImageKey: String = "",
    titleView: InjectedView? = nil,
    iconView: InjectedView? = nil,
    title: String? = nil,
    image: String? = nil,
    systemImage: String? = nil) -> InjectedView {
        .label(viewStore: .init(id: id, modifiers: modifiers, titleKey: titleKey, imageKey: imageKey, systemImageKey: systemImageKey, titleView: titleView, iconView: iconView, title: title, image: image, systemImage: systemImageKey))
}

public func button(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    operation1: InjectedOperation? = nil,
    operation2: InjectedOperation? = nil,
    operation3: InjectedOperation? = nil,
    operation4: InjectedOperation? = nil,
    operation5: InjectedOperation? = nil,
    operation6: InjectedOperation? = nil,
    operation7: InjectedOperation? = nil,
    operation8: InjectedOperation? = nil,
    operation9: InjectedOperation? = nil,
    operation10: InjectedOperation? = nil,
    content: InjectedContent = { .empty()}) -> InjectedView {
    .button(viewStore: .init(id: id, modifiers: modifiers, operation1: operation1, operation2: operation2, operation3: operation3, operation4: operation4, operation5: operation5, operation6: operation6, operation7: operation7, operation8: operation8, operation9: operation9, operation10: operation10, content: content()))
}

public func namedImage(
    id: String = "",
    nameKey: String? = nil,
    modifiers: [InjectedModifier] = []) -> InjectedView {
        .namedImage(viewStore: .init(id: id, nameKey: nameKey, modifiers: modifiers))
}

public func systemImage(
    id: String = "",
    systemNameKey: String? = nil,
    modifiers: [InjectedModifier] = []) -> InjectedView {
        .systemImage(viewStore: .init(id: id, systemNameKey: systemNameKey, modifiers: modifiers))
}

public func asyncImage(
    id: String = "",
    urlKey: String? = nil,
    url: String? = nil,
    scaleKey: String? = nil,
    scale: Double = 1,
    placeholder: InjectedView? = nil,
    modifiers: [InjectedModifier] = []) -> InjectedView {
        .asyncImage(viewStore: .init(id: id, urlKey: urlKey, url: url, scaleKey: scaleKey, scale: scale, placeholder: placeholder, modifiers: modifiers))
}

public func navigationStack(id: String,
                     modifiers: [InjectedModifier],
                     root: InjectedView) -> InjectedView {
    .navigationStack(viewStore: .init(id: id, modifiers:  modifiers, root: root))
}

public func navigationLink(id: String,
                    modifiers: [InjectedModifier],
                    destination: InjectedView,
                    label: InjectedView) -> InjectedView {
    .navigationLink(viewStore: .init(id: id, modifiers: modifiers, destination: destination, label: label))
}

public func tab(id: String,
         modifiers: [InjectedModifier],
         content: InjectedContent...) -> InjectedView {
    let content = content.map { $0() }.toTenLengthTuple()
    return .tab(viewStore: .init(id: id, modifiers: modifiers, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}

public func color(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    colorKey: String = "") -> InjectedView {
        .color(viewStore: .init(id: id, modifiers: modifiers, colorKey: colorKey))
}

public func rectangle(id: String = "", modifiers: [InjectedModifier] = []) -> InjectedView {
    .rectangle(viewStore: .init(id: id, modifiers: modifiers))
}

public func roundedRectangle(
    id: String = "",
    modifiers: [InjectedModifier] = [],
    cornerRadiusKey: String = "",
    widthKey: String = "",
    heightKey: String = "",
    cornerRadius: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    style: InjectedRoundedCornerStyle? = nil) -> InjectedView {
    .roundedRectangle(viewStore: .init(id: id, modifiers: modifiers, cornerRadiusKey: cornerRadiusKey, widthKey: widthKey, heightKey: heightKey, cornerRadius: cornerRadius, width: width, height: height, style: style))
}

public func circle(id: String = "", modifiers: [InjectedModifier] = []) -> InjectedView {
    .circle(viewStore: .init(id: id, modifiers: modifiers))
}

public func ellipse(id: String = "", modifiers: [InjectedModifier] = []) -> InjectedView {
    .ellipse(viewStore: .init(id: id, modifiers: modifiers))
}

public func capsule(id: String = "", modifiers: [InjectedModifier] = [], style: InjectedRoundedCornerStyle? = nil) -> InjectedView {
    .capsule(viewStore: .init(id: id, modifiers: modifiers, style: style))
}

public func spacer(
    id: String = "",
    modifiers: [InjectedModifier] = []) -> InjectedView {
        .spacer(viewStore: .init(id: id, modifiers: modifiers))
}

public func divider(
    id: String = "",
    modifiers: [InjectedModifier] = []) -> InjectedView {
        .divider(viewStore: .init(id: id, modifiers: modifiers))
}
