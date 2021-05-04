//
//  ContentView.swift
//  CircleAnimation
//
//  Created by Ndayisenga Jean Claude on 04/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var fill: CGFloat = 0.5
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 11/255.0, green: 15/255.0, blue: 128/255.0, alpha: 1))
            ZStack {
                // Track circle
                Circle()
                    .stroke(Color.white.opacity(0.3),
                            style: StrokeStyle(lineWidth: 30))
                // Animation Circle
                Circle()
                    .trim(from: 0, to: self.fill)
                    .stroke(Color.yellow,
                            style: StrokeStyle(lineWidth: 30))
                    .rotationEffect(.init(degrees: -90))
                    .animation(Animation.linear(duration: 0.3))
                Text("$\(Int(self.fill * 100.00))")
                    .foregroundColor(Color.white)
                    .font(.system(size: 52))
                
            }
            .padding(50)
        }
        .onTapGesture {
            for x in 0...100 {
                DispatchQueue.main.asyncAfter(deadline: .now()+TimeInterval(x/15)) {
                    self.fill += 0.01
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
