<html>
    <head>
         <style type="text/css">

body {

background-color: #85FFBD;
background-image: linear-gradient(45deg, #85FFBD 0%, #FFFB7D 100%);


}

</style>
       
    <body>
        <center>
        <?php
            $suma=0;
            foreach($_POST as $key=>$value)
            { 
                
                $suma=$suma+$value;
            }
        echo "Suma zdobytych punktów=$suma"
        ?></center>
    </body>
        </head>
</html>