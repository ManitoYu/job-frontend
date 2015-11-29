angular.module 'jobFrontend'
  .factory 'AccountService', (Restangular) ->

    signup: (data) ->
      Restangular
        .one 'account'
        .post 'signup',
         data: data

    signin: (data) ->
      Restangular
        .one 'account'
        .post 'signin',
         data: data