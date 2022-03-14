//
//  DividerView.swift
//  FabDogs
//
//  Created by Jidh George on 12/03/2022.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
                  .fill(LinearGradient(
                          gradient: Gradient(colors: [.green, .blue, .purple]),
                          startPoint: .leading,
                          endPoint: .trailing))
    }
}

struct DividerView_Previews: PreviewProvider {
    static var previews: some View {
        DividerView()
    }
}
