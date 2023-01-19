//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 18/01/23.
//

import UIKit

protocol CharactersViewCoordinatorProtocol {
    func didSelectedCharacterCell(model: String)
}

final class CharactersView: UIViewController {
    //MARK: - Attribues
    private let coordinator: CharactersViewCoordinatorProtocol?

    //UI
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Initializer
    init(coordinator: CharactersViewCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharacterItemCell.self, forCellReuseIdentifier: CharacterItemCell.reuseIdentifier)
        tableView.separatorStyle = .none
    }
}

//MARK: - Lifecycle
extension CharactersView {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

//MARK: - Extensions
extension CharactersView: UITableViewDelegate {}
extension CharactersView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterItemCell.reuseIdentifier, for: indexPath) as? CharacterItemCell
        
        guard let cell = cell else {
            fatalError("No se ha identificado: CharacterItemCell")
        }
        
        cell.backgroundColor = .red
        
        return cell
    }
}

