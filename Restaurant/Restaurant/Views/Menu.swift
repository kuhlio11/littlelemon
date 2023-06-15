//
//  Menu.swift
//  Restaurant
//
//  Created by Ryan Kuhl on 6/11/23.
//

import SwiftUI
import CoreData

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            Text("Title of Application")
            Text("Chicago")
            Text("Short description of whole application.")
            
            TextField("Search menu", text: $searchText)
            
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        HStack {
                            VStack {
                                Text(dish.title ?? "")
                                Text(dish.information ?? "")
                                Text("$" + (dish.price ?? ""))
                            }
                            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            getMenuData()
        }
    }
    
    func getMenuData() {
        PersistenceController.shared.clear()
        
        let menuAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        
        let menuURL = URL(string: menuAddress)
        
        let request = URLRequest(url: menuURL!)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let jsonData = data {
                if let jsonMenu = try? JSONDecoder().decode(MenuList.self, from: jsonData) {
                    for item in jsonMenu.menu {
                        let dish = Dish(context: viewContext)
                        dish.title = item.title
                        dish.price = item.price
                        dish.information = item.information
                        dish.image = item.image
                        dish.category = item.category
                    }
                    do {
                        try viewContext.save()
                        print("Data saved successfully.")
                    } catch {
                        print("Error saving data: \(error)")
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                                 ascending: true,
                                 selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
    
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
