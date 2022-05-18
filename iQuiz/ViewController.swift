//
//  ViewController.swift
//  iQuiz
//
//  Created by 袁月 on 2022/5/9.
//

import UIKit
import Foundation
import SystemConfiguration

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate, PopViewControllerProtacol {
    
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    let iconName = ["science", "avenger", "math"]
    var data: [Quiz] = []
    let initurl = "https://tednewardsandbox.site44.com/questions.json"
    var inputurl: String = ""
    var decodedjsonData: [Quiz] = []
                    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        showAlert()
        parse(jsonData: readLocalJson("storage")!)
        if !isInternetAvailable() { // no internet
            data = decodedjsonData
        } else {
            fetchData(initurl)
        }
    }
    
    private func parse(jsonData: Data) {
        decodedjsonData = try! JSONDecoder().decode([Quiz].self, from: jsonData)
    }
    
    func isInternetAvailable() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }

        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }

    func showAlert() {
        if !isInternetAvailable() {
            let alert = UIAlertController(title: "Warning", message: "The Internet is not available", preferredStyle: .alert)
            let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    private func readLocalJson(_ name: String) -> Data? {
       do {
           if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
              let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
               return jsonData
           }
       } catch {
           print(error)
       }
       return nil
   }

    // num of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // num of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func checkNowButtonTouchUpInside(_ theurl: String) {
        inputurl = theurl
    }
    
    func checkNowButtonTouchUpInside(_ sender: Any) {
        fetchData(inputurl)
    }
    
    func fetchData(_ theurl: String) {
        let url = URL (string: theurl)
        
        URLSession.shared.dataTask(with: url!) {
            data, response, error in
            guard let data = data else { return }
            
            if response != nil {
                if (response! as! HTTPURLResponse).statusCode != 200 {
                    print("Something went wrong! \(error!)")
                }
            }

            if let quizdata = try? JSONDecoder().decode([Quiz].self, from: data) {
                DispatchQueue.main.async {
                    self.data = quizdata
                    self.tableView.reloadData()
                }
            }
        }.resume()
    }

    // create cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quiz = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        cell?.listTitleLabel.text = quiz.title
        cell?.listDescriptionLabel.text = quiz.desc
        cell?.icon.image = UIImage(named: iconName[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let quizvc = storyboard?.instantiateViewController(withIdentifier: "quiz") as? QuizViewController {
            quizvc.quizdata = self.data[indexPath.row]
            self.navigationController?.pushViewController(quizvc, animated: true)
        }
    }
    
    @IBAction func SettingButtonTouchUpInside(_ sender: Any) {
        if let popvc = storyboard?.instantiateViewController(withIdentifier: "pop") as? PopViewController {

            popvc.modalPresentationStyle = .popover
            popvc.delegate = self
            let popOverVC = popvc.popoverPresentationController
            popOverVC?.delegate = self
            popOverVC?.sourceView = self.settingButton
            popOverVC?.sourceRect = CGRect(x: self.settingButton.bounds.midX, y: self.settingButton.bounds.minY, width: 0, height: 0)
            popvc.preferredContentSize = CGSize(width: 250, height: 250)

            self.present(popvc, animated: true)
        }
    }
    
}
