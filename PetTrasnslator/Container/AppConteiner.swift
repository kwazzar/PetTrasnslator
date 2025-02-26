//
//  AppCoordinatorFactory.swift
//  PetTrasnslator
//  
//  Created by Quasar on 26.02.2025.
//

final class AppContainer: ContainerProtocol {
    static let shared = AppContainer()

     func createTranslatorViewModel() -> TranslatorViewModel {
        let translator = TranslatorManager.shared
        let audioManager = AudioRecorderManager()
        return TranslatorViewModel(audioManager: audioManager, translator: translator)
    }
    
     func createResultViewModel(from translatorViewModel: TranslatorViewModel) -> ResultViewModel {
        let resultViewModel = ResultViewModel()
        resultViewModel.selectedPet = translatorViewModel.selectedPet
        resultViewModel.hasTranslation = true
        resultViewModel.translationText = translatorViewModel.translationText
        return resultViewModel
    }

    func createSettingsViewModel() -> SettingsViewModel {
        let mailService = MailService()
        let urlHandler = URLHandler()
        let appRatingService = AppRatingService()
        let purchaseRestorer = PurchaseRestorer()
        return SettingsViewModel(mailService: mailService,
                                 urlHandler: urlHandler,
                                 appRatingService: appRatingService,
                                 purchaseRestorer: purchaseRestorer)
    }
}
