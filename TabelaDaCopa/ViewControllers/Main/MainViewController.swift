//
//  ViewController.swift
////  TabelaDaCopa
////
////  Created by Joan Wilson Oliveira on 27/09/22.
////
//
//import UIKit
//
//class MainViewController: UIViewController {
//
//    private let viewModel = TeamListViewModel()
//
//    lazy var imageCountry: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//
//        return imageView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.buildLayout()
//        downloadImage(from: URL(string: "https://countryflagsapi.com/png/qatar")!)
//
//    }
//    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//    }
//
//    public func downloadImage(from url: URL) {
//        print("Download Started")
//        getData(from: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            print(response?.suggestedFilename ?? url.lastPathComponent)
//            print("Download Finished")
//            // always update the UI from the main thread
//            DispatchQueue.main.async() { [weak self] in
//                self?.imageCountry.image = UIImage(data: data)
//            }
//        }
//    }
//
//}
//
//extension MainViewController: ViewCoding {
//    func setupView() {
//        view.backgroundColor = .red
//    }
//
//    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            imageCountry.heightAnchor.constraint(equalToConstant: 100),
//            imageCountry.widthAnchor.constraint(equalToConstant: 100),
//            imageCountry.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            imageCountry.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
//
//    }
//
//    func setupHierarchy() {
//        view.addSubview(imageCountry)
//    }
//}
