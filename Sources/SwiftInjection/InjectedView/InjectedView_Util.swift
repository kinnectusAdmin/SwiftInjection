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
    alignmentKey: String = "",
    spacingKey: String = "",
    content: InjectedContent...) -> InjectedView {
        let content = content.map { $0() }.toTenLengthTuple()
         return   .vStack(viewStore: .init(id: id, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}

public func hStack(
    id: String = "",
    alignmentKey: String = "",
    spacingKey: String = "",
    content: InjectedContent...) -> InjectedView {
        let content = content.map { $0() }.toTenLengthTuple()
         return  .hStack(viewStore: .init(id: id, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}

public func zStack(
    id: String = "",
    alignmentKey: String = "",
    spacingKey: String = "",
    content: InjectedContent...) -> InjectedView {
        let content = content.map { $0() }.toTenLengthTuple()
         return   .zStack(viewStore: .init(id: id, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}

public func lazyVStack(
    id: String = "",
    alignmentKey: String = "",
    spacingKey: String = "",
    content: InjectedContent...) -> InjectedView {
        let content = content.map { $0() }.toTenLengthTuple()
         return   .lazyVStack(viewStore: .init(id: id, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}

public func lazyHStack(
    id: String = "",
    alignmentKey: String = "",
    spacingKey: String = "",
    content: InjectedContent...) -> InjectedView {
        let content = content.map { $0() }.toTenLengthTuple()
         return   .lazyHStack(viewStore: .init(id: id, alignmentKey: alignmentKey, spacingKey: spacingKey, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}
public func grid(id: String = "",
                 alignment: InjectedAlignment? = nil,
                 horizontalSpacing: Double? = nil,
                 verticalSpacing: Double? = nil,
                 content: InjectedContent...) -> InjectedView {
    let content = content.map { $0() }.toTenLengthTuple()
    return .grid(viewStore: .init(id: id, alignment: alignment, horizontalSpacing: horizontalSpacing, verticalSpacing: verticalSpacing, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}
public func gridRow(id: String = "",
                 verticalAlignment: InjectedVerticalAlignment? = nil,
                    content: InjectedContent...) -> InjectedView {
    let content = content.map { $0() }.toTenLengthTuple()

    return .gridRow(viewStore: .init(id: id, verticalAlignment: verticalAlignment, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}
public func lazyHGrid(id: String = "",
                      rows: [InjectedGridItem] = [],
                      verticalAlignment: InjectedVerticalAlignment = .center,
                      spacing: Double? = nil,
                      pinnedViews: InjectedPinnedScrollableViews = .none,
                      content: InjectedContent...) -> InjectedView {
      let content = content.map { $0() }.toTenLengthTuple()
    return .lazyHGrid(viewStore: .init(id: id, rows: rows, verticalAlignment: verticalAlignment, spacing: spacing, pinnedViews: pinnedViews, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}
public func lazyVGrid(id: String = "",
                      columns: [InjectedGridItem] = [],
                      horizontalAlignment: InjectedHorizontalAlignment = .center,
                      spacing: Double? = nil,
                      pinnedViews: InjectedPinnedScrollableViews = .none,
                      content: InjectedContent...) -> InjectedView {
      let content = content.map { $0() }.toTenLengthTuple()
    return .lazyVGrid(viewStore: .init(id: id, columns: columns, horizontalAlignment: horizontalAlignment, spacing: spacing, pinnedViews: pinnedViews, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}
public func list(
    id: String = "",
    listKey: String,
    content: InjectedContent) -> InjectedView {
        .list(viewStore: .init(id: id, listKey: listKey, content: content()))
}

public func forEach(
    id: String = "",
    forEachKey: String,
    content: InjectedContent) -> InjectedView {
        .forEach(viewStore: .init(id: id, forEachKey: forEachKey, content: content()))
}

public func text(
    id: String = "",
    textKey: String = "",
    text: String? = nil) -> InjectedView {
        .text(viewStore: .init(id: id, textKey: textKey, text: text))
}

public func field(
    id: String = "",
    textKey: String = "",
    content: InjectedContent) -> InjectedView {
        .field(viewStore: .init(id: id, textKey: textKey, content: content()))
}

public func secureField(
    id: String = "",
    titleKey: String = "",
    title: String = "",
    textKey: String = "",
    promptKey: String? = nil,
    prompt: String = "") -> InjectedView {
        .secureField(viewStore:.init(id: id, titleKey: titleKey, title: title, textKey: textKey, promptKey: promptKey, prompt: prompt))
}

public func label(
    id: String = "",
    titleKey: String = "",
    imageKey: String = "",
    systemImageKey: String = "",
    titleView: InjectedView? = nil,
    iconView: InjectedView? = nil,
    title: String? = nil,
    image: String? = nil,
    systemImage: String? = nil) -> InjectedView {
        .label(viewStore: .init(id: id, titleKey: titleKey, imageKey: imageKey, systemImageKey: systemImageKey, title: title, image: image, systemImage: systemImage, iconView: iconView, titleView: titleView))
}

public func button(
    id: String = "",
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
    content: InjectedContent) -> InjectedView {
        .button(viewStore: .init(id: id, operation1: operation1, operation2: operation2, operation3: operation3, operation4: operation4, operation5: operation5, operation6: operation6, operation7: operation7, operation8: operation8, operation9: operation9, operation10: operation10, content: content()))
}

public func namedImage(
    id: String = "",
    nameKey: String? = nil) -> InjectedView {
        .namedImage(viewStore: .init(id: id, nameKey: nameKey))
}

public func systemImage(
    id: String = "",
    systemNameKey: String? = nil) -> InjectedView {
        .systemImage(viewStore: .init(id: id, systemNameKey: systemNameKey))
}

public func asyncImage(
    id: String = "",
    urlKey: String? = nil,
    url: String? = nil,
    scaleKey: String? = nil,
    scale: Double = 1,
    placeholder: InjectedView? = nil) -> InjectedView {
        .asyncImage(viewStore: .init(id: id, urlKey: urlKey, url: url, scaleKey: scaleKey, scale: scale, placeholder: placeholder))
}

public func navigationStack(id: String,
                     root: InjectedView) -> InjectedView {
    .navigationStack(viewStore: .init(id: id, root: root))
}

public func navigationLink(id: String,
                    destination: InjectedView,
                    label: InjectedView) -> InjectedView {
    .navigationLink(viewStore: .init(id: id, destination: destination, label: label))
}

public func tab(id: String,
         modifiers: [InjectedModifier],
         content: InjectedContent...) -> InjectedView {
    let content = content.map { $0() }.toTenLengthTuple()
    return .tab(viewStore: .init(id: id, modifiers: modifiers, content1: content.0, content2: content.1, content3: content.2, content4: content.3, content5: content.4, content6: content.5, content7: content.6, content8: content.7, content9: content.8, content10: content.9))
}

public func color(
    id: String = "",
    colorKey: String = "") -> InjectedView {
        .color(viewStore: .init(id: id, colorKey: colorKey))
}

public func rectangle(id: String = "") -> InjectedView {
    .rectangle(viewStore: .init(id: id))
}

public func roundedRectangle(
    id: String = "",
    cornerRadiusKey: String = "",
    widthKey: String = "",
    heightKey: String = "",
    cornerRadius: Double? = nil,
    width: Double? = nil,
    height: Double? = nil,
    style: InjectedRoundedCornerStyle? = nil) -> InjectedView {
        .roundedRectangle(viewStore: .init(id: id, cornerRadiusKey: cornerRadiusKey, widthKey: widthKey, heightKey: heightKey, cornerRadius: cornerRadius, width: width, height: height, style: style))
}

public func circle(id: String = "") -> InjectedView {
    .circle(viewStore: .init(id: id))
}

public func ellipse(id: String = "") -> InjectedView {
    .ellipse(viewStore: .init(id: id))
}

public func capsule(id: String = "", style: InjectedRoundedCornerStyle? = nil) -> InjectedView {
    .capsule(viewStore: .init(id: id, style: style))
}

public func spacer(
    id: String = "") -> InjectedView {
        .spacer(viewStore: .init(id: id))
}

public func divider(
    id: String = "") -> InjectedView {
        .divider(viewStore: .init(id: id))
}

public func progressView(id: String = "", titleKey: String = "", title: String = "") -> InjectedView {
    .progressView(viewStore: .init(id: id, composition: .title(titleKey: titleKey, title: title)))
}
public func progressView(id: String = "", titleKey: String = "", valueKey: String = "", totalKey: String = "", title: String = "") -> InjectedView {
    .progressView(viewStore: .init(id: id, composition: .title_value(titleKey: titleKey, valueKey: valueKey, totalKey: totalKey, title: title)))
}
public func progressView(id: String = "", label: InjectedView) -> InjectedView {
    .progressView(viewStore: .init(id: id, composition: .label(label)))
}
public func progressView(id: String = "", lowerDate: Date, upperDate: Date) -> InjectedView {
        .progressView(viewStore: .init(id: id, composition: .timerInterval(lowerDate: lowerDate, upperDate: upperDate)))
}
public func progressView(id: String = "", lowerDate: Date, upperDate: Date, label: InjectedView) -> InjectedView {
            .progressView(viewStore: .init(id: id, composition: .timerInterval_label(lowerDate: lowerDate, upperDate: upperDate, label: label)))
}
public func progressView(id: String = "", lowerDate: Date, upperDate: Date, countsdown: Bool, label: InjectedView, currentValueLabel: InjectedView) -> InjectedView {
                .progressView(viewStore: .init(id: id, composition: .timerInterval_countsdown_label_currentValueLabel(lowerDate: lowerDate, upperDate: upperDate, countsdown: countsdown, label: label, currentValueLabel: currentValueLabel)))
}

public func progressView(id: String = "") -> InjectedView {
                    .progressView(viewStore: .init(id: id, composition: .standard))
}

public func progressView(id: String = "", valueKey: String, totalKey: String) -> InjectedView {
                        .progressView(viewStore: .init(id: id, composition: .value_total(valueKey: valueKey, totalKey: totalKey)))
}

public func progressView(id: String = "",valueKey: String, totalKey: String, label: InjectedView) -> InjectedView {
                            .progressView(viewStore: .init(id: id, composition: .value_total_label(valueKey: valueKey, totalKey: totalKey, label: label)))
}

public func progressView(id: String = "", modifiers: [InjectedModifier] = [], valueKey: String , totalKey: String, label: InjectedView, currentValueLabel: InjectedView) -> InjectedView {
    .progressView(viewStore: .init(id: id, composition: .value_total_label_currentValueLabel(valueKey: valueKey, totalKey: totalKey, label: label, currentValueLabel: currentValueLabel)))
}
public func table(id: String = "",
                  tableStateKey: String,
                  viewStore1: TableColumnViewStore? = nil,
                  viewStore2: TableColumnViewStore? = nil,
                  viewStore3: TableColumnViewStore? = nil,
                  viewStore4: TableColumnViewStore? = nil,
                  viewStore5: TableColumnViewStore? = nil) -> InjectedView {
    .standardTable(viewStore: .init(id: id, tableStateKey: tableStateKey, standardTable: .init(viewStore1: viewStore1, viewStore2: viewStore2, viewStore3: viewStore3, viewStore4: viewStore4, viewStore5: viewStore5)))
}

public func table(id: String = "",
                  tableStateKey: String,
                  viewStore1: TableColumnRowViewStore? = nil,
                  viewStore2: TableColumnRowViewStore? = nil,
                  viewStore3: TableColumnRowViewStore? = nil,
                  viewStore4: TableColumnRowViewStore? = nil,
                  viewStore5: TableColumnRowViewStore? = nil) -> InjectedView {
    .customTable(viewStore: .init(id: id, tableStateKey: tableStateKey, customTable: .init(viewStore1: viewStore1, viewStore2: viewStore2, viewStore3: viewStore3, viewStore4: viewStore4, viewStore5: viewStore5)))
}

public func group(id: String = "", content: InjectedContent...) -> InjectedView {
    let content = content.map { $0() }.toTenLengthTuple()
    return .group(viewStore: .init(id: id, content: .init(content.0, content.1, content.2, content.3, content.4, content.5, content.6, content.7, content.8, content.9)))
}
public func controlGroup(id: String = "", content: InjectedContent...) -> InjectedView {
    let content = content.map { $0() }.toTenLengthTuple()
    return .controlGroup(viewStore: .init(id: id, composition: .standard, content: .init(content.0, content.1, content.2, content.3, content.4, content.5, content.6, content.7, content.8, content.9)))
}

public func controlGroup(id: String = "", label: InjectedView, content: InjectedContent...) -> InjectedView {
    let content = content.map { $0() }.toTenLengthTuple()
    return .controlGroup(viewStore: .init(id: id, composition: .withLabel(label), content: .init(content.0, content.1, content.2, content.3, content.4, content.5, content.6, content.7, content.8, content.9)))
}

public func form(id: String = "", content: InjectedContent...) -> InjectedView {
    let content = content.map { $0() }.toTenLengthTuple()
    return .form(viewStore: .init(id: id, content: .init(content.0, content.1, content.2, content.3, content.4, content.5, content.6, content.7, content.8, content.9)))
}

public func section(id: String = "", composition: SectionViewStore.SectionComposition, content: InjectedContent...) -> InjectedView {
    let content = content.map { $0() }.toTenLengthTuple()
    return .section(viewStore: .init(id: id, composition: composition, content: .init(content.0, content.1, content.2, content.3, content.4, content.5, content.6, content.7, content.8, content.9)))
}

public func geometryReader(id: String = "", geometryProxyWidthKey: String, geometryProxyHeightKey: String, geometryProxyBottomKey: String, geometryProxyLeadingKey: String, geometryProxyTopKey: String, geometryTopKey: String, geometryProxyTrailingKey: String, content: InjectedView) -> InjectedView {
    return .geometryReader(viewStore: .init(id: id, geometryProxyWidthKey: geometryProxyWidthKey, geometryProxyHeightKey: geometryProxyHeightKey, geometryProxyBottomKey: geometryProxyBottomKey, geometryProxyLeadingKey: geometryProxyLeadingKey, geometryProxyTopKey: geometryProxyTopKey, geometryProxyTrailingKey: geometryProxyTrailingKey, content: content))
}

public func picker(id: String = "", pickerListKey: String, selectionKey: String, composition: PickerViewStore.PickerComposition) -> InjectedView {
    .picker(viewStore: .init(id: id, pickerListKey: pickerListKey, selectionKey: selectionKey, composition: composition))
}

public func datePicker(id: String = "", composition: DatePickerViewStore.DatePickerComposition) -> InjectedView {
    .datePicker(viewStore: .init(id: id, composition: composition))
}

public func scrollView(id: String = "", axes: InjectedAxes = .vertical, showsIndicators: Bool = false, content: InjectedContent...) -> InjectedView {
    let content = content.map { $0() }.toTenLengthTuple()
    return .scrollView(viewStore: .init(id: id, axes: axes, showsIndicators: showsIndicators, content:  .init(content.0, content.1, content.2, content.3, content.4, content.5, content.6, content.7, content.8, content.9)))
}
