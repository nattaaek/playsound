
import UIKit
import AVFoundation

class Chapter1_20: UIViewController, AVAudioPlayerDelegate {

    var pictureColor: String = ""
    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var btnNext: UIButton!
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_21")
        self.present(vc!, animated: true, completion: nil)
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
    
    func audioPlayerDidFinishPlaying( _ player: AVAudioPlayer, successfully flag: Bool) {
        btnNext.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true
        
        audioPlay()
        
    }

}
