//
//  CarouselViewModel.swift
//  LLCarousel
//
//  Created by MacBook Two on 11/08/2025.
//

import Foundation

 class CarouselViewModel: ObservableObject {
    
     @Published  var displayNode: PeopleNode?
     private var data: PeopleList = PeopleList()
     
     init() {
         initializeData()
     }
     
     private func initializeData() {
         
         let sam: People = People(name: "Sam", age: 24, profession: "Full-Stack Developer")
         let sunil: People = People(name: "Sunil Bist", age: 24, profession: "iOS Developer")
         let anushilan: People = People(name: "Anushilan", age: 24, profession: "Andoroid Developer")
         let bibek: People = People(name: "Bibek", age: 24, profession: "Android Developer")
         let aashish: People = People(name: "Aashish", age: 24, profession: "iOS Developer")
         let mukesh: People = People(name: "Mukesh", age: 24, profession: "Sr. Android Developer")
         let habin: People = People(name: "Habin", age: 24, profession: "Sr. iOS Developer")
         let sunil2: People = People(name: "Sunil", age: 24, profession: "Sr. iOS Developer")
         let deepam: People = People(name: "Deepam", age: 24, profession: "Sr. Android Developer")
         data.append(sam)
         data.append(sunil)
         data.append(anushilan)
         data.append(mukesh)
         data.append(bibek)
         data.append(aashish)
         data.append(habin)
         data.append(sunil2)
         data.append(deepam)
         displayNode = data.getHead()
         
     }
     
     func previousNode() {
         let prevNode = data.getPreviousNode(displayNode!)
         displayNode = prevNode
     }
     
     func nextNode() {
         let nextnode = data.nextNode(displayNode!)
         displayNode = nextnode
     }
     
    
}
