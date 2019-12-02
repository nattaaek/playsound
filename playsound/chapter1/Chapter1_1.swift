import UIKit
import AVFoundation

class Chapter1_1: UIViewController, AVAudioPlayerDelegate {

    //Declare variable section
    var conversationSound : AVAudioPlayer? = AVAudioPlayer()
    var musicPlayer: AVAudioPlayer?  = AVAudioPlayer()
    @IBOutlet weak var btnNext: UIButton!
    
    // Main function
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        btnNext.isHidden = true
        audioPlay()
        musicPlay()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }

    override var shouldAutorotate: Bool {
        return true
    }
    // action section
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_2") as! Chapter1_2
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        musicPlayer?.stop()
        conversationSound?.stop()
    }
    
    func audioPlay() {
    let path = Bundle.main.path(forResource: "p1.mp3", ofType: nil)!
    let url = URL(fileURLWithPath: path)
        do {
            conversationSound = try AVAudioPlayer(contentsOf: url)
            conversationSound?.delegate = self
            conversationSound?.play()
        } catch {
            print(error)
        }
    }
    func musicPlay() {
        let path = Bundle.main.path(forResource: "conversation.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: url)
            musicPlayer?.delegate = self
            musicPlayer?.play()
        }  catch {
            print(error)
        }
    }
    func audioPlayerDidFinishPlaying( _ :AVAudioPlayer , successfully flag: Bool) {
        btnNext.isHidden = false
    }
}
