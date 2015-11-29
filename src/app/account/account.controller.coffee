angular.module 'account'
  .controller 'AccountController', ($state, $rootScope, $scope, AccountService, $mdDialog, $cookieStore) ->

    $scope.account = {}
    $rootScope.login = false

    $scope.signup = () ->
      if $scope.account.repassword isnt $scope.account.password
        return $mdDialog.show(
          $mdDialog
            .alert()
            .title '系统提示'
            .content '两次密码不一致'
            .ok '确定'
        )

      AccountService
        .signup $scope.account
        .then (data) ->
          return if data.status isnt 200
        
          $mdDialog.show(
            $mdDialog
              .alert()
              .title '系统提示'
              .content data.msg
              .ok '确定'
          )

          if data.code is 0
            $cookieStore.put 'accountId', data.data.accountId
            $cookieStore.put 'email', data.data.email
            $cookieStore.put 'role', data.data.role
            $rootScope.login = true
            $rootScope.role = data.data.role

          if $rootScope.role is 1
            $state.go 'listJobs'
          else
            $state.go 'selectResumes'

    $scope.signin = () ->

      AccountService.signin $scope.account
      .then (data) ->
        return if data.status isnt 200
        
        $mdDialog.show(
          $mdDialog
            .alert()
            .title '系统提示'
            .content data.msg
            .ok '确定'
        )

        if data.code is 0
          $cookieStore.put 'accountId', data.data.accountId
          $cookieStore.put 'email', data.data.email
          $cookieStore.put 'role', data.data.role
          $rootScope.login = true
          $rootScope.role = data.data.role

        if $rootScope.role is 1
          $state.go 'listJobs'
        else
          $state.go 'selectResumes'