RESUMEN COMPLETO: GIT, GITHUB Y CONFIGURACIÓN SSH EN WINDOWS
Gerardo, aquí tienes un resumen de lo que hemos aprendido y practicado en tu proyecto Hello Git, desde los comandos básicos hasta la conexión SSH con GitHub.
1. ¿Qué es Git y GitHub?
Git: es un sistema de control de versiones que permite registrar los cambios de un proyecto, recuperar versiones anteriores y trabajar con ramas.

GitHub: es una plataforma que permite alojar repositorios Git en internet, compartir proyectos y trabajar en equipo.
Git	GitHub
Programa de control de versiones.	Plataforma para alojar repositorios.
Funciona localmente.	Funciona mediante internet.
Registra cambios.	Permite compartir cambios.
Administra ramas.	Permite colaborar con otros.

2. Configuración inicial de Git
Primero configuramos nuestra identidad para que Git reconozca quién realiza los commits.

Configurar nombre:
git config --global user.name "Gerardo"


Configurar correo:
git config --global user.email "Milkyramos60@gmail.com"


Consultar configuración:
git config --global --list


Abrir el archivo de configuración:
notepad $HOME\.gitconfig


El nombre y correo aparecen registrados en los commits.
3. Crear y administrar un repositorio
Comando	Función
git init	Inicializa un repositorio Git.
git status	Muestra el estado de los archivos.
git add .	Prepara todos los cambios para el commit.
git commit -m "mensaje"	Registra los cambios.
git log	Muestra el historial.
git diff	Muestra las diferencias entre archivos.
git reset	Mueve HEAD y puede modificar el área de preparación.
git reset --hard	Restablece el estado y descarta cambios locales.
git reflog	Muestra los movimientos anteriores de HEAD.
git tag	Administra etiquetas de versiones.
git diff --staged	Muestra los cambios preparados para commit.

¿Qué es un commit?
Es una captura del estado del proyecto que Git registra en su historial.

Ejemplo:
git add .
git commit -m "Mi primer commit"


Recuerda que si creas un archivo vacío y lo registras, puede aparecer:
0 insertions(+), 0 deletions(-)


Esto significa que se creó el archivo, pero no tenía líneas de contenido.
4. Ramas (Branches)
Una rama es una línea independiente de desarrollo que permite trabajar en nuevas funcionalidades sin modificar directamente otra rama.

Por ejemplo:
Ejemplo de ramas
master
Rama principal

Commit inicial

Actualización




login
Rama alternativa

Desarrollo del login

Login v2




Comandos de ramas
Comando	Función
git branch	Muestra las ramas.
git branch login	Crea una rama llamada login.
git switch login	Cambia a login.
git switch -c desarrollo	Crea y cambia a una nueva rama.
git branch -d login	Elimina una rama fusionada.
git branch -D login	Fuerza la eliminación.
git branch -m nuevo	Cambia el nombre de una rama.

¿Qué significa HEAD?
HEAD es una referencia que indica dónde estás trabajando actualmente.

Ejemplo:
* login
  master


El asterisco indica que estás en login.
¿Qué es Detached HEAD?
Sucede cuando te desplazas directamente a un commit, en lugar de estar ubicado en una rama.

Ejemplo:
git checkout 00c868c


Para recuperar una rama eliminada, si conoces el commit al que apuntaba:
git branch login 00c868c


Esto recupera la referencia de la rama en ese commit.
5. Fusionar ramas (Merge)
git merge permite integrar los cambios de una rama en otra.

Ejemplo: quieres integrar master dentro de login.

Primero:
git switch login


Después:
git merge master


Esto integra los cambios de master en login.
Tipos de merge
Fast-forward: Git avanza la rama porque no necesita combinar historiales divergentes.

Merge commit: Git crea un nuevo commit que une dos líneas de desarrollo.

Ejemplo de tu práctica:
commit 8ce569e (HEAD -> login)
Merge: 0b0399b 5d29f3e
Merge branch 'master' into login


Esto significa que login recibió los cambios de master.
6. Resolución de conflictos
Un conflicto ocurre cuando Git no puede combinar automáticamente modificaciones incompatibles.

Ejemplo:

En master:
print("Hola mundo")



En login:
print("Hola Gerardo")



Al intentar fusionar ambas ramas, Git puede mostrar:
<<<<<<< HEAD
print("Hola Gerardo")
=======
print("Hola mundo")
>>>>>>> master


