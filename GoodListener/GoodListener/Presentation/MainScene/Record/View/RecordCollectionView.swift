//
//  RecordCollectionView.swift
//  GoodListener
//
//  Created by Jiyoung Park on 2022/08/29.
//

import UIKit

struct RecordDataList {
    static let dayTextList = ["1일차", "2일차", "3일차", "4일차", "5일차", "6일차", "7일차"]
    static let dayemojiList = ["emoji1", "emoji2", "emoji3", "emoji4", "emoji5", "emoji4", "emoji5"]
    static let dayScoreList = ["10.0", "8.2", "6.0", "5.2", "7.0", "6.2", "2.5"]
}

class RecordCollectionView: UIView {
    var dayData: [String] = []
    var emojiData: [String] = []
    var scoreData: [String] = []
    
    let contentStack = UIStackView().then{
        $0.axis = .vertical
        $0.backgroundColor = .clear
        $0.distribution = .fillEqually
        
    }

    lazy var dayView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(RecordContentCell.self, forCellWithReuseIdentifier: RecordContentCell.identifier)
        view.backgroundColor = .systemRed
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    lazy var emojiView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(RecordContentCell.self, forCellWithReuseIdentifier: RecordContentCell.identifier)
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    lazy var scoreView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(RecordContentCell.self, forCellWithReuseIdentifier: RecordContentCell.identifier)
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    private override init(frame: CGRect){
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    
    convenience init(frame: CGRect, dayData: [String], emojiData: [String], scoreData:[String]) {
        self.init(frame: frame)
        self.dayData = dayData
        self.emojiData = emojiData
        self.scoreData = scoreData
        
        addSubview(contentStack)
        
        contentStack.snp.makeConstraints{
            $0.left.right.top.bottom.equalToSuperview()
        }
        
        [dayView, emojiView, scoreView].forEach{
            contentStack.addArrangedSubview($0)
        }
    }
}

extension RecordCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == dayView) {
            return dayData.count
        } else if (collectionView == emojiView) {
            return emojiData.count
        } else {
            return scoreData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == dayView) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordContentCell.identifier, for: indexPath) as? RecordContentCell else {fatalError()}
            cell.changeUI(.day)
            cell.dayLbl.text = dayData[indexPath.row]
            return cell
        } else if (collectionView == emojiView) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordContentCell.identifier, for: indexPath) as? RecordContentCell else {fatalError()}
            cell.changeUI(.emoji)
            cell.emojiImg.image = UIImage(named:emojiData[indexPath.row])
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordContentCell.identifier, for: indexPath) as? RecordContentCell else {fatalError()}
            cell.changeUI(.score)
            cell.dayLbl.text = scoreData[indexPath.row]
            return cell
        }
    }
}

extension RecordCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Log.d("\(indexPath.section)and \(indexPath.row)")
    }
}

extension RecordCollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 8
        let width: CGFloat = (collectionView.bounds.width - margin*6)/7 - 5
        return CGSize(width: width, height: 14)
    }
}
