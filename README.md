# README

### Bancos y Proveedores π  
<div align="center">
<img src="" align="center" style="width: 100%" />
</div>


  
### Pre requisitos  
Tener instalado el yarn para el uso del webpacker

https://classic.yarnpkg.com/en/docs/install/

Nota: Descarga el correspondiente a tu sistema operativo. Si ya lo tienes instalado, omite este paso.  



### Pasos para descargar el proyecto  
π± Dar clic en Fork y luego, dar clic en crear para enlazarlo a tu GitHub.

π± Clonar el proyecto para agregarlo a tu repositorio local.

π± Una vez estΓ© en tu repositorio local, desde tu editor de texto favorito, abrir la carpeta donde quedΓ³ el proyecto descargado.

π± Abrir una consola en la ruta del proyecto, y ejecutar:

$ bundle install

π± Ejecutar las migraciones:

$ rails db:migrate

π± Ejecutar los siguientes comandos para ejecutar los estilos del TailwindCss:

$ rails tailwindcss:install

 Nota: Si te pide sobreescribir el archivo bin/dev , escribe "a"

π± Si te sale el error Webpacker::Manifest::MissingEntryError, debes Intalar el webpacker

$rails webpacker:install

Nota: si te pide sobre escribir, escribe "a"

π± Levantar el servidor

$ rails server  
  



### Uso Proyecto  
Para navegar en el proyecto,  usa las siguientes rutas:

βοΈ Vistas Bancos http://localhost:3000/banks

βοΈ Vistas Proveedores http://localhost:3000/suppliers 

Nota: Para agregar proveedores  debes por lo menos agregar un banco.
  
  
