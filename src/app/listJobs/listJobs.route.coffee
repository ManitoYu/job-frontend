angular.module 'listJobs'
  .config ($stateProvider) ->
    $stateProvider
      .state 'listJobs',
        url: '/listJobs'
        templateUrl: 'app/listJobs/listJobs.html'
        controller: 'ListJobsController'