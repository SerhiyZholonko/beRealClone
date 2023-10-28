//
//  SuggestionCellView.swift
//  BeRealClone
//
//  Created by apple on 09.10.2023.
//

import SwiftUI

struct SuggestionCellView: View {
    var body: some View {
        HStack {
            Image ("pp")
                .resizable()
                .scaledToFill()
                .frame (width: 65, height: 65)
                .cornerRadius (65/2)
            VStack(alignment: .leading) {
                Text ("Alara")
                    .foregroundColor (.white)
                    .fontWeight(.semibold)
                Text ("alaraaa")
                    .foregroundColor (.gray)
                HStack {
                    Image(systemName: "person.crop.circle")
                        .foregroundColor (.gray)
                        .font (.system(size: 14))
                    Text ("Alara")
                        .foregroundColor (.gray)
                        .font (.system(size: 14))
                        .padding (.leading, -4)
                }
            
            }
            Spacer()
            RoundedRectangle (cornerRadius: 12)
                .foregroundColor (Color (red: 44/255, green: 44/255, blue: 46/255))
                .frame (width: 45, height: 25) .overlay (
            Text ("ADD" )
                .foregroundColor (.white)
                .font (.system(size: 12))
            .fontWeight (.bold)
            )
            Image (systemName: "xmark" )
                .foregroundColor(.gray)
            .font (.system(size: 16))
            .padding (.leading, 6)
            
        }
        .padding(.horizontal)
    }
}

struct SuggestionCellView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionCellView()
    }
}
