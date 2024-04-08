- Архитектура MVVM-C
- менеджер зависимостей SPM
- Используем DI для внедрения тестирования!!

# ДЗ 1
 - Хайррутдинов Камил
   - Базовая архитектура: Router, AppCoordinator, AuthFlowCoordinator, BaseCoordinator + протоколы для управления флоу
   - Добавить snapkit
   - часть CoordinatorFactory и ModuleFactory

 - Уваров Тимур
   - Поток регистрации: SignUpFlowController, SignUpController, SignUpViewModel,
   - Добавил и использовал firebase
   - TextFieldFactory
   - ServiceFactory для DI
   - часть CoordinatorFactory и ModuleFactory
   - написал протоколы для factory + обновил протоколы для управления флоу
  
 - Абрамов Кирилл
   - SignInFlowCoordinator, SignInViewController, SignInViewModel,
   - Добавил Alamofire
   - ButtonFactory
   - Дженерик класс Helpers/Observable
   - Дополнил CoordinatorFactory, ModuleFactory, AuthFlowCoordinator

 - Бородач Женя
   - TabBarFlow: все файлы в этой папке, много писать
   - Generics: LabelFactoryProtocol, LabelFactory (я не знала че добавить, сделала дженерик color)
   - Builder pattern: URLBuilder
   - Добавила библиотеку SDWebImage: RecomendationsViewController, ProfileViewController (марка "Configure ui items")
  

# ДЗ 2
- Хайрутдинов Камил
  - Моковый координатор + unit тесты к нему
  - ui тесты AuthViewContrller
  - snapshot тест AuthViewContrller & SignInViewController
  
- Абрамов Кирилл
  - Юнит тесты ValidationService
  - UI тесты SignInViewController
  - Combine для биндинга SignInViewModel и SignInViewController
  - Snapshot тесты SignUpController & RecomendationsViewController
   
- Бородач Женя
  - ImageNetworkServise для подгрузки картинок
  - Мок сервисы для тестов: ImageNetworkServiseMock & AuthServiceMock
  - Юнит тесты RecomendationsViewModel & ProfileViewModel
  - UI тесты RecomendationsView & ProfileView
  - Snapshot тесты LibraryViewController & ProfileViewController
