angular.module 'createResume'
  .factory 'createResumeService', ($q, Restangular) ->

    resumes = Restangular.all 'resumes'

    (data) ->
      resumes.post data: data

  .controller 'CreateResumeController', ($scope, createResumeService, $mdDialog, $cookieStore) ->

    $scope.resume = {}

    $scope.provinces = ['湖北', '湖南', '广东', '四川', '江西']

    cities =
        '湖北': ['武汉', '荆州', '宜昌']
        '湖南': ['长沙', '常德']
        '广东': ['深圳', '广州', '东莞']
        '四川': ['成都']
        '江西': ['南昌']

    $scope.$watch 'resume', () ->
      $scope.cities = cities[$scope.resume.province]
    , true

    $scope.save = () ->

      data = $scope.resume
      data.accountId = $cookieStore.get 'accountId'

      createResumeService($scope.resume)
        .then (data) ->
          if data.status is 200
            $mdDialog.show(
              $mdDialog
                .alert()
                .clickOutsideToClose true
                .title '系统提示'
                .content '简历创建成功'
                .ok '确定'
            )
            