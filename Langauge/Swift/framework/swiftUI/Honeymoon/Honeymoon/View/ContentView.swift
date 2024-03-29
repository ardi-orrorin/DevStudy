//
//  ContentView.swift
//  Honeymoon
//
//  Created by 유승철 on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition = AnyTransition.tailingBottom
    
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        
        print("views : \(views)")
        
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        
        return views
    }()
    
    // MARK: - move the card
    private func moveCards() {
        cardViews.removeFirst()
        
        lastCardIndex += 1
        
        
        let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]
        
        
        print("lastCardIndex : \(lastCardIndex)")
        print("index \(lastCardIndex % honeymoonData.count)")
        print("honeymoon: \(honeymoon)")
        
        let newCardView = CardView(honeymoon: honeymoon)
        
        cardViews.append(newCardView)
        print(cardViews)
        
    }
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: {
            $0.id == cardView.id
        }) else {
            return false
        }
        
        return index == 0
    }
    
    // MARK: - drag states
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case.pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    
    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuide, showinfoView: $showInfo)
                .opacity(dragState.isDragging ? 0 : 1)
            
            Spacer()
            
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                // x-mark symbol
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(
                                        dragState.translation.width < -dragAreaThreshold && isTopCard(cardView: cardView)
                                        ? 1 : 0
                                    )
                                
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(
                                        dragState.translation.width > dragAreaThreshold && isTopCard(cardView: cardView)
                                        ? 1 : 0
                                    )
                            } //: zstack
                        )//: overlay
                    
                    
                        .offset(
                            x: isTopCard(cardView: cardView) ? dragState.translation.width : 0,
                            y: isTopCard(cardView: cardView) ? dragState.translation.height : 0
                        )
                        .scaleEffect(
                            dragState.isDragging && isTopCard(cardView: cardView) ? 0.85 : 1)
                        .rotationEffect(
                            Angle(
                                degrees: isTopCard(cardView: cardView)
                                ? Double(dragState.translation.width / 12)
                                : 0
                            )
                        )
                        
                        .gesture(
                            LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating(
                                    $dragState,
                                    body: { value, state, transaction in
                                        switch value {
                                        case .first(true):
                                            state = .pressing
                                        case .second(true, let drag):
                                            state = .dragging(translation: drag?.translation ?? .zero)
                                        default:
                                            break
                                    }
                                }) //: updating
                                .onChanged() { value in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -dragAreaThreshold {
                                        cardRemovalTransition = .leadingBottom
                                    }
                                    
                                    if drag.translation.width > dragAreaThreshold {
                                        cardRemovalTransition = .tailingBottom
                                    }
                                }
                                .onEnded() { value in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -dragAreaThreshold
                                        || drag.translation.width > dragAreaThreshold {
                                        moveCards()
                                    }
                                    
                                }
                            )//: gesutre
                        .transition(cardRemovalTransition)
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0 : 1)
            
        } //: vstack
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Success"),
                message: Text("Wishing a lovely and most precious of the times together for the amazing couple."),
                dismissButton: .default(Text("Happy Honeymoon!"))
            )
        }
    }
}

#Preview {
    ContentView()
}
