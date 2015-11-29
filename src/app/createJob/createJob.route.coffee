angular.module 'createJob'
  .config ($stateProvider) ->
    $stateProvider
      .state 'createJob',
        url: '/createJob'
        templateUrl: 'app/createJob/createJob.html'
        controller: 'CreateJobController'