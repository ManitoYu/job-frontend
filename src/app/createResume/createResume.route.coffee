angular.module 'createResume'
  .config ($stateProvider) ->
    $stateProvider
      .state 'createResume',
        url: '/createResume'
        templateUrl: 'app/createResume/createResume.html'
        controller: 'CreateResumeController'