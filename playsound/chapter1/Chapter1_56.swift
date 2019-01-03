import UIKit
import AVFoundation

class Chapter1_56: UIViewController, AVAudioPlayerDelegate {

    let song = ["StrongBeat","SubBeat","SubBeat","SubBeat","StrongBeat","SubBeat","SubBeat","SubBeat","C","D","E","SubBeat","E","D","C","SubBeat","C","D","E","SubBeat","E","D","C","SubBeat"]
    var conversationPlayer = AVAudioPlayer()
    var songPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playConversationSound()
    }
    
    func playConversationSound()  {
        let path = Bundle.main.path(forResource: "p4highnote.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            conversationPlayer = try AVAudioPlayer(contentsOf: url)
            conversationPlayer.delegate = self
            conversationPlayer.play()
        } catch {
            print(error)
        }
    }
    
    func audioPlayerDidFinishPlaying( _ player: AVAudioPlayer, successfully flag: Bool) {
        songPlay()
    }
    
    func songPlay(){
            for index in 0..<song.count {
                Timer.scheduledTimer(withTimeInterval: Double(index) * (60.0 / 60.0), repeats: false) { (timer) in
                    self.playSelectedSong(selectedSong: self.song[index])
                }
            }
    }
    
    func playSelectedSong(selectedSong: String) {
        let songURL = Bundle.main.url(forResource: selectedSong, withExtension: "wav")
        do{
            songPlayer = try AVAudioPlayer(contentsOf: songURL!)
        } catch let error {
            print(error.localizedDescription)
        }
        songPlayer.prepareToPlay()
        songPlayer.play()
    }
    
    
    @IBOutlet weak var buttonNext: UIButton!
    @IBAction func nextPageController(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "chapter1_57")
        self.present(vc!, animated: true, completion: nil)
    }
    
}
