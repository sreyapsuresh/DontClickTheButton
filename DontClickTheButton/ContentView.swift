//  ContentView.swift
//  DontClickTheButton

import SwiftUI

struct ContentView: View {
    // Variables
    @State private var flavorText = "Don't click the button."
    @State private var buttonPosition = CGPoint(x: 0, y: 0) // Top left
    @State private var clickCount = 0
    
    // Constant
    let maxClicks = 5
    
    var body: some View {
        VStack {
            Text(flavorText)
                .font(.title)
                .padding()
                .bold()
            
            Button(action: {self.buttonClicked()}) {
                Text("EXIT")
                    .padding(15)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .position(buttonPosition)
            .padding()
        }
        .onAppear {
            self.randomizeButtonPosition()
        }
    }
    
    // Called when button is clicked
    func buttonClicked() {
        clickCount += 1
        
        if clickCount >= maxClicks {
            // Exit  app after 5 clicks
            exit(0)
        }
        
        switch clickCount {
        case 1:
            flavorText = "Hey! What are you doing?"
        case 2:
            flavorText = "Seriously, stop clicking!"
        case 3:
            flavorText = "Can you read? That says EXIT!"
        case 4:
            flavorText = "Last chance!!!"
        default:
            exit(0)
        }
        
        randomizeButtonPosition()
    }
    
    func randomizeButtonPosition() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 50
        
        // Adjust the maximum random positions to keep the button within bounds
        let maxRandomX = screenWidth - (buttonWidth)
        let maxRandomY = screenHeight - (buttonHeight + buttonWidth)
        
        let randomX = CGFloat.random(in: buttonWidth...maxRandomX)
        let randomY = CGFloat.random(in: buttonHeight...maxRandomY)
        
        buttonPosition = CGPoint(x: randomX, y: randomY)
    }
}

#Preview {
    ContentView()
}
