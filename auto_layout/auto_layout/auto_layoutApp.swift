//
//  auto_layoutApp.swift
//  auto_layout
//
//  Created by Idwall Go Dev 001 on 22/03/22.
//

import SwiftUI

@main
struct auto_layoutApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
