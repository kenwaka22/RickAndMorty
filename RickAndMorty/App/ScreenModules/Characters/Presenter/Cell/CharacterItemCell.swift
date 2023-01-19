//
//  CharacterItemCell.swift
//  RickAndMorty
//
//  Created by Ken Wakabayashi on 18/01/23.
//

import UIKit

final class CharacterItemCell: UITableViewCell {
    
    //MARK: - Attributes
    
    //UI
    private lazy var mainContainer: UIView = {
        let element = UIView()
        element.backgroundColor = .tertiarySystemGroupedBackground
        element.setHeightConstraint(with: ViewValues.defaultHeightContainerCell)
        element.layer.cornerRadius = ViewValues.defaultCornerRadius
        element.layer.masksToBounds = true //Para ver el radius cuando se ponga una imagen
        return element
    }()
    
    private lazy var characterImageView: UIImageView = {
        let element = UIImageView()
        element.setWidthConstraint(with: ViewValues.defaultHeightContainerCell)
        element.setHeightConstraint(with: ViewValues.defaultHeightContainerCell)
        element.contentMode = .scaleAspectFill
        element.image = UIImage(named: Images.defaultImage)
        return element
    }()
    
    private lazy var labelStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.distribution = .fillEqually
        return element
    }()
    
    private lazy var nameLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont.preferredFont(forTextStyle: .headline, compatibleWith: UITraitCollection(legibilityWeight: .bold))
        element.textColor = .systemBlue
        element.text = "Rick"
        return element
    }()
    
    private lazy var spacieLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont.preferredFont(forTextStyle: .callout)
        element.text = "Human"
        return element
    }()
    
    private lazy var statusLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont.preferredFont(forTextStyle: .callout)
        element.text = "Human"
        return element
    }()
    
    //MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Methods
    private func setupLayout() {
        //mainContainer
        addSubview(mainContainer)
        mainContainer.fillSuperView(widthPadding: ViewValues.normalPadding)
        
        //imageView
        mainContainer.addSubview(characterImageView)
        characterImageView.setConstraints(
            top: mainContainer.topAnchor,
            bottom: mainContainer.bottomAnchor,
            left: mainContainer.leftAnchor)
        
        //stackView
        mainContainer.addSubview(labelStackView)
        labelStackView.setConstraints(
            top: mainContainer.topAnchor,
            right: mainContainer.rightAnchor,
            bottom: mainContainer.bottomAnchor,
            left: characterImageView.rightAnchor,
            pTop: ViewValues.normalPadding,
            pRight: ViewValues.normalPadding,
            pBottom: ViewValues.normalPadding,
            pLeft: ViewValues.normalPadding)
        
        [nameLabel, spacieLabel, statusLabel].forEach { labelStackView.addArrangedSubview($0) }
    }
    
    

}

extension CharacterItemCell: ReuseProtocol {  }


