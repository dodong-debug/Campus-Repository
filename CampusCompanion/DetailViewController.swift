import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    var studentName: String = ""
    var notificationsEnabled: Bool = false
    var selectedRole: String = ""
    var eventDate: String = ""
    var guestCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Campus Events"
        
        let notificationStatus = notificationsEnabled ? "on" : "off"
        
        messageLabel.text = """
        Welcome, \(studentName)! (\(selectedRole))
        Notifications: \(notificationStatus)
        Event: \(eventDate)
        Guests: \(guestCount)
        """
    }
}
