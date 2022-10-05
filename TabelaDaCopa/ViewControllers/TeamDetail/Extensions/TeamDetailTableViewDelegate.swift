//
//  TeamListTableViewDelegate.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 01/10/22.
//

import Foundation
import UIKit

extension TeamDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
