//
//  ContentView.swift
//  LLCarousel
//
//  Created by MacBook Two on 11/08/2025.
//

import SwiftUI

struct WindowView: View {
    
    @StateObject private var viewModel = CarouselViewModel()
    var body: some View {
        VStack {

            PeopleView(viewModel: viewModel)
            HStack {
                HStack {
                    Button(action: {
                        viewModel.previousNode()
                    }, label: {
                        Text("Previous")
                    })
                   
                }
                .padding(.vertical, 6)
                .frame(maxWidth: .infinity)
                .background(.green)
                .cornerRadius(10)
                .onTapGesture {
                    
                }
                
                HStack {
                    Button(action: {
                        viewModel.nextNode()
                    }, label: {
                        Text("Next")
                    })
                    
                }
                .padding(.vertical, 6)
                .frame(maxWidth: .infinity)
                .background(.yellow)
                .cornerRadius(10)
                .onTapGesture {
                }
            }
            .padding(.horizontal, 25)
            .frame(width: 300)
            
        }
        .padding()
    }
}

#Preview {
    WindowView()
}

struct PeopleView: View {
    
    @ObservedObject var viewModel: CarouselViewModel
    var body: some View {
        ZStack (alignment: .leading){
            ZStack {
                Rectangle()
                    .fill(.brown)
                Text("Photo")
                    .foregroundStyle(.white)
                  
            }
            .padding(.vertical, 5)
            .padding(.trailing, 5)
            .frame(width: 100, height: 150)
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .topTrailing)
            
            VStack {
                Text("\(viewModel.displayNode?.value.name ?? "NO DATA FOUND")")
                    .font(.title)
                    .foregroundStyle(.white)

                Text("\(viewModel.displayNode?.value.age ?? 0) ")
                    .font(.title)
                    .foregroundStyle(.white)
                  
            }
            .padding(.top, 60)
            .padding(.leading,10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            Text("\(viewModel.displayNode?.value.profession ?? "NO DATA FOUND")")
                .font(.title)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .padding(.leading,10)
                .padding(.bottom,10)
           
            
                
        }
        .frame(width: 250, height: 250)
        .background(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView(viewModel: MockViewModel())
    }
}

final class MockViewModel: CarouselViewModel {
   
    override init() {
        
        super.init()
        
        self.displayNode?.value = People(name: "sam", age: 24, profession: "iOS Developer")
    }
}
