angular.module 'jobFrontend'
  .run ($log, Restangular, $cookieStore, $rootScope, $state) ->
    'ngInject'
    # $log.debug 'runBlock end'
    Restangular.setBaseUrl '/api'

    $rootScope.login = if $cookieStore.get 'accountId' then true else false

    $rootScope.role = $cookieStore.get 'role'

    $rootScope.$on '$stateChangeStart', (ev, toState) ->
      if not $rootScope.login and -1 is ['signin', 'signup'].indexOf toState.name
        ev.preventDefault()
        $state.go 'signin'
