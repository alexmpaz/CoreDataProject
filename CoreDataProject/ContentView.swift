//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Alex Paz on 16/02/2022.
//
import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    @State private var filter = "w"
    @State private var filterType = FilterType.contains
    @State private var sorting = [SortDescriptor<Candy>(\.name)]
    
    var body: some View {
        VStack {
//            List {
//                ForEach(countries, id:\.self) { country in
//                    Section(country.wrappedFullName) {
//                        ForEach(country.candyArray, id:\.self) { candy in
//                            Text(candy.wrappedName)
//                        }
//                    }
//                }
//            }
            FilteredList(filterKey: "name", filterValue: filter, type: filterType,
                         sorting: sorting) { (candy: Candy) in
                Section(candy.origin?.wrappedFullName ?? "Unknown country") {
//                    ForEach(candy.origin?.candyArray ?? [], id:\.self) { candy in
                        Text(candy.wrappedName)
//                    }
                }
            }
            TextField("Enter the filter:", text: $filter)
//            TextField("Type: CONTAINS[c]", text: $filterType, prompt: Text("Enter filter type:"))
            
        }
        Button("Add Examples") {
            let candy1 = Candy(context: moc)
            candy1.name = "Mars"
            candy1.origin = Country(context: moc)
            candy1.origin?.shortName = "UK"
            candy1.origin?.fullName = "United Kingdom"

            let candy2 = Candy(context: moc)
            candy2.name = "KitKat"
            candy2.origin = Country(context: moc)
            candy2.origin?.shortName = "UK"
            candy2.origin?.fullName = "United Kingdom"

            let candy3 = Candy(context: moc)
            candy3.name = "Twix"
            candy3.origin = Country(context: moc)
            candy3.origin?.shortName = "UK"
            candy3.origin?.fullName = "United Kingdom"

            let candy4 = Candy(context: moc)
            candy4.name = "Toblerone"
            candy4.origin = Country(context: moc)
            candy4.origin?.shortName = "CH"
            candy4.origin?.fullName = "Switzerland"
            
            
//            let taylor = Singer(context: moc)
//            taylor.firstName = "Taylor"
//            taylor.lastName = "Swift"
//
//            let ed = Singer(context: moc)
//            ed.firstName = "Ed"
//            ed.lastName = "Sheeran"
//
//            let adele = Singer(context: moc)
//            adele.firstName = "Adele"
//            adele.lastName = "Adkins"
            
            try? moc.save()
        }
        
        Button("Contains") {
            filterType = .contains
        }
        Button("Begins with") {
            filterType = .beginsWith
        }
        Button("Reverse order") {
            sorting = [SortDescriptor<Candy>(\.name, order: .reverse)]
        }
        Button("Alphabetical order") {
            sorting = [SortDescriptor<Candy>(\.name)]
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
