//
//  HomeViewController.swift
//  GoodListener
//
//  Created by cheonsong on 2022/07/26.
//

import UIKit
import RxSwift

class HomeVC: UIViewController {
    
    weak var coordinator: HomeCoordinating?
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "Home"
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        let button = GLButton()
        button.title = "전화"
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(Const.glBtnHeight)
            $0.width.equalTo(Const.glBtnWidth)
        }
        
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        button.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.coordinator?.call()
            })
            .disposed(by: disposeBag)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}