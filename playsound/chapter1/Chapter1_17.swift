
import UIKit
import AVFoundation

class Chapter1_17: UIViewController, AVAudioPlayerDelegate {
    
    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var btnNext: UIButton!
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_18")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBOutlet weak var retryButton: UIButton!
    
    @IBAction func retrySonng(_ sender: Any) {
        audioPlay()
    }
    
    func audioPlay() {
        retryButton.isHidden = true
        let path = Bundle.main.path(forResource: "p17", ofType: "mp3")!
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
        retryButton.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true
        retryButton.isHidden = true
        
        audioPlay()
        
    }
}
