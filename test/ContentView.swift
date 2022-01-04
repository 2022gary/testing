//
//  ContentView.swift
//  test
//
//  Created by Gary Weng on 1/1/22.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        ZStack {
               TabView {
                   TabBar1()
                       .tabItem {
                           Image(systemName: "1.square")
                           Text("First")
                   }
                   TabBar2()
                       .tabItem {
                           Image(systemName: "2.square.fill")
                           Text("Second")
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
