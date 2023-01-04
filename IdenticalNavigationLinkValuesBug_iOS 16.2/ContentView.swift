//
//  ContentView.swift
//  IdenticalNavigationLinkValuesBug_iOS 16.2
//
//  Created by Jason Ji on 1/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(value: LinkValue.entryDetail(entryId: "A")) {
                    Text("View Entry A")
                }
            }
            .navigationDestination(for: LinkValue.self) { value in
                switch value {
                case .entryDetail(let entryId):
                    EntryView(title: entryId)
                case .recipeDetail(let recipeId):
                    RecipeView(title: recipeId)
                }
            }
        }
    }
}

struct EntryView: View {
    let title: String
    
    var body: some View {
        List {
            NavigationLink(value: LinkValue.recipeDetail(recipeId: "B")) {
                Text("View Recipe B")
            }
            .navigationTitle("Entry \(title)")
        }
    }
}

struct RecipeView: View {
    let title: String
    
    var body: some View {
        List {
            NavigationLink(value: LinkValue.entryDetail(entryId: "A")) {
                Text("View Entry A")
            }
            .navigationTitle("Recipe \(title)")
        }
    }
}

enum LinkValue: Hashable {
    case entryDetail(entryId: String)
    case recipeDetail(recipeId: String)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
