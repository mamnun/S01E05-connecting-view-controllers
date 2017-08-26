//
//  AppDelegate.swift
//  Example
//
//  Created by Chris Eidhof on 17/05/16.
//  Copyright © 2016 objc.io. All rights reserved.
//

import UIKit


struct Episode {
    var title: String
}


class ProfileViewController: UIViewController {
    var person: String = ""
}


class EpisodesViewController: UITableViewController {
    let episodes = [Episode(title: "Episode One"), Episode(title: "Episode Two"), Episode(title: "Episode Three")]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let episode = episodes[indexPath.row]
        cell.textLabel?.text = episode.title
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController {
            vc.episode = episodes[tableView.indexPathForSelectedRow!.row]
        } else if let nc = segue.destination as? UINavigationController,
            let pvc = nc.viewControllers.first as? ProfileViewController {
            pvc.person = "My Name"
        } else {
            fatalError("unknown segue")
        }
    }
    
    @IBAction func unwindToHere(_ segue: UIStoryboardSegue) {
    }
}


class DetailViewController: UIViewController {
    @IBOutlet weak var label: UILabel? {
        didSet {
            label?.text = episode?.title
        }
    }
    var episode: Episode?
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}

