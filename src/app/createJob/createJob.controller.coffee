angular.module 'createJob'
  .factory 'createJobService', ($q, Restangular) ->

    jobs = Restangular.all 'jobs'

    (data) ->
      jobs.post data: data

  .controller 'CreateJobController', ($scope, createJobService, $mdDialog, $cookieStore) ->
    
    $scope.job = {}

    $scope.save = () ->

      data = $scope.job
      data.accountId = $cookieStore.get 'accountId'

      createJobService data
        .then (data) ->
          if data.status is 200
            $mdDialog.show(
              $mdDialog
                .alert()
                .title '系统提示'
                .content '职位创建成功'
                .ok '确定'
            )
