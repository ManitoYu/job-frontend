angular.module 'jobFrontend'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'home',
        url: '/home'
        templateUrl: 'app/main/main.html'
        controller: 'MainController'
        controllerAs: 'main'

    $urlRouterProvider
      .when '/', 'signin'
      .otherwise '/'
