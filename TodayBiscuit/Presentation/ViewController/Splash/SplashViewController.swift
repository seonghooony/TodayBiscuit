//
//  SplashViewController.swift
//  TodayBiscuit
//
//  Created by SeongHoon Kim on 12/2/23.
//

import Foundation
import UIKit
import SnapKit

import RxCocoa
import ReactorKit
import RxSwift
import RxGesture

import Alamofire

//
class SplashViewController: UIViewController, ReactorKit.View {
    
    var disposeBag: DisposeBag = DisposeBag()

    typealias Reactor = SplashViewReactor

    weak var superNavigationController: UINavigationController?
        
    let arpltnInforInqireSvcService = ArpltnInforInqireSvcService()
    lazy var a = ArpltnInforInqireSvcRepository(arpltnInforInqireSvcService: arpltnInforInqireSvcService)
    let testLbl = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Log.debug("viewDidLoad")
        initUI()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Log.debug("viewDidAppear")

        
//        let sid = "cq%2BgNZLAImeNH9%2BgwPtxxS95Oo2zm94HtYKX%2F3it8H%2F4zlpSvQRmxtKPtFII8RVkPzVz4KKcCdVPKHkYxMQcvw%3D%3D"
        let sid = "cq+gNZLAImeNH9+gwPtxxS95Oo2zm94HtYKX/3it8H/4zlpSvQRmxtKPtFII8RVkPzVz4KKcCdVPKHkYxMQcvw=="
        
//        a.getMinuDustFrcstDspth(sid: sid)
//            .subscribe(onNext: { result in
//                print("@@@@")
//                print(result)
//            })
//            .disposed(by: disposeBag)
        a.getMinuDustFrcstDspth(sid: sid)
            .subscribe(onNext: { result in
                print("@@@@")
//                print(result)
//                print(result.response?.body?.items?.count)
            })
            .disposed(by: disposeBag)
        
        //
//        a.response?.body?.items?[0].
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        Log.debug("viewDidDisappear")
//        self.superNavigationController?.setNavigationBarHidden(false, animated: false)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Log.debug("viewWillAppear")
//        initNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Log.debug("viewWillDisappear")
    }
    
    init(reactor: Reactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        Log.debug("deinit")
        disposeBag = DisposeBag()
    }
    
    func initUI() {
        
        viewConfigure()
        
        constraintConfigure()
        
        
       
        

    }
    
    /*
        상단 네비게이션 바 초기화
     */
    private func initNavigationBar() {
        
        
        DispatchQueue.main.async {
            let navigationBarAppearanceDefault = UINavigationBarAppearance()
            navigationBarAppearanceDefault.configureWithTransparentBackground()
            navigationBarAppearanceDefault.backgroundColor = .white
            self.navigationController?.navigationBar.standardAppearance = navigationBarAppearanceDefault
            self.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearanceDefault


            self.navigationController?.navigationBar.topItem?.title = "테스트중2"
           

            self.navigationController?.navigationBar.shadowImage = nil
        }


    }

    
    private func viewConfigure() {
        
        view.backgroundColor = .brown

        testLbl.text = "테스트"
        testLbl.textColor = .white
        view.addSubview(testLbl)
       
    }
    
    private func constraintConfigure() {
        testLbl.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }


    }

    
    func bind(reactor: SplashViewReactor) {
        bindAction(reactor)
        bindState(reactor)

    }


    func bindAction(_ reactor: SplashViewReactor) {
        
    }
    
    func bindState(_ reactor: SplashViewReactor) {
        //state
    }
    
//    func moveVC(flowType: StoryFlow, data: Any? = nil) {
//        
//        switch flowType {
//            
//        default:
//            break
//        }
//    }
    
    
}