¿Cómo resolverlo?
1. Abre el archivo en Visual Studio Code.
2. Decide qué versión conservar o combina ambas.
3. Elimina los marcadores del conflicto.
4. Guarda el archivo.
Después ejecuta:
git add .


Y finaliza la fusión:
git merge --continue


Comprueba:
git status


También puedes cancelar una fusión pendiente:
git merge --abort


7. Git Stash
git stash permite guardar temporalmente modificaciones que todavía no has registrado en un commit.

Es útil cuando necesitas cambiar de rama sin perder tu trabajo.
Comando	Función
git stash	Guarda temporalmente los cambios.
git stash list	Muestra los cambios guardados.
git stash pop	Recupera los cambios y elimina esa entrada del stash.
git stash apply	Recupera los cambios sin eliminar la entrada.
git stash drop	Elimina una entrada.
git stash clear	Elimina todas las entradas.

Ejemplo:
git stash
git switch master
git switch login
git stash pop


8. Repositorio local y remoto
Repositorio local: está almacenado en tu computadora.

Repositorio remoto: está alojado en un servidor, como GitHub.
Local	Remoto
Tu computadora.	Servidor externo.
git commit	git push
Trabajo local.	Trabajo compartido.
Puede funcionar sin internet.	Necesita conexión para sincronizar.

Comandos principales
Comando	Función
git remote -v	Muestra los repositorios remotos.
git remote add origin URL	Conecta un repositorio remoto.
git clone URL	Descarga un repositorio.
git push	Sube cambios.
git pull	Descarga e integra cambios.
git fetch	Descarga información sin integrar cambios.

9. Configuración SSH en Windows
Esta fue la última parte que trabajamos y ya la completaste correctamente.

SSH (Secure Shell) permite autenticarte con GitHub mediante un par de claves: una pública y otra privada.
A. Generar las claves
Utilizaste:
ssh-keygen -t ed25519 -C "Milkyramos60@gmail.com"


Elegiste el nombre id_rsa, aunque el algoritmo generado fue Ed25519.

Tus archivos quedaron en:
C:\Users\Seki\.ssh\


Tus dos claves
id_rsa

Clave privada. Nunca compartir.

Privada


id_rsa.pub

Clave pública. Se registra en GitHub.

Pública


B. Activar SSH Agent
Abriste PowerShell como administrador y ejecutaste:
Get-Service -Name ssh-agent | Set-Service -StartupType Manual


Después:
Start-Service ssh-agent


C. Agregar la clave privada al agente
En PowerShell normal:
ssh-add "$HOME\.ssh\id_rsa"


Obtuviste:
Identity added: C:\Users\Seki\.ssh\id_rsa


D. Comprobar la clave
Ejecutaste:
ssh-add -l


Y obtuviste:
256 SHA256:bAtDorcmWNnkRJot3QfTqfP7Eg74V8YQKTJnCp0Yf8U
Milkyramos60@gmail.com (ED25519)


Esto confirmó que SSH Agent reconocía tu clave.
E. Agregar la clave pública a GitHub
Copiaste la clave pública mediante:
Get-Content "$HOME\.ssh\id_rsa.pub" | Set-Clipboard


Después la registraste en GitHub, en Settings → SSH and GPG keys.
F. Comprobar la conexión
Ejecutaste:
ssh -T git@github.com


Y recibiste:
Hi milkyramos60-arch! You've successfully authenticated,
but GitHub does not provide shell access.


SSH configurado correctamente
Esto confirma que GitHub reconoció tu clave y autenticó tu computadora.

10. Chuleta de comandos para estudiar
Estos son los comandos que te recomiendo memorizar:
Comando	¿Para qué sirve?
git init	Inicializar repositorio.
git status	Ver estado.
git add .	Preparar cambios.
git commit -m ""	Guardar cambios.
git log	Ver historial.
git diff	Comparar cambios.
git branch	Ver ramas.
git switch	Cambiar de rama.
git merge	Fusionar ramas.
git stash	Guardar temporalmente.
git reset	Retroceder referencias.
git reflog	Consultar movimientos de HEAD.
git tag	Crear etiquetas.
git remote -v	Ver repositorios remotos.
git push	Subir cambios.
git pull	Descargar e integrar cambios.
git fetch	Descargar información remota.
ssh-add -l	Ver claves cargadas.
ssh -T git@github.com	Comprobar autenticación SSH.
