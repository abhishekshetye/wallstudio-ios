//
//  ViewController.swift
//  Basics
//
//  Created by abhishek on 1/26/17.
//  Copyright © 2017 abhishek. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

struct Post{
    var id: String;
    var url: String;
    var username: String;
}

class ViewController: UITableViewController {

    let accesskey = "a9172a9ca876442d28612830fc0ea7ca903367e8a98d5464872417840f14aedf"

    let secret = "95f3ab0f7bb09bed11f7c47bb26dd76168f9fcefcc3c6d5d664c6eb6ee587f4b"
    
    
    let i = 1
    var iss : Int!
    var delegate: SameProtocol?
    
    var items = [Post]()
    var iv = UIImageView()
    
    
    private func test() {
        
        //print("\(i) \(iss)")
        
        let dog = Dog(type: "Labrador", no_of_legs: 4)
        
        delegate = dog.getInstance() //attach object with the delegate
        delegate?.protoBark()
        
        
        print(dog)
        //        print(dog.bark)
        //        dog.puppyBark()
        //        print(dog.puppyBark(whattosay: " Hummmbaaahhh"))
        dog.legs = 5
        print(dog)
        
        dog.callhim(name: "Shiro")
        dog.callhim(name: "Puppy")
        dog.callhim(name: "Pug")
        dog.callhim(name: "Labrador")
        
        dog.listAllNames()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         Do any additional setup after loading the view, typically from a nib.
//        
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = UITableViewAutomaticDimension
        
        doNetworking(url: "https://api.unsplash.com/photos?client_id=a9172a9ca876442d28612830fc0ea7ca903367e8a98d5464872417840f14aedf&page=1")
        
            }
    
    
    private func doNetworking(url: String){
        Alamofire.request(url).responseJSON { (response) in
            
            self.parse(networkdata: response.data!)
            
        }
    }
    
    private func parse(networkdata: Data){
        
        var json = JSON(data: networkdata)
        for i in 0...9{
            let id = json[i]["id"]
            let url = json[i]["urls"]["small"]
            let username = json[i]["user"]["username"]
            
            items.append(Post(id: id.description, url: url.description, username: username.description))
            
            print("id is \(id.description) and url is \(url)")
        }
        
        for item in items{
            print("Item: " + item.url)
        }
        
        tableView.reloadData()

    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let label = cell?.viewWithTag(1) as! UILabel
        label.text = items[indexPath.row].username
        let imageView = cell?.viewWithTag(2) as! UIImageView
        let Url = URL(string: items[indexPath.row].url)
        imageView.sd_setImage(with: Url, placeholderImage: UIImage.init(named: "image1.png"))
        let placeholder = UIImage.init(named: "image1.png")
        
        //cell?.sizeThatFits((image.image?.size)!)
        //image.sd_setImage(with: )
        //cell?.textLabel?.text = items[indexPath.row]
        //print((items[indexPath.row]) + "Whats up")
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
