//
//  HomeViewController.swift
//  GoodListener
//
//  Created by cheonsong on 2022/07/26.
//

import UIKit
import RxSwift

// 신청 전, 매칭 후 2가지 상태
// TODO: 연장 버튼 눌렀을 때 추가 - 기획 답변
enum homeState {
    case join
    case matched
}

class HomeVC: UIViewController, SnapKitType {

    weak var coordinator: HomeCoordinating?
    let disposeBag = DisposeBag()

    let navigationView = NavigationView(frame: .zero, type: .notice)
    let scrollView = UIScrollView().then {
        $0.backgroundColor = .m6
    }
    
    // 현재 홈 화면 상태
    var homeState: homeState = .join
    
    let contentStackView = UIStackView().then {
        $0.axis = .vertical
        $0.backgroundColor = .clear
    }
    
    let titleLbl = UILabel().then {
        $0.text = "나의 리스너"
        $0.font = FontManager.shared.notoSansKR(.bold, 20)
    }
    
    let containerView = UIView().then {
        $0.backgroundColor = .m5
        $0.layer.cornerRadius = 20
    }
    
    //신청 전 화면 UI 요소
    let joinImg = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "main_img_notalk")
    }
    
    let joinLbl = UILabel().then {
        $0.text = "아직 진행 중인 대화가 없어요.\n지금 바로 대화를 신청해 보세요"
        $0.font = FontManager.shared.notoSansKR(.regular, 16)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.textColor = .f4
    }

    let joinBtn = GLButton().then {
        $0.title = "신청하기"
    }
    
    //매칭 후 UI 요소
    let daycheckLbl = UILabel().then{
        let dayformat = "7일 중 %d일차"
        $0.text = String(format: dayformat, 3) //api data
        $0.font = FontManager.shared.notoSansKR(.bold, 20)
        $0.textColor = .f2
        $0.textAlignment = .center
    }
    
    let profileImg = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "person")
        $0.contentMode = .scaleAspectFill
    }
    
    let nickNameLbl = UILabel().then {
        $0.text = "행복해지고싶은지은이"
        $0.font = FontManager.shared.notoSansKR(.bold, 18)
        $0.textColor = .f2
        $0.textAlignment = .center
    }
    
    let introLbl = UILabel().then {
        $0.textAlignment = .left
        $0.numberOfLines = 3
        $0.text = "안녕하세요? 스피커님과 즐거운 대화를 해나가고 싶어요 일주일동안 잘 부탁드려요 안녕하세요? 스피커님과 즐거운 안녕하세요? 스피커님과 즐거운 대화를 해나가고 싶어요 일주일동안 잘 부탁드려요 안녕하세요? 스피커님과 즐거운"
        $0.font = FontManager.shared.notoSansKR(.regular, 16)
        $0.textColor = .f4
        $0.lineBreakMode = .byTruncatingTail
    }
        
    let scheduleLbl = UILabel().then {
        $0.text = "대화시간"
        $0.font = FontManager.shared.notoSansKR(.bold, 16)
        $0.textColor = .f2
    }
    
    let timeLbl = UILabel().then {
        $0.text = "매일 오후 10:20"
        $0.font = FontManager.shared.notoSansKR(.regular, 16)
        $0.textColor = .f7
    }
    
    let dateLbl = UILabel().then {
        $0.text = "2022.8.2 ~ 8.8 (7일간)" //나중에 API 호출 시 format 만들기
        $0.font = FontManager.shared.notoSansKR(.regular, 16)
        $0.textColor = .f7
    }
    
    let delayBtn = GLButton().then {
        $0.title = "오늘 대화 미루기"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .m6
        addComponents()
        setConstraints()
        bind()
        changeUI(homeState)
        addCallBtn()    // 전화 테스트용
    }
    
    func addComponents() {
        [navigationView, scrollView, joinBtn, delayBtn].forEach{
            view.addSubview($0)
        }
        scrollView.addSubview(contentStackView)
        [titleLbl, containerView].forEach {
            contentStackView.addArrangedSubview($0)
        }
        [joinImg, joinLbl, daycheckLbl, profileImg, nickNameLbl, introLbl, scheduleLbl, timeLbl, dateLbl].forEach {
            containerView.addSubview($0)
        }
        navigationView.backgroundColor = .m6
    }
    
    func setConstraints() {
        navigationView.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(35)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
        contentStackView.snp.makeConstraints {
            $0.edges.equalTo(scrollView).inset(UIEdgeInsets(top: 35, left: Const.padding, bottom: 100, right: Const.padding))
            $0.width.equalTo(scrollView.snp.width).offset(-Const.padding*2)
        }
        
        contentStackView.setCustomSpacing(20, after: titleLbl)
        
        containerView.snp.makeConstraints {
            $0.height.equalTo(488)
        }
        
        // 신청 전 UI
        joinImg.snp.makeConstraints{
            $0.top.equalToSuperview().offset(139)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(100)
        }
        joinLbl.snp.makeConstraints{
            $0.top.equalTo(joinImg.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        joinBtn.snp.makeConstraints {
            $0.width.equalTo(Const.glBtnWidth)
            $0.height.equalTo(Const.glBtnHeight)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        self.view.bringSubviewToFront(joinBtn)
        
        
        // 매칭 후 UI
        daycheckLbl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.left.equalToSuperview().offset(70)
            $0.right.equalToSuperview().offset(-70)
        }
        
        profileImg.snp.makeConstraints {
            $0.top.equalTo(daycheckLbl.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: 138, height: 138))
            //$0.layer.cornerRadius = self.frame.size.width/2 //일반 사진일 경우
        }
        
        nickNameLbl.snp.makeConstraints {
            $0.top.equalTo(profileImg.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().offset(-30)
        }
        
        
        introLbl.snp.makeConstraints{
            $0.top.equalTo(nickNameLbl.snp.bottom).offset(28)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().offset(-30)
        }
        
        scheduleLbl.snp.makeConstraints{
            $0.top.equalTo(introLbl.snp.bottom).offset(22)
            $0.left.equalToSuperview().offset(30)
        }
        
        timeLbl.snp.makeConstraints{
            $0.top.equalTo(scheduleLbl.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(30)
        }
        dateLbl.snp.makeConstraints{
            $0.top.equalTo(timeLbl.snp.bottom)
            $0.left.equalToSuperview().offset(30)
        }
        
        delayBtn.snp.makeConstraints {
            $0.width.equalTo(Const.glBtnWidth)
            $0.height.equalTo(Const.glBtnHeight)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        self.view.bringSubviewToFront(delayBtn)
        
    }
    
    func bind() {
        joinBtn.rx.tap
            .bind(onNext: { [weak self] in
                self?.coordinator?.join()
            })
            .disposed(by: disposeBag)
        
        delayBtn.rx.tap
            .bind(onNext: { [weak self] in
                self?.coordinator?.call()
            })
            .disposed(by: disposeBag)
    }
    
    func changeUI(_ type: homeState) {
        switch type {
        case .join:
            joinImg.isHidden = false
            joinLbl.isHidden = false
            joinBtn.isHidden = false
            daycheckLbl.isHidden = true
            profileImg.isHidden = true
            nickNameLbl.isHidden = true
            introLbl.isHidden = true
            scheduleLbl.isHidden = true
            timeLbl.isHidden = true
            dateLbl.isHidden = true
            delayBtn.isHidden = true
            break
        case .matched:
            joinImg.isHidden = true
            joinLbl.isHidden = true
            joinBtn.isHidden = true
            daycheckLbl.isHidden = false
            profileImg.isHidden = false
            nickNameLbl.isHidden = false
            introLbl.isHidden = false
            scheduleLbl.isHidden = false
            timeLbl.isHidden = false
            dateLbl.isHidden = false
            delayBtn.isHidden = false
            break
        }
    }
    
    func addCallBtn() {
        let button = GLButton()
        button.title = "통화"
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.size.equalTo(50)
            $0.right.equalToSuperview().inset(10)
            $0.top.equalTo(navigationView.snp.bottom).offset(20)
        }
        
        button.rx.tap
            .bind(onNext: { [weak self] in
                self?.coordinator?.call()
            })
            .disposed(by: disposeBag)
    }
    
}
