<!DOCTYPE html>
<html ng-app="app">
<head>
    <meta charset="utf-8" />
    <base href="/" />
    <title>Geek Text</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="GeekText/lib/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />
    <link href="GeekText/css/styles.css" rel="stylesheet" />
</head>
<body>

    <!--These elements will be filled in by angular-->
    <app-navbar></app-navbar>
    <ui-view></ui-view>
    <app-footer></app-footer>
    
    <!--Script Frameworks-->
    <script src="GeekText/lib/jquery/dist/jquery.min.js"></script>
    <script src="GeekText/lib/bootstrap/dist/js/bootstrap.js"></script>
    <script src="GeekText/js/angular-bundled.js"></script>

    <!--Our angular scripts -->
    <!-- All component scripts need to be declared before app.module.js (thats the entry point for angular)-->
    <script src="GeekText/app/api/api.service.js"></script>
    <script src="GeekText/app/footer/footer.component.js"></script>
    <script src="GeekText/app/home/home.component.js"></script>
    <script src="GeekText/app/navbar/navbar.component.js"></script>
    <script src="GeekText/app/about/about.component.js"></script>
    <script src="GeekText/app/books/books.component.js"></script>
    <script src="GeekText/app/books/books-detail.component.js"></script>
    <script src="GeekText/app/cart/cart.component.js"></script>
    <script src="GeekText/app/app.module.js"></script>
</body>
</html>