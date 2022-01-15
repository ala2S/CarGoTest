//
//  PostViewController.swift
//  TestCarGo
//
//  Created by Hamilton on 15/01/2022.
//

import UIKit

class PostViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    //MARK:- Outlets
    @IBOutlet weak var imageCollection: UICollectionView!
    @IBOutlet weak var tableChat: UITableView!
    //MARK:- Variables
    
    var TableViewIdentifier = "PostsTableViewCell"
    var ViewIdentifier = "ImagesCollectionViewCell"

    var arrPosts : [ChatM] = [
        ChatM.init(id: 0, personalImage: UIImage(named: "person")!, postTxt: "Located roughly halfway between the Croatian capital Zagreb and Zadar on the coast of the Adriatic Sea")]
    
    
    var arrimage : [UIImage] = [UIImage(named: "person")!,UIImage(named: "person")!,UIImage(named: "person")!,UIImage(named: "person")!,UIImage(named: "person")!,UIImage(named: "person")!,UIImage(named: "person")!,UIImage(named: "person")!,UIImage(named: "person")!,UIImage(named: "person")!,UIImage(named: "person")!,UIImage(named: "person")!,UIImage(named: "person")!,UIImage(named: "person")!,UIImage(named: "person")!]
    
    //MARK:- LoadMethods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btnTweet = UIBarButtonItem()
        btnTweet.title = "tweet"
        btnTweet.action = #selector(tweet)
        btnTweet.target = self
        btnTweet.customView?.cornerRadius = 10
        btnTweet.customView?.layer.backgroundColor = Theme.currentTheme.themeBlueColor.cgColor
        navigationItem.rightBarButtonItem = btnTweet
        UINavigationBar.appearance().backIndicatorImage = UIImage()
        xibCells()
        
        
        
    }
    
    //MARK:- Actions
    
    @objc func tweet()
    {
        
    }
    //MARK:- Methods
    private func xibCells() {
        
        tableChat.delegate = self
        tableChat.dataSource = self
        imageCollection.delegate = self
        imageCollection.dataSource = self
        
        let xibTableCell = UINib.init(nibName: TableViewIdentifier, bundle: nil)
        tableChat.register(xibTableCell, forCellReuseIdentifier: TableViewIdentifier)
        
        let xibImagesCell = UINib.init(nibName: ViewIdentifier, bundle: nil)
        imageCollection.register(xibImagesCell, forCellWithReuseIdentifier: ViewIdentifier)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableChat.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath) as!  PostsTableViewCell
        
        cell.postimage.image = arrPosts[indexPath.row].personalImage
        
        cell.postTxt.text = arrPosts[indexPath.row].postTxt
        
        return cell
    }
    
    
}


extension PostViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout ,UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrimage.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
  
            
            let cell = imageCollection.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionViewCell", for: indexPath) as!  ImagesCollectionViewCell
            
            cell.images.image = arrimage[indexPath.row]
            return cell
            
        }
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.minimumInteritemSpacing = 5
            layout.minimumLineSpacing = 5
            layout.invalidateLayout()
            let height = 60
            let width = 60
            return CGSize(width: CGFloat(width), height: CGFloat(height))
            
            
        }
        
        
}
