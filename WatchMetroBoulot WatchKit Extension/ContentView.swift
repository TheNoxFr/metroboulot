//
//  ContentView.swift
//  WatchMetroBoulot WatchKit Extension
//
//  Created by Bruno Deguil on 11/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 1
    // 96 : https://api-ratp.pierre-grimaud.fr/v4/schedules/buses/96/Maison%20des%20m%C3%A9tallos/R
    //  4 : https://api-ratp.pierre-grimaud.fr/v4/schedules/metros/4/montparnasse+bienvenue//R
    // 11 : https://api-ratp.pierre-grimaud.fr/v4/schedules/metros/11/chatelet/R
    var body: some View {
        TabView (selection: $tabSelection) {
            AllerView()
                .tabItem {
                    Label("Aller", systemImage: "car")
                }
                .tag(1)
            RetourView()
                .tabItem {
                    Label("Retour", systemImage: "tram")
                }
                .tag(2)
        }
        .padding()
        .onAppear() {
            let now = Date()
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: now)
            if hour >= 21 {
                tabSelection = 2
            } else {
                tabSelection = 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
