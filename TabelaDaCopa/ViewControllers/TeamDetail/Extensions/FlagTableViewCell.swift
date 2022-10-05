//
//  FlagTableViewCell.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 02/10/22.
//

import UIKit

class FlagTableViewCell: UITableViewCell {

    lazy var flagImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(flagImage)
        NSLayoutConstraint.activate([
            self.flagImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.flagImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.flagImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.flagImage.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
