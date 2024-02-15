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
        
    let arpltnInforInqireSvcService = ArpltnInforInqireSvcService()
    lazy var a = ArpltnInforInqireSvcRepository(arpltnInforInqireSvcService: arpltnInforInqireSvcService)
    let testLbl = UILabel()
    
    var viewDidLoadSubject = PublishSubject<Bool>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Log.debug("viewDidLoad")
        initUI()
        
        viewDidLoadSubject.onNext(true)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Log.debug("viewDidAppear")

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
        
        viewDidLoadSubject.asObserver()
            .map { _ in
                Log.debug("viewDidLoadSubject map 내부")
                
                return Reactor.Action.loadKecoData
            }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
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
