# Post Instalación Linux
Comandos a ejecutar después de la instalación de linux


## Comandos para la terminal

### Sistema

- Actualización sistema y repositorios

```bash
sudo apt update && sudo apt upgrade -y
```

- Instalación de utilidades básicas

```bash
sudo apt install wget gpg exfat-fuse hfsplus hfsutils ntfs-3g p7zip-full p7zip-rar rar unrar zip unzip libfuse2 unace
```

- Instalación programas
    - Gimp: Editor de Imágenes
    - Gparted: Administrador de particiones de disco duro
    - Synaptic: Administrador de paquetes del sistema
    - Exaile: Reproductor de audio

```bash
sudo apt install gimp gparted synaptic exaile
```

- Instalación programas de desarrollo
    - Virtualbox: Administrador de maquinas virtuales
    - Filezilla: Acceso FTP a los servidores
    - Composer: Gestor de dependencias para PHP

```bash
sudo apt install virtualbox filezilla composer
```

- Limpiar sistema

```bash
sudo apt autoclean
sudo apt autoremove
sudo apt clean
```

- Instalar riseup-vpn

```bash
sudo add-apt-repository ppa:leapcodes/riseup-vpn
sudo apt update
sudo apt install riseup-vpn
```

### Programación

- Agregar repositorios Oficiales de VScode

```bash
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
```

- Instalación VScode

```bash
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders
```

### Docker

- Instalación Docker

```bash
#Instalación
sudo apt install docker
sudo apt install docker-compose

#Configurar inicio automático
sudo systemctl status docker.service
sudo systemctl enable docker.service
sudo systemctl start docker.service
```

- Instalación portainer

```bash
### Instalación de portainer:
sudo docker volume create portainer_data
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

#URL de acceso
http://localhost:9443

#repositorios portainer (opciones varias)
https://raw.githubusercontent.com/Lissy93/portainer-templates/main/templates.json
https://raw.githubusercontent.com/technorabilia/portainer-templates/main/lsio/templates/templates-2.0.json
https://raw.githubusercontent.com/ntv-one/portainer/main/template.json
https://raw.githubusercontent.com/portainer/templates/master/templates-2.0.json
```

- Instalación Entorno para PHP-MYSQL-REDIS

```bash
# Clonar repositorio:
git clone https://github.com/tenshi98/docker_entorno_lamp.git

# Entrar a la carpeta:
cd docker_entorno_lamp/

# Añadir permisos de ejecución a un script:
chmod +x build.sh
chmod +x start.sh
chmod +x stop.sh

# Construir e iniciar el entorno
# Esta tarea toma su tiempo ya que descarga los contenedores
# Esta tarea se ejecuta solo la primera vez:
sudo ./build.sh

# Iniciar el entorno, en el caso de que no se inicie automáticamente:
sudo ./start.sh

# Detener el entorno:
sudo ./stop.sh
```

- N8N

N8N es una plataforma de automatización de flujos de trabajo que ofrece a los equipos técnicos la flexibilidad del código con la velocidad del no-code. Con más de 400 integraciones, capacidades de IA nativas y una licencia de código justo, n8n te permite crear automatizaciones potentes mientras mantienes el control total de tus datos e implementaciones.

URL: https://github.com/n8n-io/n8n

```bash
### Instalación:
sudo docker volume create n8n_data
sudo docker run -it --rm --name n8n -p 5678:5678 -v n8n_data:/home/node/.n8n docker.n8n.io/n8nio/n8n

#URL de acceso
http://localhost:5678

```

- FossFLOW

FossFLOW es una herramienta de código abierto y gratuita para crear diagramas isométricos atractivos de software o infraestructura.

URL: https://github.com/stan-smith/FossFLOW

```bash
### Instalación:
docker run -p 8096:80 -v $(pwd)/diagrams:/data/diagrams stnsmith/fossflow:latest

#URL de acceso
http://localhost:8096

```
