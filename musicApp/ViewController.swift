//
//  ViewController.swift
//  musicApp
//
//  Created by Siripoom Jaruphoom on 25/10/23.
//

import UIKit
import WebKit
import AVKit
import AVFoundation

class ViewController: UIViewController,WKUIDelegate,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var lbsong: UILabel!
    @IBOutlet weak var lbArtname: UILabel!
    @IBOutlet weak var lbstatus: UILabel!
    
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var play: UIButton!
  
    @IBOutlet weak var pause: UIButton!
    var playBack:TimeInterval = 0.0
    
    @IBAction func btnPlay(_ sender: Any) {
        guard let path = Bundle.main.path(forResource: songtitle[selectedRow], ofType: "mp4")
        else {
            return
        }
        let url = URL(filePath: path)
        do {
            soundPlayer = try? AVAudioPlayer(contentsOf: url)
            soundPlayer?.currentTime=playBack
            soundPlayer?.play()
        }
        
        play.isHidden=true
        pause.isHidden=false
        lbsong.text=jpName[selectedRow]
        lbstatus.text="Now, Playing..."
        
    }
    
    @IBAction func btnpause(_ sender: Any) {
        soundPlayer?.pause()
        playBack=soundPlayer!.currentTime
        
        play.isHidden=false
        pause.isHidden=true
        lbstatus.text="pause..."
        
    }
    @IBAction func btnStop(_ sender: Any) {
        soundPlayer?.pause()
        hide()
    }
    
    @IBAction func mv(_ sender: Any) {
        let path = Bundle.main.path(forResource: songtitle[selectedRow], ofType : "mp4")!
        let videoURL = URL(fileURLWithPath: path)
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
            }
    }
    @IBAction func song(_ sender: Any) {
        play.isHidden=false
        stop.isHidden=false
        lbsong.isHidden=false
        lbstatus.isHidden=false
    }
    
    var soundPlayer:AVAudioPlayer?
    var vdoPlayer:AVPlayer?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songtitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath)
        
        var ct = cell.defaultContentConfiguration()
        ct.text = songtitle[indexPath.row].capitalized
        ct.textProperties.font=UIFont.systemFont(ofSize: 25)
        ct.textProperties.font = UIFont(name: "Futura", size: ct.textProperties.font.pointSize)!
        
        cell.contentConfiguration=ct
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow=indexPath.row
        soundPlayer?.pause()
        playBack=0
        lbsong.text="-------"
       
        }
    
    var urlArtist=String()
    var count=Int()
    var songtitle=[String]()
    var artname=String()
    var selectedRow=Int()
    var jpName=[String]()

    @IBOutlet weak var webshow: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        url()
        hide()
        lbArtname.text=artname.uppercased()
        // Do any additional setup after loading the view.
    }
    func hide() {
        lbstatus.isHidden=true
        lbsong.isHidden=true
        play.isHidden=true
        pause.isHidden=true
        stop.isHidden=true
    }
    func url() {
        let myUrl = URL(string: urlArtist)
        let myrq = URLRequest(url: myUrl!)
        webshow.load(myrq)
    }
    
   
}

