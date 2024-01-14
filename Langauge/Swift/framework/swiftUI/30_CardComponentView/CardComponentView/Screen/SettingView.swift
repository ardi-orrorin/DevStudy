//
//  SettingView.swift
//  CardComponentView
//
//  Created by 유승철 on 1/14/24.
//

import SwiftUI

struct SettingView: View {
    
    
    private var alternateAppIcons: [String] = [
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Backpack",
    ]
    
    
    @State var labelDataList: [AboutAppDto] = [
        .init(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue),
        .init(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple),
        .init(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "John", rowTintColor: .mint),
        .init(rowLabel: "Website", rowIcon: "globe", rowContent: "https://naver.com", rowTintColor: .indigo),
        .init(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "NAVER", rowLinkDestination: "https://www.naver.com")

    ]
    
    var body: some View {
        List {
            // MARK: section: header
            
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editor`s Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium,
                            .customGreenDark,
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.top, 8)
                
                VStack(spacing: 12) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is evne better once you ar actually threr. the hike that you hope to do again someday. \nFind the best day hies in the app.")
                        .font(.footnote)
                        .italic()
                    
                    
                    Text("Dust off the boots! It's time for a walk")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
            }
            .listRowSeparator(.hidden)
            
            // MARK: section: icons
            
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                
                                print("Icon \(alternateAppIcons[item]) was preseed")
                                
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if error != nil {
                                        print(
                                            String(describing: error?.localizedDescription)
                                        )
                                    } else {
                                        print("Success! You have changed the app icon to \(alternateAppIcons[item])")
                                    }
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                } //: scrollview
                .padding(.top, 12)
                
                Text("Choose your favorite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            } // section
            .listRowSeparator(.hidden)
            
            // MARK: section: about
            Section(
                header: Text("About the App"),
                footer: HStack {
                    Spacer()
                    Text("Copyrigt All rigtht reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
//                LabeledContent("Application", value: "Hike")
                
                ForEach(labelDataList) { labelData in
                    CustomListRowView(
                        rowLabel: labelData.rowLabel,
                        rowIcon: labelData.rowIcon,
                        rowContent: labelData.rowContent,
                        rowTintColor: labelData.rowTintColor,
                        rowLinkLabel: labelData.rowLinkLabel,
                        rowLinkDestination: labelData.rowLinkDestination
                    )
                }
                
                
            }
        }
    }
}

#Preview {
    SettingView()
}
