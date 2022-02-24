//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Alex Paz on 18/02/2022.
//
import CoreData
import SwiftUI

enum FilterType: String {
    case beginsWith = "BEGINSWITH"
    case contains = "CONTAINS[c]"
    case like = "LIKE"
}

//struct FilteredList: View {
struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    var predicate: String = "BEGINSWITH"
    
    
    
    var body: some View {
//        List(fetchRequest, id: \.self) { singer in
//            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//        }
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, type: FilterType = .contains, sorting: [SortDescriptor<T>] = [], @ViewBuilder content: @escaping (T) -> Content) {
        
//        switch predicate {
//        case .beginsWith:
//            self.predicate = "BEGINSWITH"
//        case .contains:
//            self.predicate = "CONTAINS"
//        case .like:
//            self.predicate = "LIKE"
//        }
        
        _fetchRequest = FetchRequest<T>(sortDescriptors: sorting, predicate: NSPredicate(format: "%K \(type.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}
