//
//  ProjectSculptApp.swift
//  ProjectSculpt Watch App
//
//  Created by Monty on 11/26/24.
//

import SwiftUI

@main
struct ProjectSculpt_Watch_AppApp: App {
    @StateObject var workoutManager = WorkoutManager()
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView{
                StartView()
            }
            .sheet(isPresented: $workoutManager.showingSummaryView) {
                SummaryView()
            }
            .environmentObject(workoutManager)
        }
    }
}

