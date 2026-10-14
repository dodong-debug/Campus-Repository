import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var guestCountLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var guestStepper: UIStepper!
    @IBOutlet weak var roleSegmentedControl: UISegmentedControl!
    @IBOutlet weak var notifySwitch: UISwitch!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Campus Companion"
    }

    @IBAction func getStartedTapped(_ sender: UIButton) {
        subtitleLabel.text = "Let's Get Started!"
    }
    
    @IBAction func exploreButtonTapped(_ sender: UIButton) {
        nameTextField.resignFirstResponder()
        performSegue(withIdentifier: "ShowDetailSegue", sender: self)
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        guestCountLabel.text = "\(Int(sender.value))"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue",
           let detailVC = segue.destination as? DetailViewController {
            
            let enteredName = nameTextField.text ?? ""
            detailVC.studentName = enteredName.isEmpty ? "Student" : enteredName
            detailVC.notificationsEnabled = notifySwitch.isOn
            
            let selectedRoleIndex = roleSegmentedControl.selectedSegmentIndex
            detailVC.selectedRole = roleSegmentedControl.titleForSegment(at: selectedRoleIndex) ?? "Student"
            
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            detailVC.eventDate = formatter.string(from: datePicker.date)
            
            detailVC.guestCount = Int(guestStepper.value)
        }
    }
}
