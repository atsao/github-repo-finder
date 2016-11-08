//
//  ViewController.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit
import MBProgressHUD

// Main ViewController
class RepoResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  var searchBar: UISearchBar!
  var searchSettings = GithubRepoSearchSettings()
  
  var repos: [GithubRepo]!
  
  @IBOutlet weak var tableView: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Initialize the UISearchBar
    searchBar = UISearchBar()
    searchBar.delegate = self
    
    // Add SearchBar to the NavigationBar
    searchBar.sizeToFit()
    navigationItem.titleView = searchBar
    
    // Perform the first search when the view controller first loads
    doSearch()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.estimatedRowHeight = 140
    tableView.rowHeight = UITableViewAutomaticDimension
  }
  
  // Perform the search.
  fileprivate func doSearch() {
    
    MBProgressHUD.showAdded(to: self.view, animated: true)
    
    // Perform request to GitHub API to get the list of repositories
    GithubRepo.fetchRepos(searchSettings, successCallback: { (newRepos) -> Void in
      
      // Print the returned repositories to the output window
      for repo in newRepos {
        print(repo)
      }
      self.repos = newRepos
      self.tableView.reloadData()
      
      MBProgressHUD.hide(for: self.view, animated: true)
    }, error: { (error) -> Void in
      print(error ?? "")
    })
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "RepoResultCell") as! RepoTableViewCell
    let repo = repos[indexPath.row]
    let authorName = NSMutableAttributedString(string: repo.ownerHandle!, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
    let authorByline = NSMutableAttributedString(string: "by ")
    authorByline.append(authorName)
    
    cell.avatarView.setImageWith(URL(string: repo.ownerAvatarURL!)! as URL)
    cell.repoNameLabel.text = repo.name
    cell.repoDescLabel.text = repo.desc
    cell.authorLabel.attributedText = authorByline
    cell.starsLabel.text = String(describing: repo.stars!)
    cell.forksLabel.text = String(describing: repo.forks!)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let repos = repos {
      return repos.count
    }
    return 0
  }
  
}

// SearchBar methods
extension RepoResultsViewController: UISearchBarDelegate {
  
  func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
    searchBar.setShowsCancelButton(true, animated: true)
    return true
  }
  
  func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
    searchBar.setShowsCancelButton(false, animated: true)
    return true
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.text = ""
    searchBar.resignFirstResponder()
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchSettings.searchString = searchBar.text
    searchBar.resignFirstResponder()
    doSearch()
  }
}
