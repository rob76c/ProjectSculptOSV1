//
//  ContentView.swift
//  ProjectSculpt Watch App
//
//  Created by Monty on 11/26/24.
//

import SwiftUI
import HealthKit

struct StartView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    var workoutTypes: [HKWorkoutActivityType] =
    [.cycling, .running, .walking]
    @State private var selectedWorkout: HKWorkoutActivityType?
    var body: some View {
        NavigationStack {
            List(workoutTypes, id: \.self) { workoutType in
                NavigationLink(destination: SessionPagingView()) {
                    Text(workoutType.name)
                        .padding(
                            EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5)
                        )
                        .simultaneousGesture(TapGesture().onEnded {
                            print("Selected workout: \(workoutType.name)")
                            workoutManager.selectedWorkout = workoutType
                            selectedWorkout = workoutType
                        })
                }
            }
            .listStyle(.carousel)
            .navigationBarTitle("Classes")
            .onAppear{
                workoutManager.requestAuthorization()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
           
    }
}

extension HKWorkoutActivityType: Identifiable {
    public var id: UInt {
        rawValue
    }
    
    var name: String {
        switch self {
        case .running:
            return "Darrian Run"
        case.cycling:
            return "Chris Cycling"
        case.walking:
            return "Walk"
        default:
            return ""
        }
    }
}
