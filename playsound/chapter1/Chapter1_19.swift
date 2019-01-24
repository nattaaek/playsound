
import UIKit
import AVFoundation


class Chapter1_19: UIViewController, AVAudioPlayerDelegate,UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBAction func nextPage(_ sender: Any) {
        if currentColor != "" {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_20") as! Chapter1_20
            vc.pictureColor = currentColor
            self.present(vc, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Please select color to fill the star", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    var currentColor: String = ""
    let colors = ["black","blue","brown","cyan","green","magenta","orange","purple","red","yellow","salmon","lavender"]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentColor = colors[indexPath.row]
        removeColor()

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colorsPalette.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
      

        switch colors[indexPath.row] {
        case "black":
            cell.backgroundColor = UIColor.black
        case "blue":
            cell.backgroundColor = UIColor.blue
        case "brown":
            cell.backgroundColor = UIColor.brown
        case "cyan":
            cell.backgroundColor = UIColor.cyan
        case "green":
            cell.backgroundColor = UIColor.green
        case "magenta":
            cell.backgroundColor = UIColor.magenta
        case "orange":
            cell.backgroundColor = UIColor.orange
        case "purple":
            cell.backgroundColor = UIColor.purple
        case "red":
            cell.backgroundColor = UIColor.red
        case "yellow":
            cell.backgroundColor = UIColor.yellow
        case "salmon":
            cell.backgroundColor = UIColor(red: 253/255, green: 171/255, blue: 159/255, alpha: 1.0)
        case "lavender":
            cell.backgroundColor = UIColor(red: 191/255, green: 148/255, blue: 228/255, alpha: 1.0)
        default:
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
    

    @IBOutlet weak var colorsPalette: UICollectionView!
    
    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    var isShow = 1
    
    @IBOutlet weak var colorPalette: UIView!

    @IBAction func showColorPalete(_ sender: Any) {
        
        if isShow == 0 {
            colorPalette.isHidden = true
            isShow = 1
        }
        else {
            colorPalette.isHidden = false
            isShow = 0
        }
    }
    
    func removeColor() {
        if isShow == 0 {
            colorPalette.isHidden = true
            isShow = 1
        }
        else {
            colorPalette.isHidden = false
            isShow = 0
        }
    }
    
    @objc func removeSubview(){
        print("Start remove sibview")
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }else{
            print("No!")
        }
    }
    
    func audioPlay() {
        
        let path = Bundle.main.path(forResource: "p23", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            conversationSound = try AVAudioPlayer(contentsOf: url)
            conversationSound.delegate = self
            conversationSound.play()
        } catch {
            print(error)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPalette.isHidden = true
        audioPlay()
        self.colorsPalette.delegate = self
        self.colorsPalette.dataSource = self
    }
}
