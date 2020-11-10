//
//  SearchBarView.swift
//  FishWatchApp
//
//  Created by Thibaud Lambert on 06/11/2020.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String

    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
    }

    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator(text: $text)
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .sentences
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}

class SearchBarCoordinator: NSObject, UISearchBarDelegate {

    @Binding var text: String

    init(text: Binding<String>) {
        _text = text
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        text = searchText
    }
}
