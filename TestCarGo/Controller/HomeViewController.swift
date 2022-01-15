//
//  HomeViewController.swift
//  TestCarGo
//
//  Created by alaa on 14/01/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    //MARK:- Outlets
    
    @IBOutlet weak var postsList: UITableView!
    @IBOutlet weak var storysCollection: UICollectionView!
    
    //MARK:- Variables
    
    private let floatingButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
         button.layer.masksToBounds = true
         button.layer.cornerRadius = 30
        button.backgroundColor = Theme.currentTheme.themeBlueColor
        button.setImage(UIImage(named: "NotificationIcon")!, for: .normal)
        return button
    }()
    
    var CollectionViewIdentifier = "HomeCollectionViewCell"
    var CollectionViewIdentifierTwoImage = "CustomStoryViewCell"
    var TableViewIdentifier = "HomeTableViewCell"
    
    var arrStory : [StoryM] = [
        StoryM.init(id: 0, imageIcone:  UIImage(named: "person")!, imageNextIcone: nil, name: "Yasser", newStyle: false),
        StoryM.init(id: 1, imageIcone:  UIImage(named: "claudia_mahler")!, imageNextIcone: nil, name: "yuman", newStyle: false),
        StoryM.init(id: 2, imageIcone:  UIImage(named: "person")!, imageNextIcone: nil, name: "ali", newStyle: false),
        StoryM.init(id: 3, imageIcone:  UIImage(named: "person")!, imageNextIcone:   UIImage(named: "claudia_mahler")!, name: "jessy", newStyle: false),
        StoryM.init(id: 4, imageIcone:  UIImage(named: "person")!, imageNextIcone: nil, name: "ibrahim", newStyle: false),
        StoryM.init(id: 5, imageIcone:  UIImage(named: "r")!, imageNextIcone: nil, name: "ola", newStyle: false),
        StoryM.init(id: 6, imageIcone:  UIImage(named: "claudia_mahler")!, imageNextIcone: nil, name: "aseer", newStyle: false),
        StoryM.init(id: 7, imageIcone:  UIImage(named: "person")!, imageNextIcone: nil, name: "jess", newStyle: false),
        StoryM.init(id: 8, imageIcone:  UIImage(named: "images")!, imageNextIcone: nil, name: "gagan", newStyle: false),
        StoryM.init(id: 9, imageIcone:  UIImage(named: "r")!, imageNextIcone: nil, name: "edna", newStyle: false),
        StoryM.init(id: 10, imageIcone:  UIImage(named: "person")!, imageNextIcone: nil, name: "yomana", newStyle: false),
        StoryM.init(id: 11, imageIcone:  UIImage(named: "claudia_mahler")!, imageNextIcone: nil, name: "yusra", newStyle: false),
        StoryM.init(id: 12, imageIcone:  UIImage(named: "r")!, imageNextIcone: nil, name: "esraa", newStyle: false),
        StoryM.init(id: 13, imageIcone:  UIImage(named: "person")!, imageNextIcone: nil, name: "eman", newStyle: false),
        StoryM.init(id: 14, imageIcone:  UIImage(named: "images")!, imageNextIcone: nil, name: "Yasser", newStyle: false),
        StoryM.init(id: 15, imageIcone:  UIImage(named: "person")!, imageNextIcone: nil, name: "Yasser", newStyle: false),
        StoryM.init(id: 16, imageIcone:  UIImage(named: "images")!, imageNextIcone: nil, name: "Yasser", newStyle: false),
        StoryM.init(id: 17, imageIcone:  UIImage(named: "person")!, imageNextIcone: nil, name: "Yasser", newStyle: false),
        StoryM.init(id: 18, imageIcone:  UIImage(named: "r")!, imageNextIcone: nil, name: "Yasser", newStyle: false),
        StoryM.init(id: 19, imageIcone:  UIImage(named: "images")!, imageNextIcone: nil, name: "Yasser", newStyle: false),StoryM.init(id: 20, imageIcone:  UIImage(named: "person")!, imageNextIcone: nil, name: "Yasser", newStyle: false)]
    
    var arrPosts : [PostsM] = [
        PostsM.init(id: 0, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Wow makes me want a holiday "),
        PostsM.init(id: 1, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Pop songs just hit different  when  you are  driving "),
        PostsM.init(id: 2, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Located roughly halfway between the Croatian capital Zagreb and Zadar on the coast of the Adriatic Sea, "),
        PostsM.init(id: 3, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "person")!, postTxt: "Pop songs just hit different  when  you are  driving "),
        PostsM.init(id: 4, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Located roughly halfway between the Croatian capital Zagreb and Zadar on the coast of the Adriatic Sea,"),
        PostsM.init(id: 5, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Pop songs just hit different  when  you are  driving "),
        PostsM.init(id: 6, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "person")!, postTxt: "Pop songs just hit different  when  you are  driving "),
        PostsM.init(id: 7, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Pop songs just hit different  when  you are  driving "),
        PostsM.init(id: 8, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "person")!, postTxt: "Pop songs just hit different  when  you are  driving "),
        PostsM.init(id: 9, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Pop songs just hit different  when  you are  driving "),
        PostsM.init(id: 10, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Weighing in at about 8000 kg this Elephant from Tanzania is believed to be the largest in the world  "),
        PostsM.init(id: 11, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Pop songs just hit different  when  you are  driving "),
        PostsM.init(id: 12, time: "2/10/2001", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Pop songs just hit different  when  you are  driving "),
        PostsM.init(id: 13, time: "2/10/2001", email: "2/10/2001", name: "alaa", personalImage: UIImage(named: "person")!, postTxt: "Located roughly halfway between the Croatian capital Zagreb and Zadar on the coast of the Adriatic Sea,"),
        PostsM.init(id: 14, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Wow makes me want a holiday  "),
        PostsM.init(id: 15, time: "2/10/2001", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Weighing in at about 8000 kg this Elephant from Tanzania is believed to be the largest in the world  "),
        PostsM.init(id: 15, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Pop songs just hit different  when  you are  driving "),
        PostsM.init(id: 16, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Located roughly halfway between the Croatian capital Zagreb and Zadar on the coast of the Adriatic Sea, "),
        PostsM.init(id: 17, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Pop songs just hit different  when  you are  driving "),
        PostsM.init(id: 18, time: "2/10/2001", email: "2/10/2001", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Pop songs just hit different  when  you are  driving "),
        PostsM.init(id: 19, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Pop songs just hit different  when  you are  driving "),
        PostsM.init(id: 20, time: "2m", email: "alaa@gmai.com", name: "alaa", personalImage: UIImage(named: "claudia_mahler")!, postTxt: "Located roughly halfway between the Croatian capital Zagreb and Zadar on the coast of the Adriatic Sea, ")]
        
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    //MARK:- Load Methods
    
    // will   always load with calling screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        xibCells()
        
        
    }
    
    
    // load only one time
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTools()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton.frame = CGRect(x: view.frame.width - 70, y: view.frame.height - 150, width: 60, height: 60)
    }
    
    
    //MARK:- Actions
    
    
    //MARK:- Methods
    
   
    @objc func addPost()
    {
        let sBoard = UIStoryboard(name: "Main", bundle: nil)
        let targetVC = sBoard.instantiateViewController(withIdentifier: "PostViewController") as! PostViewController
        
       // targetVC.categoryId = CategoriesVM.categoryListData?[index].categoryId ?? 0
        self.navigationController?.pushViewController(targetVC, animated: true)
     
    }
    
    func setupTools() {
        
        let logo = UIImage(named: "Logo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        view.addSubview(floatingButton)
        floatingButton.addTarget(self, action: #selector(addPost), for: .touchUpInside)
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Cancel", style: .plain, target: self, action: nil)
        
    }
    
   
    private func xibCells() {
        
        storysCollection.delegate = self
        storysCollection.dataSource = self
        
        postsList.delegate = self
        postsList.dataSource = self
        
        let xibCell = UINib.init(nibName: CollectionViewIdentifier, bundle: nil)
        storysCollection.register(xibCell, forCellWithReuseIdentifier:  CollectionViewIdentifier )
        
        let xibCell1 = UINib.init(nibName: CollectionViewIdentifierTwoImage, bundle: nil)
        storysCollection.register(xibCell1, forCellWithReuseIdentifier:  CollectionViewIdentifierTwoImage )
        
        
        let xibTableCell = UINib.init(nibName: TableViewIdentifier, bundle: nil)
        postsList.register(xibTableCell, forCellReuseIdentifier: TableViewIdentifier)
        
    }
    
    
    
    
    //MARK:- Networking
    
    
    
    
}


extension HomeViewController : UICollectionViewDelegate ,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout, UITableViewDelegate,UITableViewDataSource , likeBtnCellDelegate{
   
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = postsList.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as!  HomeTableViewCell
        
        cell.personalImage.image = arrPosts[indexPath.row].personalImage
        cell.name.text = arrPosts[indexPath.row].name
        cell.time.text = arrPosts[indexPath.row].time
        cell.email.text = arrPosts[indexPath.row].email
        cell.postTxt.text = arrPosts[indexPath.row].postTxt
        cell.likeAction.tag = indexPath.item
        cell.delegate = self
        return cell
        
    }
    
    func cellButtonClicked() {
        globalAlert(title: "ok", message: "test")
        print("great")
    }

 
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrStory.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 3 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomStoryViewCell", for: indexPath) as!  CustomStoryViewCell
            
            cell.image.image = arrStory[indexPath.row].imageIcone
            cell.secondimage.image = arrStory[indexPath.row].imageNextIcone
            cell.title.text = arrStory[indexPath.row].name
            cell.backgroundColor = .clear
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as!  HomeCollectionViewCell
            
            cell.image.image = arrStory[indexPath.row].imageIcone
            cell.title.text = arrStory[indexPath.row].name
            cell.backgroundColor = .clear
            return cell
            
            
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 3 {
            
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.minimumInteritemSpacing = 20
            layout.minimumLineSpacing = 10
            layout.invalidateLayout()
            let height = 80
            let width = 96
            return CGSize(width: CGFloat(width), height: CGFloat(height))
            
            
            
        }else{
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.minimumInteritemSpacing = 20
            layout.minimumLineSpacing = 10
            layout.invalidateLayout()
            let height = 80
            let width = 60
            return CGSize(width: CGFloat(width), height: CGFloat(height))
        }
        
    }
    
    
}
