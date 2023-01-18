//
//  HomeView.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 16/01/23.
//

import UIKit
import Combine

//CoordinatorDelegate
protocol HomeViewCoordinatorProtocol: AnyObject {
    func didSelectedMenuCell(model: MenuItem)
}

final class HomeView: UIViewController {
    //MARK: - Attributes
    private let viewModel: HomeViewModelProtocol
    private var cancellable = Set<AnyCancellable>()
    private weak var coordinator: HomeViewCoordinatorProtocol?
    
    //UI
    @IBOutlet weak var collectionView: UICollectionView!
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeItemCell.self, forCellWithReuseIdentifier: HomeItemCell.reuseIdentifier)
    }
    
    //MARK: - Initializer
    init(viewModel: HomeViewModelProtocol, coordinator: HomeViewCoordinatorProtocol) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setupStyle() {
        view.backgroundColor = .systemBackground
    }
    
    private func stateController() {
        viewModel.state
            .receive(on: RunLoop.main) // Para que se ejecute en el hilo principal
            .sink { [weak self] state in
                self?.hideSpinner()
                switch state {
                case.success:
                    self?.collectionView.reloadData()
                case.loading:
                    self?.showSpinner()
                case.fail(error: let error):
                    self?.presentAlert(message: error, title: AppLocalized.error)
                }
            }.store(in: &cancellable)
    }
    

}

//MARK: - LifeCycle
extension HomeView {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        stateController()
        viewModel.viewDidLoad()
    }
}

//MARK: - UICollectionViewDelegate
extension HomeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = viewModel.getMenuItem(indexPath: indexPath )
        coordinator?.didSelectedMenuCell(model: model )
    }
    
}

//MARK: - UICollectionViewDataSource
extension HomeView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.menuItemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCell.reuseIdentifier, for: indexPath) as? HomeItemCell
        
        guard let cell = cell else {
            fatalError("No se ha identificado: HomeItemCell")
        }
        
        let viewModelCell = viewModel.getItemMenuViewModel(indexPath: indexPath)
        cell.setupCell(viewModel: viewModelCell)
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Para que entren 2 cells de manera horizontal
        //let width = (Int(view.frame.width) / 2) - 20
        let width = (ViewValues.widthScreen / 2) - ViewValues.doublePadding
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //Espacio entre columnas de celdas (arriba abajo)
        return ViewValues.doublePadding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //Espacio entre filas de celdas (izquierad derecha)
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //Para dar margenes al layout
        return UIEdgeInsets(top: .zero, left: ViewValues.normalPadding, bottom: .zero, right: ViewValues.normalPadding)
    }
}

//MARK: - Activity indicator
extension HomeView: SpinnerDisplayProtocol {
//    func showSpinner()
//    func hideSpinner()
}

extension HomeView: MessageDisplayProtocol {
//    func presentAlert()
}




