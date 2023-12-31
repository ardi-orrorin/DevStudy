//
//  ErrorHandler.swift
//  concurrency
//
//  Created by 유승철 on 12/31/23.
//

import SwiftUI

struct ErrorHandler: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }) {
            Text("Do Something")
        }
    }
    
    enum DurationError: Error {
        case tooLong
        case tooShort
    }
    
    func doSomething() async {
        print("Start \(Date())")
        do {
            try await takesTooLong(delay: 2)
        } catch DurationError.tooLong {
            print("Error: Duration too long")
        } catch DurationError.tooShort {
            print("Error: Duration too short")
        } catch {
            print("Unknown error")
        }
        
        print("End \(Date())")
    }
    func takesTooLong(delay: UInt32) async throws{
        if delay < 5 {
            throw DurationError.tooShort
        } else if delay > 20 {
            throw DurationError.tooLong
        }
        sleep(delay)
        print("Async task completed at \(Date())")
        
    }
}

#Preview {
    ErrorHandler()
}
