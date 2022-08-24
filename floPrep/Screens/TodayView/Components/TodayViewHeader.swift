//
//  TodayViewHeader.swift
//  floPrep
//
//  Created by River McCaine on 8/24/22.
//

import SwiftUI

struct TodayViewHeader: View {
    var body: some View {
            HStack(spacing: 10) {
                
                Button {
                    print("list")
                } label: {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 28 , height:  28)
                        .tint(.brandPrimary)
                }
                
                VStack(alignment: .trailing, spacing: 10) {
                    Text("Today")
                        .font(.largeTitle.bold())
                    
                    Text(Date().formatted(date: .abbreviated, time: .omitted))
                        .foregroundColor(.gray)
                    
                }
                .hCenter()
                
                Button {
                    print("gear")
                } label: {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 34 , height:  34)
                        .tint(.brandPrimary)
                }
            }
            .padding()
            .padding(.top, getSafeArea().top)
            .background(.white)
        }
}

struct TodayViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        TodayViewHeader()
    }
}
