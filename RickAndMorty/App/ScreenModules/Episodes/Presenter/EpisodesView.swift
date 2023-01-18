//
//  EpisodesView.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 18/01/23.
//

import UIKit

protocol EpisodesViewCoordinatorProtocol {
    
}

final class EpisodesView: UIViewController {
    
    private let coordinator: EpisodesViewCoordinatorProtocol?
    
    init(coordinator: EpisodesViewCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EpisodesView: EpisodesViewCoordinatorProtocol {
    
}
