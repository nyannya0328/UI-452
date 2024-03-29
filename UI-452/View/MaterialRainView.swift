//
//  MaterialRainView.swift
//  UI-452
//
//  Created by nyannyan0328 on 2022/02/07.
//

import SwiftUI

struct MaterialRainView: View {
    var body: some View {
        GeometryReader{proxy in
            
            let size = proxy.size
            
            HStack{
                
                ForEach(1...Int(size.width / 30),id:\.self){index in
                    
                    
                    MaterialRainCharacterView(size: size)
                    
                }
                
            }
            
            
        }
    }
}

struct MaterialRainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MaterialRainCharacterView : View{
    
    var size : CGSize
    
    @State var animation :   Bool = false
    
    @State var random : Int = 0
    
    var body: some View{
        
        let randomHeight : CGFloat = .random(in: (size.height / 2)...size.height)
        
        VStack(spacing:10){
            
            
            
            ForEach(0..<constant.count,id:\.self){index in
                
                
                let character = Array(constant)[getRandomInex(index: index)]
                
                
                Text(String(character))
                    .font(.custom("Matrix Code NFI", size: 30))
                    .foregroundColor(Color("Green"))
            }
            
            
            
            
            
        }
        .mask {
        
            
            Rectangle()
                .fill(
                
                
                LinearGradient(colors: [
                
                    
                        .clear,
                        .black.opacity(0.1),
                        .black.opacity(0.2),
                        .black.opacity(0.3),
                        .black.opacity(0.5),
                        .black.opacity(0.7),
                        .black
                
                ], startPoint: .top, endPoint: .bottom)
                
                
                )
                .frame(height: size.height / 2)
                .offset(y: animation ? size.height : -randomHeight)
            
        }
        .onAppear {
            
            withAnimation(.linear(duration: 15).delay(.random(in: 0...2)).repeatForever(autoreverses: false)){
                
                animation = true
            }
            
            
        }
        .onReceive(Timer.publish(every: 0.2,on: .main, in: .common).autoconnect()) { _ in
            
            
            random = Int.random(in: 0..<constant.count)
        }
    }
    
    func getRandomInex(index : Int) -> Int{
        
        let max = constant.count - 1
        
        
        if (index + random) > max{
            
            
            if (index - random) < 0{
                
                
                return index
                
            }
            
        return (index - random)
            
            
        }
        else{
            
            
            return (index + random)
        }
    }
}

let constant = "abcdefghijklmnopqrstuvwxyzabcquepaje123jdj09"
