//
//  InjectedViewStore.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/17/23.
//

import Foundation
import Combine

indirect public enum InjectedView: Codable, Hashable {
   
    static public func == (lhs: InjectedView, rhs: InjectedView) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    case vStack(viewStore: VStackViewStore)
    case hStack(viewStore: HStackViewStore)
    case zStack(viewStore: ZStackViewStore)
    case lazyVStack(viewStore: VStackViewStore)
    case lazyHStack(viewStore: HStackViewStore)
    case grid(viewStore: GridViewStore)
    case gridRow(viewStore: GridRowViewStore)
    case lazyHGrid(viewStore: LazyHGridViewStore)
    case lazyVGrid(viewStore: LazyVGridViewStore)
    case list(viewStore: ListViewStore)
    case forEach(viewStore: ForEachViewStore)
    case text(viewStore: TextViewStore)
    case field(viewStore: FieldViewStore)
    case secureField(viewStore: SecureFieldViewStore)
    case label(viewStore: LabelViewStore)
    case button(viewStore: ButtonViewStore)
    case namedImage(viewStore: ImageViewStore)
    case systemImage(viewStore: ImageViewStore)
    case asyncImage(viewStore: ImageViewStore)
    case navigationStack(viewStore: NavigationStackViewStore)
    case navigationLink(viewStore:  NavigationLinkViewStore)
    case tab(viewStore: TabViewStore)
    case color(viewStore: ColorViewStore)
    case rectangle(viewStore: RectangleViewStore)
    case roundedRectangle(viewStore: RoundedRectangleViewStore)
    case circle(viewStore: CircleViewStore)
    case ellipse(viewStore: EllipseViewStore)
    case capsule(viewStore: CapsuleViewStore)
    case spacer(viewStore: SpacerViewStore)
    case divider(viewStore: DividerViewStore)
    case `if`(viewStore: IfViewStore)
    case progressView(viewStore: ProgressViewStore)
    case standardTable(viewStore: StandardTableViewStore)
    case customTable(viewStore: CustomTableViewStore)
    case group(viewStore: GroupViewStore)
    case controlGroup(viewStore: ControlGroupViewStore)
    case form(viewStore: FormViewStore)
    case section(viewStore: SectionViewStore)
    case geometryReader(viewStore: GeometryReaderViewStore)
    case picker(viewStore: PickerViewStore)
    case datePicker(viewStore: DatePickerViewStore)
    case scrollView(viewStore: ScrollViewStore)
    // case `ifLet`(conditionKey: String, modifiers: [InjectedModifier], content: InjectedViewStore)
    // case `switch`(  conditionKey: String,
    //                 modifiers: [InjectedModifier],
    //                 caseContent1: InjectedViewStore,
    //                 caseContent2: InjectedViewStore,
    //                 caseContent3: InjectedViewStore,
    //                 caseContent4: InjectedViewStore,
    //                 caseContent5: InjectedViewStore,
    //                 caseContent6: InjectedViewStore,
    //                 caseContent7: InjectedViewStore,
    //                 caseContent8: InjectedViewStore,
    //                 caseContent9: InjectedViewStore,
    //                 caseContent10: InjectedViewStore)
    // case `ifElse`(conditionKey: String, modifiers: [InjectedModifier], content: InjectedViewStore, elseContent: InjectedViewStore)
    // case `ifLetElse`(conditionKey: String, modifiers: [InjectedModifier], content: InjectedViewStore, elseContent: InjectedViewStore)
    // case `ifElseIfElese`(conditionKey: String, modifiers: [InjectedModifier], content: InjectedViewStore, elseIfContent: InjectedViewStore, elseContent: InjectedViewStore)
    case viewStoreReference(id: String)
    case empty(id: String = "")
    public var id: String {
        switch self {
        case .viewStoreReference(let id), .empty(let id):
            return id
        case .vStack(let viewStore):
            return viewStore.id
        case .hStack(let viewStore):
            return viewStore.id
        case .zStack(let viewStore):
            return viewStore.id
        case .lazyVStack(let viewStore):
            return viewStore.id
        case .lazyHStack(let viewStore):
            return viewStore.id
        case .grid(let viewStore):
            return viewStore.id
        case .gridRow(let viewStore):
            return viewStore.id
        case .lazyHGrid(let viewStore):
            return viewStore.id
        case .lazyVGrid(let viewStore):
            return viewStore.id
        case .list(let viewStore):
            return viewStore.id
        case .forEach(let viewStore):
            return viewStore.id
        case .text(let viewStore):
            return viewStore.id
        case .field(let viewStore):
            return viewStore.id
        case .secureField(let viewStore):
            return viewStore.id
        case .label(let viewStore):
            return viewStore.id
        case .button(let viewStore):
            return viewStore.id
        case .namedImage(let viewStore):
            return viewStore.id
        case .systemImage(let viewStore):
            return viewStore.id
        case .asyncImage(let viewStore):
            return viewStore.id
        case .navigationStack(let viewStore):
            return viewStore.id
        case .navigationLink(let viewStore):
            return viewStore.id
        case .tab(let viewStore):
            return viewStore.id
        case .color(let viewStore):
            return viewStore.id
        case .rectangle(let viewStore):
            return viewStore.id
        case .roundedRectangle(let viewStore):
            return viewStore.id
        case .circle(let viewStore):
            return viewStore.id
        case .ellipse(let viewStore):
            return viewStore.id
        case .capsule(let viewStore):
            return viewStore.id
        case .spacer(let viewStore):
            return viewStore.id
        case .divider(let viewStore):
            return viewStore.id
        case .if(let viewStore):
            return viewStore.id
        case .progressView(let viewStore):
            return viewStore.id
        case .standardTable(let viewStore):
            return viewStore.id
        case .customTable(let viewStore):
            return viewStore.id
        case .group(let viewStore):
            return viewStore.id
        case .controlGroup(let viewStore):
            return viewStore.id
        case .form(let viewStore):
            return viewStore.id
        case .section(let viewStore):
            return viewStore.id
        case .geometryReader(let viewStore):
            return viewStore.id
        case .picker(let viewStore):
            return viewStore.id
        case .datePicker(let viewStore):
            return viewStore.id
        case .scrollView(let viewStore):
            return viewStore.id
        }
    }
    var modifiers: [InjectedModifier] {
        get {
            switch self {
            case .viewStoreReference, .if, .empty:
                return []
            case .vStack(let viewStore):
                return viewStore.modifiers
            case .hStack(let viewStore):
                return viewStore.modifiers
            case .zStack(let viewStore):
                return viewStore.modifiers
            case .list(let viewStore):
                return viewStore.modifiers
            case .forEach(let viewStore):
                return viewStore.modifiers
            case .text(let viewStore):
                return viewStore.modifiers
            case .field(let viewStore):
                return viewStore.modifiers
            case .secureField(let viewStore):
                return viewStore.modifiers
            case .label(let viewStore):
                return viewStore.modifiers
            case .button(let viewStore):
                return viewStore.modifiers
            case .namedImage(let viewStore):
                return viewStore.modifiers
            case .systemImage(let viewStore):
                return viewStore.modifiers
            case .asyncImage(let viewStore):
                return viewStore.modifiers
            case .tab(let viewStore):
                return viewStore.modifiers
            case .navigationStack(let viewStore):
                return viewStore.modifiers
            case .navigationLink(let viewStore):
                return viewStore.modifiers
            case let .lazyVStack(viewStore):
                return viewStore.modifiers
            case let .lazyHStack(viewStore):
                return viewStore.modifiers
            case let .grid(viewStore):
                return viewStore.modifiers
            case let .gridRow(viewStore):
                return viewStore.modifiers
            case let .lazyHGrid(viewStore):
                return viewStore.modifiers
            case let .lazyVGrid(viewStore):
                return viewStore.modifiers
            case .color(let viewStore):
                return viewStore.modifiers
            case .rectangle(let viewStore):
                return viewStore.modifiers
            case .circle(let viewStore):
                return viewStore.modifiers
            case .ellipse(let viewStore):
                return viewStore.modifiers
            case .capsule(let viewStore):
                return viewStore.modifiers
            case .roundedRectangle(let viewStore):
                return viewStore.modifiers
            case .spacer(let viewStore):
                return viewStore.modifiers
            case .divider(let viewStore):
                return viewStore.modifiers
            case .progressView(viewStore: let viewStore):
                return viewStore.modifiers
            case .standardTable(let viewStore):
                return viewStore.modifiers
            case .customTable(let viewStore):
                return viewStore.modifiers
            case .group(let viewStore):
                return viewStore.modifiers
            case .controlGroup(let viewStore):
                return viewStore.modifiers
            case .form(let viewStore):
                return viewStore.modifiers
            case .section(let viewStore):
                return viewStore.modifiers
            case .geometryReader(let viewStore):
                return viewStore.modifiers
            case .picker(let viewStore):
                return viewStore.modifiers
            case .datePicker(let viewStore):
                return viewStore.modifiers
            case .scrollView(let viewStore):
                return viewStore.modifiers

            }

        }
        set {
            switch self {
            case .viewStoreReference, .if, .empty:
                break
            case .vStack(let viewStore):
                self = .vStack(viewStore: .init(id: viewStore.id, modifiers: newValue, alignmentKey: viewStore.alignmentKey, spacingKey: viewStore.spacingKey, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
            case .hStack(let viewStore):
                self = .hStack(viewStore: .init(id: viewStore.id, modifiers: newValue, alignmentKey: viewStore.alignmentKey, spacingKey: viewStore.spacingKey, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
            case .zStack(let viewStore):
                self = .zStack(viewStore: .init(id: viewStore.id, modifiers: newValue, alignmentKey: viewStore.alignmentKey, spacingKey: viewStore.spacingKey, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
            case .list(let viewStore):
                self = .list(viewStore: .init(id: viewStore.id, modifiers: newValue, listKey: viewStore.listKey, content: viewStore.content))
            case .forEach(let viewStore):
                self = .forEach(viewStore: .init(id: viewStore.id, modifiers: newValue, forEachKey: viewStore.forEachKey, content: viewStore.content))
            case .text(let viewStore):
                self = .text(viewStore: .init(id: viewStore.id, modifiers: newValue, textKey: viewStore.textKey))
            case .field(let viewStore):
                self = .field(viewStore: .init(id: viewStore.id, modifiers: newValue, textKey: viewStore.textKey, content: viewStore.content))
            case .secureField(let viewStore):
                self = .secureField(viewStore: .init(id: viewStore.id, modifiers: newValue, textKey: viewStore.textKey))
            case .label(let viewStore):
                self = .label(viewStore: .init(id: viewStore.id, modifiers: newValue, titleKey: viewStore.titleKey, imageKey: viewStore.imageKey, systemImageKey: viewStore.systemImageKey, title: viewStore.title, image: viewStore.image, systemImage: viewStore.systemImage, iconView: viewStore.iconView, titleView: viewStore.titleView))
            case .button(let viewStore):
                self = .button(viewStore: .init(id: viewStore.id, modifiers: newValue, operation1: viewStore.operation1, operation2: viewStore.operation2, operation3: viewStore.operation3, operation4: viewStore.operation4, operation5: viewStore.operation5, operation6: viewStore.operation6, operation7: viewStore.operation7, operation8: viewStore.operation8, operation9: viewStore.operation9, operation10: viewStore.operation10, content: viewStore.content))
            case .namedImage(let viewStore):
                self = .namedImage(viewStore: .init(id: viewStore.id, modifiers: newValue, name: viewStore.name, systemName: viewStore.systemName))
            case .systemImage(let viewStore):
                self = .systemImage(viewStore: .init(id: viewStore.id, modifiers: newValue, name: viewStore.name, systemName: viewStore.systemName))
            case .asyncImage(let viewStore):
                self = .asyncImage(viewStore: .init(id: viewStore.id, modifiers: newValue, nameKey: viewStore.nameKey, name: viewStore.name, systemNameKey: viewStore.systemNameKey, systemName: viewStore.systemName, urlKey: viewStore.urlKey, url: viewStore.url, scaleKey: viewStore.scaleKey, scale: viewStore.scale, placeholder: viewStore.placeholder))
            case .tab(let viewStore):
                self = .tab(viewStore: .init(id: viewStore.id, modifiers: newValue, content1: viewStore.content1, content2: viewStore.content1, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5 , content6: viewStore.content6 , content7: viewStore.content7 , content8: viewStore.content8 , content9: viewStore.content9 , content10: viewStore.content10))
            case .navigationStack(let viewStore):
                self = .navigationStack(viewStore: .init(id: viewStore.id, modifiers: newValue, root: viewStore.root))
            case .navigationLink(let viewStore):
                self = .navigationLink(viewStore: .init(id: viewStore.id, modifiers: newValue, destination: viewStore.destination, label: viewStore.label))
            case let .lazyVStack(viewStore):
                self = .lazyVStack(viewStore: .init(id: viewStore.id, modifiers: newValue, alignmentKey: viewStore.alignmentKey, spacingKey: viewStore.spacingKey, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
            case let .lazyHStack(viewStore):
                self = .lazyHStack(viewStore: .init(id: viewStore.id, modifiers: newValue, alignmentKey: viewStore.alignmentKey, spacingKey: viewStore.spacingKey, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
            case let .grid(viewStore):
                self = .grid(viewStore: .init(id: viewStore.id, modifiers: newValue, alignment: viewStore.alignment, horizontalSpacing: viewStore.horizontalSpacing, verticalSpacing: viewStore.verticalSpacing, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
            case let .gridRow(viewStore):
                self = .gridRow(viewStore: .init(id: viewStore.id, modifiers: newValue, verticalAlignment: viewStore.verticalAlignment, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
            case let .lazyHGrid(viewStore):
                self = .lazyHGrid(viewStore: .init(id: viewStore.id, modifiers: newValue, rows: viewStore.rows, verticalAlignment: viewStore.verticalAlignment, spacing: viewStore.spacing, pinnedViews: viewStore.pinnedViews, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
            case let .lazyVGrid(viewStore):
                self = .lazyVGrid(viewStore: .init(id: viewStore.id, modifiers: newValue, columns: viewStore.columns, horizontalAlignment: viewStore.horizontalAlignment, spacing: viewStore.spacing, pinnedViews: viewStore.pinnedViews, content1: viewStore.content1, content2: viewStore.content2, content3: viewStore.content3, content4: viewStore.content4, content5: viewStore.content5, content6: viewStore.content6, content7: viewStore.content7, content8: viewStore.content8, content9: viewStore.content9, content10: viewStore.content10))
            case .color(let viewStore):
                self = .color(viewStore: .init(id: viewStore.id, modifiers: newValue, colorKey: viewStore.colorKey))
            case .rectangle(let viewStore):
                self = .rectangle(viewStore: .init(id: viewStore.id, modifiers: newValue))
            case .circle(let viewStore):
                self = .circle(viewStore: .init(id: viewStore.id, modifiers: newValue))
            case .ellipse(let viewStore):
                self = .ellipse(viewStore: .init(id: viewStore.id, modifiers: newValue))
            case .capsule(let viewStore):
                self = .capsule(viewStore: .init(id: viewStore.id, modifiers: newValue, style: viewStore.style))
            case .roundedRectangle(let viewStore):
                self = .roundedRectangle(viewStore: .init(id: viewStore.id, modifiers: viewStore.modifiers, cornerRadiusKey: viewStore.cornerRadiusKey, widthKey: viewStore.widthKey, heightKey: viewStore.heightKey, cornerRadius: viewStore.cornerRadius, width: viewStore.width, height: viewStore.height, style: viewStore.style))
            case .spacer(let viewStore):
                self = .spacer(viewStore: .init(id: viewStore.id, modifiers: newValue))
            case .divider(let viewStore):
                self = .divider(viewStore: .init(id: viewStore.id, modifiers: newValue))
            case .progressView(viewStore: let viewStore):
                self = .progressView(viewStore: .init(id: viewStore.id, modifiers: newValue, composition: viewStore.composition))
            case .standardTable(let viewStore):
                self = .standardTable(viewStore: .init(id: viewStore.id, modifiers: newValue, tableStateKey: viewStore.tableStateKey, standardTable: viewStore.standardTable))
            case .customTable(let viewStore):
                self = .customTable(viewStore: .init(id: viewStore.id, modifiers: newValue, tableStateKey: viewStore.tableStateKey, customTable: viewStore.customTable))
            case .group(let viewStore):
                self = .group(viewStore: .init(id: viewStore.id, modifiers: newValue, content: viewStore.content))
            case .controlGroup(let viewStore):
                self = .controlGroup(viewStore: .init(id: viewStore.id, modifiers: newValue, composition: viewStore.composition, content: viewStore.content))
            case .form(let viewStore):
                self = .form(viewStore: .init(id: viewStore.id, modifiers: newValue, content: viewStore.content))
            case .section(let viewStore):
                self = .section(viewStore: .init(id: viewStore.id, modifiers: newValue, composition: viewStore.composition, content: viewStore.content))
            case .geometryReader(let viewStore):
                self = .geometryReader(viewStore: .init(id: viewStore.id, modifiers: newValue, geometryProxyWidthKey: viewStore.geometryProxyWidthKey, geometryProxyHeightKey: viewStore.geometryProxyHeightKey, geometryProxyBottomKey: viewStore.geometryProxyBottomKey, geometryProxyLeadingKey: viewStore.geometryProxyLeadingKey, geometryProxyTopKey: viewStore.geometryProxyTopKey, geometryProxyTrailingKey: viewStore.geometryProxyTrailingKey, content: viewStore.content))
            case .picker(let viewStore):
                self = .picker(viewStore: .init(id: viewStore.id, modifiers: newValue, pickerListKey: viewStore.pickerListKey, selectionKey: viewStore.selectionKey, composition: viewStore.composition))
            case .datePicker(let viewStore):
                self = .datePicker(viewStore: .init(id: viewStore.id, modifiers: newValue, composition: viewStore.composition))
            case .scrollView(let viewStore):
                self = .scrollView(viewStore: .init(id: viewStore.id, modifiers: newValue, axes: viewStore.axes, showsIndicators: viewStore.showsIndicators, content: viewStore.content))

            }

        }
    }
}
