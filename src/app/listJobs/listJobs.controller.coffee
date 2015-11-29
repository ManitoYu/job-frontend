angular.module 'listJobs'
  .controller 'ListJobsController', (DeliveryService, ResumeService, $scope, JobService, $mdDialog, $cookieStore) ->

    $scope.jobs = []

    JobService
      .getAllJobs()
      .then (data) ->
        if data.status is 200
          $scope.jobs = data.data

    ListResumesDialogController = ($scope) ->
      ResumeService
        .getResumesByAccount $cookieStore.get 'accountId'
        .then (data) ->
          $scope.resumes = data.data
          $scope.resumeId = $scope.resumes[0]._id

      $scope.deliver =  () ->
        data =
          resumeId: $scope.resumeId
          jobId: $scope.$$prevSibling.jobId

        DeliveryService
          .deliver data
          .then (data) ->
            $mdDialog.show(
              $mdDialog
                .alert()
                .clickOutsideToClose true
                .title '系统提示'
                .content '投递成功'
                .ok '确定'
            )

    $scope.deliver = (id) ->
      $scope.jobId = id
      $mdDialog.show
        controller: ListResumesDialogController
        clickOutsideToClose: true
        templateUrl: 'app/listJobs/listResumesDialog.html'
      





