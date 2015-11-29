angular.module 'jobFrontend'
  .directive 'myNavbar', () ->

    MyNavbarController = ($state, $scope, $cookieStore, $rootScope) ->

      $scope.signout = () ->
        $cookieStore.remove 'accountId'
        $cookieStore.remove 'email'
        $cookieStore.remove 'role'
        $rootScope.login = false
        $rootScope.role = 0
        $state.go 'signin'

    directive =
      restrict: 'E'
      templateUrl: 'app/components/myNavbar/myNavbar.html'
      controller: MyNavbarController