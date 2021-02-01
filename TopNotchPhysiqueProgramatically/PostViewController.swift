//
//  PostViewController.swift
//  TopNotchPhysiqueProgramatically
//
//  Created by Tommy Smale on 9/19/20.
//  Copyright © 2020 Tommy Smale. All rights reserved.
//

import UIKit
import AVFoundation

/* ADD...
 load view
 optimal size for contentView 
 create post object 
 upload button should send obj to database
 should clear all data and take user to different view
 allow user to take picture and video
 allow user to edit media
 */
class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    //MARK: Propeties
    /*
    let profilePic = UIImageView()
    let usernameLabel = UILabel()
    let contentView = UIView()
    let defaultContent = UIImageView()
    let captionTextView = UITextView()
    let uploadButton = UIButton()
    let scrollView = UIScrollView()
    let scrollContentView = UIView()

     */
    let uploadButtonItem = UIBarButtonItem()
    let doneButtonItem = UIBarButtonItem()

    /*

    weak var uploadButtonItem: UIBarButtonItem!
    weak var doneButtonItem: UIBarButtonItem!
 */

    
    /*
    weak var uploadButtonItem: UINavigationItem!
    weak var doneButtonItem: UINavigationItem!
     */
    
    weak var scrollView: UIScrollView!
    weak var scrollContentView: UIView!
    
    weak var profilePic: UIImageView!
    weak var usernameLabel: UILabel!
    weak var contentView: UIView!
    weak var defaultContent: UIImageView!
    weak var captionTextView: UITextView!
    
    weak var paidButton: UIButton!
    weak var freeButton: UIButton!
    
    //var post: Post

    override var shouldAutorotate: Bool {
        return false
    }
    
    override func loadView() {
        super.loadView()
        
        let margins = view.safeAreaLayoutGuide
        
        /*
        let doneButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        let uploadButtonItem = UIBarButtonItem(title: "Upload", style: .plain, target: self, action: #selector(uploadButtonTapped))
        */
        
        /*
        let doneButtonItem = UINavigationItem(title: "Done")
        let uploadButtonItem = UINavigationItem(title: "Upload")
        */
        
        /*
        self.doneButtonItem = doneButtonItem
        self.uploadButtonItem = uploadButtonItem
 */
        
        let scrollView = UIScrollView()
        let scrollContentView = UIView(frame: .zero)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollContentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: margins.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollContentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            scrollContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor) //To disable horizontal scrolling
            
        ])
        
        self.scrollView = scrollView
        self.scrollContentView = scrollContentView
        
        let profile = UIImage(named: "topnotchShield")
        let profilePic = UIImageView(image: profile)
        
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        
        scrollContentView.addSubview(profilePic)
        
        NSLayoutConstraint.activate([
            profilePic.topAnchor.constraint(equalTo: scrollContentView.topAnchor),
            profilePic.heightAnchor.constraint(equalToConstant: 50),
            profilePic.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            profilePic.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        self.profilePic = profilePic
        
        let usernameLabel = UILabel()
        
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scrollContentView.addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: scrollContentView.topAnchor),
            usernameLabel.bottomAnchor.constraint(equalTo: profilePic.bottomAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 8),
            usernameLabel.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor)
        ])
        
        self.usernameLabel = usernameLabel
        
        let contentView = UIView(frame: .zero)
        let defaultPhoto = UIImage(named: "defaultPhoto")
        let defaultContent = UIImageView(image: defaultPhoto)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        defaultContent.translatesAutoresizingMaskIntoConstraints = false

        scrollContentView.addSubview(contentView)
        contentView.addSubview(defaultContent)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 8),
            contentView.heightAnchor.constraint(equalToConstant: 400),
            contentView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor),
            
            defaultContent.topAnchor.constraint(equalTo: contentView.topAnchor),
            defaultContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            defaultContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            defaultContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        self.contentView = contentView
        self.defaultContent = defaultContent
        
        //MARK: captionTextView
        let captionTextView = UITextView(frame: .zero, textContainer: nil)
        
        captionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollContentView.addSubview(captionTextView)
        
        NSLayoutConstraint.activate([
            captionTextView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8),
            captionTextView.heightAnchor.constraint(equalToConstant: 50),
            captionTextView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            captionTextView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor),
        ])
        
        self.captionTextView = captionTextView
        
        //MARK: paidButton freeButton
        let paidButton = UIButton(type: .custom)
        let freeButton = UIButton(type: .custom)
        
        paidButton.translatesAutoresizingMaskIntoConstraints = false
        freeButton.translatesAutoresizingMaskIntoConstraints = false
        
        scrollContentView.addSubview(paidButton)
        scrollContentView.addSubview(freeButton)
        
        NSLayoutConstraint.activate([
            paidButton.topAnchor.constraint(equalTo: captionTextView.bottomAnchor, constant: 8),
            paidButton.bottomAnchor.constraint(equalTo: scrollContentView.bottomAnchor),
            paidButton.trailingAnchor.constraint(equalTo: scrollContentView.centerXAnchor),
            paidButton.widthAnchor.constraint(equalToConstant: 100),
            
            freeButton.topAnchor.constraint(equalTo: captionTextView.bottomAnchor, constant: 8),
            freeButton.bottomAnchor.constraint(equalTo: scrollContentView.bottomAnchor),
            freeButton.leadingAnchor.constraint(equalTo: scrollContentView.centerXAnchor, constant: 8),
            freeButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        self.paidButton = paidButton
        self.freeButton = freeButton

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Post"
        self.modalPresentationStyle = .none
        //self.navigationItem.rightBarButtonItem = uploadButtonItem
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(uploadButtonTapped))
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        /*
        let doneButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        let uploadButtonItem = UIBarButtonItem(title: "Upload", style: .plain, target: self, action: #selector(uploadButtonTapped))
        self.navigationItem.rightBarButtonItems = [uploadButtonItem, doneButtonItem]
         */
        //self.navigationItem.setRightBarButton(self.uploadButtonItem, animated: true)

        setupProfilePic()
        setupUsernameLabel()
        setupContentView()
        setupCaptionTextView()
        setupFreeButton()
        setupPaidButton()

    }
    
    func setupProfilePic() {
        profilePic.contentMode = .scaleAspectFit
    }
    
    func setupUsernameLabel() {
        usernameLabel.text = "username"
        usernameLabel.backgroundColor = .white
        usernameLabel.contentMode = .scaleAspectFill
    }
    
    func setupContentView() {
        contentView.layer.cornerRadius = 14
        contentView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.selectContent(_:))) //_ bc parameter is unamed
        contentView.addGestureRecognizer(tap)
        contentView.backgroundColor = .white
        defaultContent.contentMode = .scaleAspectFit //Make sure image you have here is huge. So when content hugging or compression it scales to fit whole frame
    }
    
    //MARK: captionTextView
    func setupCaptionTextView() {
        captionTextView.text = "Write a caption..."
        captionTextView.textColor = .lightGray
        captionTextView.backgroundColor = .white
        captionTextView.textAlignment = .left
        captionTextView.layer.borderWidth = 1.0
        captionTextView.layer.borderColor = UIColor.black.cgColor
        captionTextView.delegate = self
        captionTextView.keyboardDismissMode = .interactive
        
        captionTextView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        captionTextView.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        print("caption text field after setup \(self.captionTextView.frame.origin)")

        //May possibly want to add observers to viewWillAppear or viewWillDissappeear 
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setupFreeButton() {
        self.freeButton.layer.borderWidth = 1
        self.freeButton.layer.borderColor = UIColor.black.cgColor
        self.freeButton.backgroundColor = .white
        self.freeButton.showsTouchWhenHighlighted = true
        self.freeButton.setTitle("Free", for: UIControl.State.normal)
        self.freeButton.setTitleColor(.purple, for: .normal)
        self.freeButton.addTarget(self, action: #selector(freeButtonTapped), for: .touchDown)
    }
    
    func setupPaidButton() {
        self.paidButton.layer.borderWidth = 1
        self.paidButton.layer.borderColor = UIColor.black.cgColor
        self.paidButton.backgroundColor = .white
        self.paidButton.showsTouchWhenHighlighted = true
        self.paidButton.setTitle("Paid", for: UIControl.State.normal)
        self.paidButton.setTitleColor(.purple, for: .normal)
        self.paidButton.addTarget(self, action: #selector(paidButtonTapped), for: .touchDown)
    }
    
    @objc func selectContent(_ sender: UITapGestureRecognizer) {
        let contentPickerController = UIImagePickerController()
        contentPickerController.sourceType = .photoLibrary
        contentPickerController.delegate = self
        present(contentPickerController, animated: true, completion: nil)
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //initialize content var in post object
        //dismiss
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            defaultContent.image = selectedImage
        }
        
        if let selectedVideo = info[UIImagePickerController.InfoKey.mediaURL] as? URL {
            defaultContent.removeFromSuperview()
            let videoPlayer = AVPlayer(url: selectedVideo)
            let playerLayer = AVPlayerLayer(player: videoPlayer)
            playerLayer.frame = contentView.bounds
            contentView.layer.addSublayer(playerLayer)
        }
        
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        //uploadButtonItem.isEnabled = true
        
        dismiss(animated: true, completion: nil)
            
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: UITextViewDelegate
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
        textView.textColor = .black
        
        //Maybe change nav bar so that is changes
        //self.navigationItem.setRightBarButton(doneButtonItem, animated: true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        //self.navigationItem.setRightBarButton(uploadButtonItem, animated: true)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Upload", style: .plain, target: self, action: #selector(uploadButtonTapped))
        self.navigationItem.rightBarButtonItem?.isEnabled = false 
        textView.resignFirstResponder()
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
    }
    
    @objc func doneButtonTapped() {
        if(!textViewShouldEndEditing(captionTextView)) {
            fatalError("Post view controller doneButtonTapped()")
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        print("Key board size \(keyboardSize)")
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        print("self.view.frame \(self.view.frame)")
        var aRect: CGRect = self.view.frame
        aRect.size.height -= keyboardSize.height
        print("arect.size.height \(aRect.size.height), self.captionTextView.frame.origin \(self.captionTextView.frame.origin)")
        if(!aRect.contains(self.captionTextView.frame.origin)) {
            print("scrollRectToVisibile")
            print("self.captionTextView.frame \(self.captionTextView.frame)")
            self.scrollView.scrollRectToVisible(self.captionTextView.frame, animated: true)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        //self.view.frame.origin.y = 0
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func uploadButtonTapped() {
        print("Upload button tapped")
        //self.present(FeedTableViewController(), animated: true, completion: nil)
        //self.show(FeedTableViewController(), sender: self)
        //self.navigationController?.pushViewController(FeedTableViewController(), animated: true)
        tabBarController?.selectedIndex = 0
    }
    
    @objc func freeButtonTapped() {
        print("Free button tapped")
    }
    
    @objc func paidButtonTapped() {
        print("Paid button tapped")
    }
    
    /*
    @objc func uploadButtonPressed(sender: UIButton!) {
        
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
