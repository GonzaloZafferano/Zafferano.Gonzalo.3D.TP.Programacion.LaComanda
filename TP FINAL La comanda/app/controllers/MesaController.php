<?php
require_once './models/Mesa.php';
require_once './interfaces/IApiUsable.php';

class MesaController extends Mesa implements IApiUsable
{
    public function CargarUno($request, $response, $args)
    {
        $parametros = $request->getParsedBody();

        $estado = $parametros['estado'];
        $fotoUrl = $parametros['fotoUrl'];

        // Creamos el Producto
        $mesa = new Mesa();
        $mesa->estado = $estado;      
        $mesa->fotoUrl = $fotoUrl;      
        
        $mesa->crearMesa();

        $payload = json_encode(array("mensaje" => "Mesa creada con exito"));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }

    public function TraerUno($request, $response, $args)
    {
        // Buscamos producto por nombre
        $mesaId = $args['id'];
        $mesa = Mesa::obtenerMesaPorId($mesaId);

        if($mesa){
          $payload = json_encode($mesa);
  
          $response->getBody()->write($payload);
          return $response
            ->withHeader('Content-Type', 'application/json');           
        }else{
          $payload = json_encode(array("mensaje" => "No se encontro la mesa de id: " . $mesaId));
    
          $response->getBody()->write($payload);
          return $response
            ->withHeader('Content-Type', 'application/json');

        }
    }

    public function TraerTodos($request, $response, $args)
    {
        $lista = Mesa::obtenerTodos();
        $payload = json_encode(array("listaMesas" => $lista));

        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
    }
    
    public function ModificarUno($request, $response, $args)
    {
      //OBTENGO LOS PARAMETROS DEL BODY DE LA PETICION PUT.
      $parametros = $request->getParsedBody();

      //OBTENGO EL NOMBRE DEL USUARIO QUE VIENE EN LA URL.
      $mesaId = $args["id"];
      
      //OBTENGO EL USUARIO A PARTIR DEL NOMBRE.
      $mesa = Mesa::obtenerMesaPorId($mesaId);

      if($mesa){
        $mesa->estado = $parametros['estado'];
        $mesa->fotoUrl = $parametros['fotoUrl'];

        if(Mesa::modificarMesa($mesa)){
  
          $payload = json_encode(array("mensaje" => "Mesa modificada con exito"));
    
          $response->getBody()->write($payload);
          return $response
            ->withHeader('Content-Type', 'application/json');

        }else{
          $payload = json_encode(array("mensaje" => "No se ha podido modificar la mesa. Revise que los datos enviados sean correctos."));  
          $response->getBody()->write($payload);
          return $response
            ->withHeader('Content-Type', 'application/json');
        }

      }else{
        $payload = json_encode(array("mensaje" => "No se ha encontrado la mesa de id: " . $mesaId));  
        $response->getBody()->write($payload);
        return $response
          ->withHeader('Content-Type', 'application/json');
      }
    }

    public function BorrarUno($request, $response, $args)
    {
        $mesaId =  $args["id"];

        if(Mesa::borrarMesa($mesaId)){

          //CONVIERTE UN OBJETO A JSON STRING.
          $payload = json_encode(array("mensaje" => "Mesa borrada con exito"));
  
          $response->getBody()->write($payload);
          return $response
            ->withHeader('Content-Type', 'application/json');
        }else{
          //CONVIERTE UN OBJETO A JSON STRING.
          $payload = json_encode(array("mensaje" => "No se ha encontrado la mesa para borrar."));
  
          $response->getBody()->write($payload);
          return $response
            ->withHeader('Content-Type', 'application/json');
        }
    }  
}
