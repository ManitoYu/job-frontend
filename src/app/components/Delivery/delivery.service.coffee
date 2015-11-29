angular.module 'jobFrontend'
  .factory 'DeliveryService', (Restangular, $cookieStore) ->

    deliveries = Restangular.all 'deliveries'

    # 投递
    deliver: (data) ->
      deliveries.post data: data

    # 获取所有投递
    getAllDeliveries: () ->
      Restangular
        .one 'deliveries'
        .one 'account', $cookieStore.get 'accountId'
        .one 'jobs'
        .get()

    # 通过
    resolve: (id) ->
      Restangular
        .one 'deliveries'
        .post 'status',
          deliveryId: id
          status: 1

    # 拒绝
    reject: (id) ->
      Restangular
        .one 'deliveries'
        .post 'status',
          deliveryId: id
          status: 2
