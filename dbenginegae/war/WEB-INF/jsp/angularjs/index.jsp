<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html ng-app>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <script src="http://code.angularjs.org/1.0.7/angular.min.js"></script>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/css/bootstrap.min.css"/>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0-rc1/js/bootstrap.min.js"></script>
    <script>
    function RestauranteController($scope) {
        $scope.pedidos = [];
        $scope.total = 0;
        $scope.cardapio = [
         {descricao:'Refrigerante',preco:3.5},
         {descricao:'Cerveja',preco:4.5},
         {descricao:'Agua',preco:2.5}
        ];
        
        $scope.pedir = function () {
          var pedido = angular.copy($scope.pedido);
	            $scope.pedidos.push(pedido);
	            $scope.calcularSubTotal();
        };
        
        $scope.calcularSubTotal = function() {
          $scope.total = 0;
          angular.forEach($scope.pedidos, function(pedido) {
            $scope.total += pedido.item.preco;    
          });
        };
        
    }

 	//acessando Spring MVC
    function _RestauranteController($scope, $http) {
          $scope.pedidos = [];
          $scope.cardapio = [];
          
          $scope.carregarCardapio = function() {
             $http.get('cardapio').success(function (cardapio) {
               $scope.cardapio = angular.fromJson(cardapio);
             });
           };
          
          $scope.pedir = function () {
            var pedido = {codigo: $scope.pedido.codigo, data: new Date()};
            $http.post('pedido/' + $scope.pedido.item.id, pedido).success(function () {
	            $scope.pedidos.push(angular.copy($scope.pedido));
	            $scope.calcularSubTotal();
              });
          };
          
          $scope.calcularSubTotal = function() {
            $scope.total = 0;
            angular.forEach($scope.pedidos, function(pedido) {
              $scope.total += pedido.item.preco;    
            });
          };
          
          $scope.carregarCardapio();
      }
    </script>
  </head>
  <body ng-controller="RestauranteController">
    <div class="well" style="width: 700px; margin-top: 60px;margin-left: auto; margin-right: auto;">
    <a href="<c:url value='/index/index'/>">Voltar</a>
    <input type="text" class="form-control" ng-model="criterio" placeholder="O que você está procurando?"/><br/>
    <table class="table table-striped" ng-show="(cardapio | filter:criterio).length != 0">
      <tr>
        <th>Descrição</th><th>Preço</th>
      </tr>
      <tr ng-repeat="item in cardapio | filter:criterio">
         <td>{{item.descricao | uppercase}}</td><td>{{item.preco | currency:'R$'}}</td>
      </tr>
    </table>
    <span ng-show="(cardapio | filter:criterio).length == 0">Infelizmente não temos o item que você está procurando!</span>
    <hr/>
    <form name="pedidoForm" class="form-inline" novalidate>
        <input type="number" class="form-control" style="width:130px;" name="codigo" ng-model="pedido.codigo" placeholder="Código da Mesa" ng-required="true" ng-minlength="2" ng-maxlength="2"/>
        <select class="form-control" style="width: 400px;" name="item" ng-model="pedido.item" ng-options="item as item.descricao for item in (cardapio | filter:criterio)" ng-required="true"><option value=""> Selecione um item do cardápio...</option></select>
        <button class="btn btn-default" ng-click="pedir()" ng-disabled="pedidoForm.codigo.$invalid || pedidoForm.item.$invalid">Fazer Pedido!</button>
    </form>
    <span ng-show="pedidoForm.codigo.$dirty && pedidoForm.codigo.$invalid">O campo Código da Mesa é obrigatório e deve ter 2 caracteres no mínimo</span>
    <br/>
    <table class="table table-bordered" ng-show="pedidos.length != 0">
      <tr>
        <th>Código</th><th>Descrição</th><th>Preço</th><th>Quando o pedido foi realizado?</th>
      </tr>
      <tr class="" ng-repeat="pedido in pedidos">
         <td>{{pedido.codigo}}</td><td>{{pedido.item.descricao | uppercase}}</td><td>{{pedido.item.preco | currency:'R$'}}</td><td>{{pedido.data | date:'dd/MM/yyyy hh:mm'}}</td>
      </tr>
      <tr class="warning">
        <td></td><td>SUB-TOTAL</td><td>{{total | currency:'R$'}}</td><td></td>
      </tr>
      <tr class="warning">
        <td></td><td>TAXA DE SERVIÇO</td><td>{{(total*0.10) | currency:'R$'}}</td><td></td>
      </tr>
      <tr class="warning">
        <td></td><td>TOTAL</td><td>{{(total*1.1) | currency:'R$'}}</td><td></td>
      </tr>
    </table>
    </div>
  </body>
</html>