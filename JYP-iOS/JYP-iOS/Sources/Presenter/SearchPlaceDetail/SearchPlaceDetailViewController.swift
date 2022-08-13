//
//  SearchPlaceDetailViewController.swift
//  JYP-iOS
//
//  Created by 송영모 on 2022/07/26.
//  Copyright © 2022 JYP-iOS. All rights reserved.
//

import Foundation
#if arch(x86_64)
    import GoogleMaps
#endif

class SearchPlaceDetailViewController: BaseViewController {
    let document: KakaoSearchPlace
    
    let navigationContentView = SearchPlaceDetailNavigationContentView()
    let contentView = SearchPlaceDetailView()
    
    required init?(coder: NSCoder) {
        fatalError("not supported")
    }
    
    init(document: KakaoSearchPlace) {
        self.document = document
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func setupProperty() {
        super.setupProperty()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        updateContentView(document: document)
    }
    
    override func setupHierarchy() {
        super.setupHierarchy()
        
        view.addSubviews([navigationContentView, contentView])
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        navigationContentView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.top.equalTo(navigationContentView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func setupBind() {
        super.setupBind()
    }
    
    private func updateContentView(document: KakaoSearchPlace) {
        contentView.addPlaceBox.titleLabel.text = document.placeName
        contentView.addPlaceBox.subLabel.text = document.roadAddressName
        contentView.addPlaceBox.categoryLabel.text = document.categoryGroupName
        #if arch(x86_64)
            contentView.updateMapView(mapView: GMSMapView(frame: view.bounds, camera: .camera(withLatitude: Double(document.y) ?? 0.0, longitude: Double(document.x) ?? 0.0, zoom: 18)))
        #endif
    }
}
