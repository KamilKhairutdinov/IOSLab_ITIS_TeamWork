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
  - snapshot тест AuthViewContrller(только один тк иначе не хватит на всех экранов, решили кто что делал на то и пишет тесты)
  - snapshot тесты не работают из-за конфликта с firebase (почините пожалуйста...)
- Абрамов Кирилл
  - Юнит тесты ValidationService
  - UI тесты SignInViewController
  - Combine для биндинга SignInViewModel и SignInViewController




