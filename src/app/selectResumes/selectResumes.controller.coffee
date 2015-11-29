angular.module 'selectResumes'
  .controller 'SelectResumesController', (DeliveryService, $scope, Restangular, $mdDialog) ->

    DeliveryService
      .getAllDeliveries()
      .then (data) ->
        $scope.deliveries = data.data

    $scope.resolve = (id) ->
      DeliveryService.resolve id
      this.delivery.status = 1

    $scope.reject = (id) ->
      DeliveryService.reject id
      this.delivery.status = 2

    ResumeDialogController = ($scope, ResumeService) ->
      ResumeService
        .getResumesById $scope.$$prevSibling.viewResumeId
        .then (data) ->
          $scope.resume = data.data
 
    $scope.viewResume = () ->
      $scope.viewResumeId = this.delivery.resumeId._id

      $mdDialog.show
        controller: ResumeDialogController
        templateUrl: 'app/selectResumes/resumeDialog.html'
        clickOutsideToClose: true
      