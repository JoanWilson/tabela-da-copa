//
//  MatchesService.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 04/10/22.
//

import Foundation

public final class MatchesClient {

    func fetchMatches(completionHandler: @escaping ([Match]) -> Void) {
        let url = URL(string: "https://fixturedownload.com/feed/json/fifa-world-cup-2022/argentina")!

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error with fetching matches \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }

            if let data = data {
                do {
                    let matches = try JSONDecoder().decode(Matches.self, from: data)
                    completionHandler(matches)

                } catch {
                    print(error)
                }
            }

        }
        task.resume()
    }

}
