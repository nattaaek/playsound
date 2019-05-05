import UIKit
import AVFoundation

class Chapter1_18: UIViewController, AVAudioPlayerDelegate {

    var conversationSound: AVAudioPlayer = AVAudioPlayer()
    var songPlayer: AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func nextPage(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_19")
        self.present(vc!, animated: true, completion: nil)
    }
    
    func nextPageAuto(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_19")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBOutlet weak var btnNext: UIButton!
    
    func audioPlay() {
        
        let path = Bundle.main.path(forResource: "conversation", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            conversationSound = try AVAudioPlayer(contentsOf: url)
            conversationSound.delegate = self
            conversationSound.play()
        } catch {
            print(error)
        }
    }
    
    func songPlay(){
        let path = Bundle.main.path(forResource: "p18", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            songPlayer = try AVAudioPlayer(contentsOf: url)
            songPlayer.delegate = self
            songPlayer.play()
        } catch {
            print(error)
        }
    }
    
    var countSong = 0
    func audioPlayerDidFinishPlaying( _ player: AVAudioPlayer, successfully flag: Bool) {
        print(countSong)
        audioPlay()
        if(countSong == 2){
            nextPageAuto()
        }
        countSong += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNext.isHidden = true
        
        songPlay()
        
    }
}
