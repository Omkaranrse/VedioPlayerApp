//
//  QueryTag.swift
//  VedioPlayer
//
//  Created by Omkar Anarse on 16/01/24.
//

import SwiftUI

struct QueryTag: View {
    
    var query : Query
    var isSelected : Bool
    
    var body: some View {
        Text(query.rawValue)
            .font(.caption)
            .fontWeight(.bold)
            .foregroundStyle(isSelected ? .black : .gray)
            .padding(10)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    QueryTag(query: Query.nature, isSelected: true)
}
