//
//  TableViewController.swift
//  musicApp
//
//  Created by Siripoom Jaruphoom on 25/10/23.
//

import UIKit

class TableViewController: UITableViewController {
    
    let loadPlist = loading()
    var name=[String]()
    var pic=[String]()
    var url=[String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight=180
        addData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func addData() {
        name=loadPlist.load(file: "artistList")
        pic=loadPlist.load(file: "artistList")
        url=loadPlist.load(file: "ArtistURL")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return name.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "data", for: indexPath) as! tbvc
        cell.lbName.text=name[indexPath.row]
        cell.img.image=UIImage(named: pic[indexPath.row])
        
        return cell
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rowClick:Int=self.tableView.indexPathForSelectedRow!.row
        print(rowClick)
        if segue.identifier == "passdata"
        {
            let viewctrl = segue.destination as! ViewController
            viewctrl.urlArtist=url[rowClick]
            viewctrl.count=rowClick
            viewctrl.songtitle=artistclick(n: rowClick)
            viewctrl.artname=name[rowClick]
            viewctrl.jpName=jpn(n: rowClick)
            
            func artistclick(n:Int) -> [String] {
                switch n {
                case 0 :
                    return ["ending","phantom thief","kiiro","happy end"]
                case 1 :
                    return ["garden","kaerou","hedemo ne-yo","kirari"]
                case 2 :
                    return ["lemon","shunrai","kick back","spinning globe"]
                default:
                    return ["comet","monster","probably","tracing that dream"]
                }
                
            }
            func jpn(n:Int) -> [String] {
                switch n {
                case 0 :
                    return ["エンディング","怪盗","黄色","ハッピーエンド"]
                case 1 :
                    return ["ガーデン","帰ろう","へでもねーよ","きらり"]
                case 2 :
                    return ["レモン","春雷","キックバック","地球儀"]
                default:
                    return ["優しい彗星","怪物","たぶん","あの夢をなぞって"]
                }
                
                
                
            }
            
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
