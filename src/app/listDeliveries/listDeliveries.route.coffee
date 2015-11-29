angular.module 'listDeliveries'
  .config ($stateProvider) ->
    $stateProvider
      .state 'checkDeliveries',
        url: '/checkDeliveries'
        templateUrl: 'app/listDeliveries/listDeliveries.html'
        controller: 'ListDeliveriesController'