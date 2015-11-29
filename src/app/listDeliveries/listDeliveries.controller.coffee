angular.module 'listDeliveries'
  .controller 'ListDeliveriesController', ($scope, Restangular, $cookieStore) ->

    Restangular
      .one 'deliveries'
      .one 'account', $cookieStore.get 'accountId'
      .get()
      .then (data) ->
        $scope.deliveries = data.data