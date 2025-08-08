import SwiftUI

struct MazeSelectionView: View {
    let createMaze: (Int, Int) -> Void
    @State private var columnsNumber = 3.0
    @State private var rowsNumber = 3.0
    @State private var isColumnEditing: Bool = false
    @State private var isRowEditing: Bool = false
    var colCount: Int {
        Int(columnsNumber)
    }
    var rowCount: Int {
        Int(rowsNumber)
    }
    
    var items: [Int] {
           Array(1...(rowCount * colCount))
    }
    
    var columns: [GridItem] {
        
           Array(repeating: GridItem(.flexible(), spacing: 10), count: colCount)
    }

    
    var body: some View {
        VStack {
            VStack {
                Text("\(rowCount)")
                      .foregroundColor(isRowEditing ? .green : .black)
                
                Slider(
                    value: $rowsNumber,
                    in: 3...7, step: 1,
                    label: { Text("Speed") },
                    onEditingChanged: { editing in
                        isRowEditing = editing }
                )
                .padding(.top, -15)
               
            }
            .padding(.horizontal, 5)
            .frame(height: 50)
            .frame(width: 300)
            .padding(.bottom, 20)
            
            Button(action: {
                createMaze(rowCount, colCount)
            }, label: {
                Text("Start Maze Solver")
            })
            
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(Color.green.opacity(0.4))
            .cornerRadius(10)
            .padding(.horizontal, 10)
            
           
            
    
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(items, id: \.self) { item in
                            
                            Rectangle()
                                .fill(Color.green.opacity(0.5))
                                .frame(height: 80)
                                .cornerRadius(10)
                             }
                         }
                         .padding()
                         .overlay {
                             RoundedRectangle(cornerRadius: 10)
                                 .stroke(Color.gray, lineWidth: 1)
                                 .padding(.horizontal, 5)
                             
                         }
                         .shadow(color: .black.opacity(0.2), radius: 12, x: 0, y: 0)
                         
                     }
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .center)
            
            VStack {
                
                Text("\(colCount)")
                      .foregroundColor(isColumnEditing ? .green : .black)
                
                Slider(
                    value: $columnsNumber,
                    in: 3...7, step: 1,
                    label: { Text("Speed") },

                    onEditingChanged: { editing in
                        isColumnEditing = editing }
                )
                .padding(.top, -15)
               
            }
            .padding(.horizontal, 5)
            .frame(height: 50)
            .frame(width: 300)
          
        }

    }
}

#Preview {
    MazeSelectionView(createMaze: {_, _ in
    })
}
struct CustomVerticalSlider: View {
    @Binding var value: Double
    let range: ClosedRange<Double>
    
    var body: some View {
        GeometryReader { geometry in
            let sliderHeight = geometry.size.height
            let sliderWidth: CGFloat = 5
            
          
            let percentage = CGFloat((value - range.lowerBound) / (range.upperBound - range.lowerBound))
            let yOffset = sliderHeight * (1 - percentage)
            
            ZStack(alignment: .top) {
             
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(1))
                    .frame(width: sliderWidth)
                
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 30, height: 30)
                    .offset(y: yOffset - 15)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                              
                                let locationY = min(max(0, gesture.location.y), sliderHeight)
                                
                               
                                let newPercentage = 1 - (locationY / sliderHeight)
                                let newValue = Double(newPercentage) * (range.upperBound - range.lowerBound) + range.lowerBound
                                
                                value = round(newValue)
                            }
                    )
            }
            .frame(width: sliderWidth, height: sliderHeight)
        }
    }
}


