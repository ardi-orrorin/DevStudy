//
//  ContentView.swift
//  PinchApp
//
//  Created by 유승철 on 1/20/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var isDrawerOpen: Bool = false
    
    // MARK: - FUNCTION
    
    // MARK: CONTENT
    
    func resetImageState() {
        return withAnimation(.spring()) {
                imageScale = 1
                imageOffset = .zero
        }
    }
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                
                
                // MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .opacity(isAnimating ? 1 : 0)
                    .scaleEffect(imageScale)
                    // MARK: 1. TAP GESUTRE
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 4
                            }
                        } else {
                            resetImageState()
                        }
                    })
                    // MARK: 2. DRAG GESTURE
                    .gesture(
                        DragGesture()
                            .onChanged { change in
                                withAnimation(.linear(duration: 0.2)) {
                                    imageOffset = change.translation
                                }
                            }
                            .onEnded { _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )//: gesture
                    // MARK: MAGNIFICATION
                    .gesture(
                        MagnificationGesture()
                            .onChanged { val in
                                withAnimation(.linear(duration: 1)) {
                                    if imageScale >= 1 && imageScale <= 5 {
                                        imageScale = val
                                    } else if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            }
                            .onEnded { _ in
                                if imageScale > 5 {
                                    imageScale = 5
                                } else if imageScale <= 1 {
                                    resetImageState()
                                }
                                
                            }
                    )
                
            } //: ZStack
            .navigationTitle("Pinch &  Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                    withAnimation(.linear(duration: 1)) {
                        isAnimating = true
                    }
                })
            })
            // MARK: INFO PANEL
            .overlay(
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                , alignment: .top
            )
            // MARK: CONNTROLS
            .overlay(
                Group {
                    HStack {
                        // SCALE DOWN
                        Button {
                            withAnimation(.spring()) {
                                if imageScale > 1 {
                                    imageScale -= 1
                                    if imageScale <= 1 {
                                        resetImageState()
                                    }
                                }
                            }
                            
                        } label : {
                            ControlImageView(icon: "minus.magnifyingglass")
                        }
                        
                        // RESET
                        Button {
                            resetImageState()
                        } label : {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        // SCALEUP
                        Button {
                            withAnimation(.spring()) {
                                if imageScale < 5 {
                                    imageScale += 1
                                    if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            }
                        } label : {
                            ControlImageView(icon: "plus.magnifyingglass")
                        }
                        
                    } //: CONTROLS
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                }
                .padding(.bottom, 30)
                , alignment: .bottom
            )
            // MARK: DRAWER
            .overlay(
                HStack(spacing: 12) {
                    // MARK: DRAWER HANDLE
                    Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(8)
                        .foregroundColor(.secondary)
                        .onTapGesture(perform: {
                            withAnimation(.easeOut(duration: 0.2)) {
                                isDrawerOpen.toggle()
                            }
                        })
                        

                    // MARK: THUMBNAILS
                    Spacer()
                } //: DRAWER
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width: 260)
                    .padding(.top, UIScreen.main.bounds.height / 12)
                    .offset(x: isDrawerOpen ? 20 : 215)
                , alignment: .topTrailing
            )
            
        } //: NavigationVeiw
        .navigationViewStyle(.stack)

    }
}

#Preview {
    ContentView()
}
