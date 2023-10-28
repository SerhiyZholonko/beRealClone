//
//  FriendCellView.swift
//  BeRealClone
//
//  Created by apple on 10.10.2023.
//

import SwiftUI

struct FriendCellView: View {
    var body: some View {
        HStack {
            Image ("pp")
                .resizable()
                .scaledToFill ()
                .frame (width: 65, height: 65)
                .cornerRadius (65/2)
            VStack(alignment:
                    .leading) {
                        Text ("Alara")
                            .foregroundColor (.white)
                            .fontWeight ( .semibold)
                        Text ("aralaaa")
                            .foregroundColor (.gray)
                        
                        Spacer()
                    }
            Spacer()
            Image (systemName: "xmark")
                .foregroundColor (.gray)
                .font(.system(size: 16))
                .padding(.leading, 6)
        }
        .frame(height: 80)
        .padding(.horizontal)
    }
}

struct FriendCellView_Previews: PreviewProvider {
    static var previews: some View {
        FriendCellView()
    }
}
