angular.module 'jobFrontend'
  .factory 'ResumeService', (Restangular) ->

    getResumesByAccount: (accountId) ->
      Restangular
        .one 'resumes'
        .one 'accountId', accountId
        .get()

    getResumesById: (resumeId) ->
      Restangular
        .one 'resumes', resumeId
        .get()
