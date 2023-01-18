//
//  HomeItemCell.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 16/01/23.
//

import UIKit

final class HomeItemCell: UICollectionViewCell {
    
    
    //MARK: - Attributes    
    private let mainContainer: UIView = {
        let element = UIView()
        element.backgroundColor = .systemGroupedBackground
        element.layer.cornerRadius = 10
        element.layer.masksToBounds = true //Para ver el radius cuando se ponga una imagen
        return element
    }()
    
    private let categoryImage: UIImageView = {
        let element = UIImageView()
        element.image = ResourceImage.defaultImage
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    private let titleCategoryLabel: UILabel = {
        let element = UILabel()
        element.textColor = .white
        element.text = "Category"
        element.font = UIFont.preferredFont(forTextStyle: .headline)

        return element
    }()
    
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setupLayout() {
        addSubview(mainContainer)
        mainContainer.fillSuperView()
        
        mainContainer.addSubview(categoryImage)
        categoryImage.fillSuperView()
        
        setupGradientForTitle()
        
        mainContainer.addSubview(titleCategoryLabel)
        titleCategoryLabel.setConstraints(
            right: mainContainer.rightAnchor,
            bottom: mainContainer.bottomAnchor,
            left: mainContainer.leftAnchor,
            pRight: 10,
            pBottom: 10,
            pLeft: 10)
    }
    
    private func setupGradientForTitle() {
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = self.bounds
        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.darkGray.cgColor]
        gradientMaskLayer.locations = [0.6, 0.9]
        mainContainer.layer.addSublayer(gradientMaskLayer)
    }
    
    func setupCell(viewModel: HomeItemCellViewModel) {
        titleCategoryLabel.text = viewModel.title
        categoryImage.image = UIImage(named: viewModel.imageName)
    }
}

//MARK: - ReuseProtocol
extension HomeItemCell: ReuseProtocol {  }

