//
//  ImageTableViewController.swift
//  SlideImage
//
//  Created by 羅壽之 on 2020/12/17.
//

import UIKit

class ImageTableViewController: UITableViewController, PageIndexDelegate {
    
    @IBOutlet var placeTitle: UILabel!
    @IBOutlet var pageIndicator: UIPageControl!

    
    var selectedPlace: (name:String, description:String, photoCount: Int, photoName: [String])!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeTitle.text = selectedPlace.name
        pageIndicator.numberOfPages = selectedPlace.photoCount
        //updatePageIndex(currentIndex: 0)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
   
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.placeDescription.text = selectedPlace.description

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let des = segue.destination as! PageViewController
        des.photoSet = selectedPlace.photoName
        des.indexDelegate = self
    }

    func updatePageIndex(currentIndex: Int) {
        pageIndicator.currentPage = currentIndex
    }
    
}
