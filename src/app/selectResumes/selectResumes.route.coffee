angular.module 'selectResumes'
  .config ($stateProvider) ->
    $stateProvider
      .state 'selectResumes',
        url: '/selectResumes'
        templateUrl: 'app/selectResumes/selectResumes.html'
        controller: 'SelectResumesController'