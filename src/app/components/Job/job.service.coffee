angular.module 'jobFrontend'
  .factory 'JobService', (Restangular) ->

    getAllJobs: () ->
      Restangular
        .one 'jobs'
        .get()