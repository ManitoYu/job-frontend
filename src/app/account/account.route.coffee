angular.module 'account'
  .config ($stateProvider) ->

    $stateProvider
      .state 'signup',
        url: '/signup'
        templateUrl: 'app/account/signup.html'
        controller: 'AccountController'

      .state 'signin',
        url: '/signin'
        templateUrl: 'app/account/signin.html'
        controller: 'AccountController'