//
//  TableViewController.swift
//  SlideImage
//
//  Created by 羅壽之 on 2020/12/17.
//

import UIKit

class TableViewController: UITableViewController {
    
    var places: [(name:String, description:String, photoCount: Int, photoName: [String])] = [
        (name: "Taipei 101", description: "The Taipei 101 (台北101) is a supertall skyscraper designed by C.Y. Lee and C.P. Wang in Xinyi, Taipei, Taiwan. This building was officially classified as the world's tallest from its opening in 2004 until the 2010 completion of the Burj Khalifa in Dubai, UAE.", photoCount: 2, photoName: ["photo0_0", "photo0_1"]),
        (name: "Taroko National Park", description: "Taroko National Park (太魯閣國家公園) is one of the nine national parks in Taiwan and was named after the Taroko Gorge, the landmark gorge of the park carved by the Liwu River. The park spans Taichung Municipality, Nantou County, and Hualien County and is located at Xiulin Township, Hualien County, Taiwan.", photoCount: 3, photoName: ["photo1_0", "photo1_1", "photo1_2"]),
        (name: "Kenting National Park", description: "Kenting National Park (墾丁國家公園) is a national park located on the Hengchun Peninsula of Pingtung County, Taiwan, covering Hengchun, Checheng, and Manzhou Townships. Established on 1 January 1984, it is Taiwan's oldest and the southernmost national park on the main island, covering the southernmost area of the Taiwan island along Bashi Channel.", photoCount: 2, photoName: ["photo2_0", "photo2_1"])
        ]
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
   
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = places[indexPath.row].name

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let des = segue.destination as! ImageTableViewController
        let selectedRow = tableView.indexPathForSelectedRow!.row
        des.selectedPlace = places[selectedRow]
    }
}
