//
//  ProfileViewController.swift
//  TopNotchPhysiqueProgramatically
//
//  Created by Tommy Smale on 10/18/20.
//  Copyright © 2020 Tommy Smale. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate/*, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout*/ {

    //let profPic = UIImageView()
    //let followersView = UIView()
    //let usernameLabel = UILabel()
    //let profileBio = UILabel()
    //let editProfileButton = UIButton()
    //let previewsView = UIView()
    
    weak var profPic: UIImageView!
    weak var followersView: UIView!
    weak var followersLabel: UILabel!
    
    weak var usernameLabel: UILabel!
    weak var bioLabel: UILabel!
    
    weak var editButton: UIButton!
    
    weak var previewsView: UIView!
    weak var previewsLabel: UILabel!
    weak var preview1: UIImageView!
    weak var preview2: UIImageView!
    weak var preview3: UIImageView!
    
    weak var collectionView: UICollectionView!
    

    
    override func loadView() {
        super.loadView()
        
        let margins = view.safeAreaLayoutGuide
        
        let defaultPhoto = UIImage(named: "defaultPhoto")
        let profPic = UIImageView(image: defaultPhoto)
        let followersView = UIView(frame: .zero)
        let followersLabel = UILabel()
        
        profPic.translatesAutoresizingMaskIntoConstraints = false
        followersView.translatesAutoresizingMaskIntoConstraints = false
        followersLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(profPic)
        view.addSubview(followersView)
        followersView.addSubview(followersLabel)
        
        
        NSLayoutConstraint.activate([
            profPic.topAnchor.constraint(equalTo: margins.topAnchor),
            profPic.heightAnchor.constraint(equalToConstant: 100),
            profPic.trailingAnchor.constraint(equalTo: margins.centerXAnchor),
            profPic.widthAnchor.constraint(equalToConstant: 100),
        ])
        
        NSLayoutConstraint.activate([
            followersView.topAnchor.constraint(equalTo: profPic.topAnchor),
            followersView.bottomAnchor.constraint(equalTo: profPic.bottomAnchor),
            followersView.leadingAnchor.constraint(equalTo: margins.centerXAnchor, constant: 8),
            followersView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            followersLabel.topAnchor.constraint(equalTo: followersView.topAnchor),
            followersLabel.bottomAnchor.constraint(equalTo: followersView.bottomAnchor),
            followersLabel.leadingAnchor.constraint(equalTo: followersView.leadingAnchor),
            followersLabel.trailingAnchor.constraint(equalTo: followersView.trailingAnchor)
        ])
        
        self.profPic = profPic
        self.followersView = followersView
        self.followersLabel = followersLabel
        
        let usernameLabel = UILabel()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: profPic.bottomAnchor, constant: 8),
            usernameLabel.heightAnchor.constraint(equalToConstant: 25),
            usernameLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            usernameLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
        
        self.usernameLabel = usernameLabel
        
        let bioLabel = UILabel()
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioLabel)
        
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8),
            bioLabel.heightAnchor.constraint(equalToConstant: 50),
            bioLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
        
        self.bioLabel = bioLabel
        
        let editButton = UIButton(type: .custom)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editButton)
        
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 8),
            editButton.heightAnchor.constraint(equalToConstant: 30),
            editButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 8),
            editButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -8)
        ])
        
        self.editButton = editButton
        
        let previewsView = UIView(frame: .zero)
        let previewsLabel = UILabel()
        let preview1 = UIImageView(image: defaultPhoto)
        let preview2 = UIImageView(image: defaultPhoto)
        let preview3 = UIImageView(image: defaultPhoto)
        
        previewsView.translatesAutoresizingMaskIntoConstraints = false
        previewsLabel.translatesAutoresizingMaskIntoConstraints = false
        preview1.translatesAutoresizingMaskIntoConstraints = false
        preview2.translatesAutoresizingMaskIntoConstraints = false
        preview3.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(previewsView)
        previewsView.addSubview(previewsLabel)
        let previews = [preview1, preview2, preview3]
        for preview in previews {
            previewsView.addSubview(preview)
        }
        
        NSLayoutConstraint.activate([
            previewsView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 8),
            previewsView.heightAnchor.constraint(equalToConstant: 144),
            previewsView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            previewsView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            previewsLabel.topAnchor.constraint(equalTo: previewsView.topAnchor, constant: 8),
            previewsLabel.heightAnchor.constraint(equalToConstant: 20),
            previewsLabel.leadingAnchor.constraint(equalTo: previewsView.leadingAnchor),
            previewsLabel.trailingAnchor.constraint(equalTo: previewsView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            preview1.topAnchor.constraint(equalTo: previewsLabel.bottomAnchor, constant: 8),
            preview1.heightAnchor.constraint(equalToConstant: 100),
            preview1.trailingAnchor.constraint(equalTo: preview2.leadingAnchor, constant: -8),
            preview1.widthAnchor.constraint(equalToConstant: 100),
        ])
        
        NSLayoutConstraint.activate([
            preview2.topAnchor.constraint(equalTo: previewsLabel.bottomAnchor, constant: 8),
            preview2.heightAnchor.constraint(equalToConstant: 100),
            preview2.centerXAnchor.constraint(equalTo: previewsView.centerXAnchor),
            preview2.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            preview3.topAnchor.constraint(equalTo: previewsLabel.bottomAnchor, constant: 8),
            preview3.heightAnchor.constraint(equalToConstant: 100),
            preview3.leadingAnchor.constraint(equalTo: preview2.trailingAnchor, constant: 8),
            preview3.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        self.previewsView = previewsView
        self.previewsLabel = previewsLabel
        self.preview1 = preview1
        self.preview2 = preview2
        self.preview3 = preview3
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: previewsView.bottomAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        self.collectionView = collectionView
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Profile"
        self.view.backgroundColor = .white
        
        setupProfPic()
        setupFollowersView()
        setupUsernameLabel()
        setupProfileBio()
        setupEditProfileButton()
        setupPreviewsView()
        setupContentCollectionView()

    }
    
    func setupProfPic() {

        profPic.image = UIImage(named: "defaultPhoto")
        profPic.contentMode = .scaleAspectFit

    }
    
    func setupFollowersView() {
        
        self.followersLabel.numberOfLines = 2
        self.followersLabel.layer.borderWidth = 2
        self.followersLabel.layer.borderColor = UIColor.purple.cgColor

        let followers = 0
        //self.followersLabel.font = self.followersLabel.font.withSize(15)
        self.followersLabel.textAlignment = .center
        self.followersLabel.text = "\(followers)\nFollowers"
        self.followersLabel.backgroundColor = .white

    }
    
    func setupUsernameLabel() {
        
        self.usernameLabel.backgroundColor = .white
        self.usernameLabel.text = "Jonas Smith"

    }
    
    func setupProfileBio() {
        
        self.bioLabel.backgroundColor = .white
        self.bioLabel.numberOfLines = 2
        self.bioLabel.text = "Bio\nA⏀"
        
    }
    
    func setupEditProfileButton() {
        
        self.editButton.layer.borderWidth = 1
        self.editButton.layer.borderColor = UIColor.purple.cgColor
        self.editButton.backgroundColor = .white
        self.editButton.showsTouchWhenHighlighted = true
        self.editButton.setTitle("Edit Profile", for: UIControl.State.normal)
        self.editButton.setTitleColor(.purple, for: .normal)
        self.editButton.addTarget(self, action: #selector(editProfileButtonTapped), for: .touchDown)

    }
    
    @IBAction func editProfileButtonTapped(sender: UIButton) {
        self.navigationController?.pushViewController(EditProfileViewController(), animated: false)
    }
    
    func setupPreviewsView() {
        
        self.previewsView.backgroundColor = .white
        self.previewsView.layer.borderWidth = 1
        self.previewsView.layer.borderColor = UIColor.lightGray.cgColor

        
        self.previewsLabel.text = "Previews"
        self.previewsLabel.textAlignment = .center
            
        let previews = [self.preview1, self.preview2, self.preview3]
        for preview in previews {
            preview!.image = UIImage(named: "defaultPhoto")
            preview!.layer.masksToBounds = true
            preview!.layer.cornerRadius = 50
            preview!.layer.borderWidth = 1
        }
    }

    func setupContentCollectionView() {
        
        self.collectionView.delegate = self
        self.collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.backgroundColor = .red
        
        
    }
    
    /*
    extension UIViewController : UICollectionViewDataSource {
        func collectionView(_ collectionView: UIC)
    }
 */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
