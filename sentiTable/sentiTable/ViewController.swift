//
//  ViewController.swift
//  sentiTable
//
//  Created by KooGunMo on 2020/10/14.
//  Copyright © 2020 KooGunMo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    
    
    // 1. http 통신 방법
    // 2. JSON 데이터 형태
    
    func getNews() {
        
       let task =  URLSession.shared.dataTask(with: URL(string:"http://newsapi.org/v2/top-headlines?country=kr&apiKey=a16a6764935841649fd806b6702f474a")!) { (data, response, error) in
        
            if let dataJson = data {
                
                // JSON 으로 Parsing 해야함
                do{
                    let json = try JSONSerialization.jsonObject(with: dataJson, options: []) as! Dictionary<String, Any>
//                    print(json)
                    // Dictionary
                    let articles = json["articles"]
                    print(articles)
                }
                catch{}
                
                
            }
        }
        
        
        // task 감지 후 실행
        task.resume();
    }
    
    // 데이터 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 몇개? 숫자
        return 30
    }
    
    // 데이터 무엇
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 무엇? 반복 10번?
        // 2가지 !
        // 1번 방법 - 임의의 셀 만들기

//        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
        
        // 2번 방법 - 스토리보드 + ID
        // 2번 방법이 실전
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        
        cell.LabelText.text = "\(indexPath.row+1)"
        
        // as? as! - 부모 자식 친자 확인
        
        
//        cell.textLabel?.text = "\(indexPath.row+1)"
        
        
        return cell
        

        
    }
    
    // 클릭 이벤트
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 클릭 하게 해주는거
        print("Clicked!\(indexPath.row)")
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // self = Class 안에 Function 을 의미함
        // 알아서 찾아감
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
        getNews()
    }

    
    // tableview 테이블로 된 뷰 - 여러 개의 행이 모여있는 목록 뷰(화면)
    // 정갈하게 보여주기 위해 사용(?) - 예 : 전화번호부
    
    // 1. 데이터 무엇 : 전화번호 목록
    // 2. 데이터 개수 : 100, 1000
    // 3. 데이터 이벤트 (옵션) : 클릭
    
    
}


