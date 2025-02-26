//
//  AppCoordinatorFactory.swift
//  PetTrasnslator
//  
//  Created by Quasar on 26.02.2025.
//

final class AppContainer: ContainerProtocol {
    static let shared = AppContainer()
    
    private let translator = TranslatorManager.shared
    private let audioManager = AudioRecorderManager()
    
    func createTranslatorViewModel() -> TranslatorViewModel {
        return TranslatorViewModel(audioManager: audioManager, translator: translator)
    }
    
    func createResultViewModel(from translatorViewModel: TranslatorViewModel) -> ResultViewModel {
        let resultViewModel = ResultViewModel()
        resultViewModel.selectedPet = translatorViewModel.selectedPet
        resultViewModel.hasTranslation = true
        resultViewModel.translationText = translatorViewModel.translationText
        return resultViewModel
    }
}
