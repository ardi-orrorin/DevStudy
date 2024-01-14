//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by 유승철 on 1/14/24.
//

import SwiftUI
import CoreData

let persistenceController = PersistenceController.shared

struct ContentView: View {
    
    @State var name: String = ""
    @State var quantity: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Product.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    
    private var products: FetchedResults<Product>
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Product name", text: $name)
                TextField("Product quantity", text: $quantity)
                
                HStack {
                    Spacer()
                    Button("Add") {
                        addProduct()
                    }
                    Spacer()
                    NavigationLink(
                        destination: ResultsView(name: name, viewContext: viewContext) ){
                        Text("Find")
                    }
                    Spacer()
                    Button("Clear") {
                        name = ""
                        quantity = ""
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                List {
                    ForEach(products) { product in
                        HStack {
                            Text(product.name ?? "Not Found")
                            Spacer()
                            Text(product.quantity ?? "Not Found")
                        }
                    }
                    .onDelete(perform: { index in
                        delete(offsets: index)
                    })
                }
                .navigationTitle("Product DataBase")
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    
    private func addProduct() {
        withAnimation {
            let product = Product(context: viewContext)
            product.name = name
            product.quantity = quantity
            name = ""
            quantity = ""
            
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("An error occurred: \(error)")
        }
    }
    
    private func delete(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                products[$0]
            }
            .forEach(viewContext.delete)
            saveContext()
        }
    }
    
}


struct ResultsView: View {
    var name: String
    var viewContext: NSManagedObjectContext
    
    @State var matches: [Product]?
    
    var body: some View {
        return VStack {
            List {
                ForEach(matches ?? []) { match in
                    HStack {
                        Text(match.name ?? "Not Found")
                        Spacer()
                        Text(match.quantity ?? "Not Found")
                    }
                }
            }
            .navigationTitle("Results")
        }
        .task {
            let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
            fetchRequest.entity = Product.entity()
            fetchRequest.predicate = NSPredicate(format: "name CONTAINS %@", name)
            matches = try? viewContext.fetch(fetchRequest)
    
        }
    }
}
    

#Preview {
    
    
    ContentView()
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
}
