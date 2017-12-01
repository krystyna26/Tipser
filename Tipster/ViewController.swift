import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    // sliders
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var sizeLabel: UISlider!
    
    @IBAction func tipActionSlider(_ sender: UISlider) {
        doMath(tip: Int(sender.value*100), total: Double(priceStr)!, numOfPeople: Int(sizeLabel.value))
    }
    
    @IBOutlet weak var groupNumberLabel: UILabel!
    @IBAction func groupActionSlider(_ sender: UISlider) {
        groupNumberLabel.text = "Group Size: " + String(Int(sender.value))
        doMath(tip: Int(tipSlider.value*100), total: Double(priceStr)!, numOfPeople: Int(sizeLabel.value))
    }
    @IBOutlet weak var percentLeftLabel: UILabel!
    @IBOutlet weak var percentMiddleLabel: UILabel!
    @IBOutlet weak var percentRightLabel: UILabel!
    
    @IBOutlet weak var tipLeft: UILabel!
    @IBOutlet weak var tipMiddleLabel: UILabel!
    @IBOutlet weak var tipRightLabel: UILabel!
    
    @IBOutlet weak var totalLeftLabel: UILabel!
    @IBOutlet weak var totalMiddleLabel: UILabel!
    @IBOutlet weak var totalRightLabel: UILabel!

    var priceStr = "0"
    
    @IBAction func numberButtonClicked(_ sender: UIButton) {
        var char = ""
        print(sender.tag)
        if sender.tag == 11{
            char = "."
            sender.isEnabled = false
        } else if sender.tag == 1 {
            char = "1"
        } else if sender.tag == 2 {
            char = "2"
        } else if sender.tag == 3 {
            char = "3"
        } else if sender.tag == 4 {
            char = "4"
        } else if sender.tag == 5 {
            char = "5"
        } else if sender.tag == 6 {
            char = "6"
        } else if sender.tag == 7 {
            char = "7"
        } else if sender.tag == 8 {
            char = "8"
        } else if sender.tag == 9 {
            char = "9"
        } else if sender.tag == 0 {
            char = "0"
        }
         // reset everithing
         else if sender.tag == 10 {
            priceStr = "0"
            print(priceStr)
            char = "0"
        }

        if priceStr == "0" {
            priceStr = char
        } else {
            priceStr += char
        }
        priceLabel.text = priceStr

        doMath(tip: Int(tipSlider.value*100), total: Double(priceStr)!, numOfPeople: Int(sizeLabel.value))
    }
    
    @IBOutlet weak var numOfPeopleSlider: UISlider!
    
    func doMath(tip: Int, total: Double, numOfPeople: Int){
        let tipL = tip
        let tipRight = tip+20
        let tipMiddle = tip+10
        
//        var num = 5.942909763
//        var newNum = round(num*100)/100
       
        //row 1
            percentLeftLabel.text = String(tipL)+"%"
            percentMiddleLabel.text = String(tipMiddle)+"%"
            percentRightLabel.text = String(tipRight)+"%"
        //row 2
            let tip1 = ((total*Double(tipL))/100)/Double(numOfPeople)
            let tip2 = ((total*Double(tipMiddle))/100)/Double(numOfPeople)
            let tip3 = ((total*Double(tipRight))/100)/Double(numOfPeople)
        
            tipLeft.text = String(tip1)
            tipMiddleLabel.text = String(tip2)
            tipRightLabel.text = String(tip3)
        //row 3
            totalLeftLabel.text = String((total+tip1)/Double(numOfPeople))
            totalMiddleLabel.text = String((total+tip2)/Double(numOfPeople))
            totalRightLabel.text = String((total+tip3)/Double(numOfPeople))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let total = Double(priceStr)
        priceLabel.text = String(Int(total!))
        
        tipSlider.setValue(0.15, animated: true)
        sizeLabel.setValue(0.1, animated: true)
        groupNumberLabel.text = "Group Size: " + String(Int(sizeLabel.value))
        
        doMath(tip:Int(tipSlider.value*100), total: Double(priceStr)!, numOfPeople: Int(sizeLabel.value))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

