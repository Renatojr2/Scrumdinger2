//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Renato Junior on 23/08/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
  @StateObject private var store = ScrumStore()

    var body: some Scene {
        WindowGroup {
          ScrumsView(scrums: $store.scrums) {
            Task {
              do {
                try await store.saveData(scrums: store.scrums)
              } catch {
                fatalError(error.localizedDescription)
              }
              
            }
          }
            .task {
              do {
                try await store.load()
              } catch {
                fatalError(error.localizedDescription)
              }
          
            }
        }
    }
}
