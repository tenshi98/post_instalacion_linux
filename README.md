# Post Instalación Linux
Comandos a ejecutar después de la instalación de linux

---
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

- Instalar aplicaciones desde flatpak
    - ClamUI: Antivirus para Linux
    - Czkawka: Buscador de archivos, permite encontrar duplicados
    - Discord: Discord
    - Gearlever: Instalador de AppImages
    - Mapas: Visualizador de Mapas del Mundo
    - Onlyoffice: Suite ofimatica similar a Microsoft Office
    - Portal for Teams: Aplicacio compatible con Microsoft Teams
    - Parabolic: Permite descargar video y audio desde youtube y otros
    - Telegram: Telegram
    - Warehouse: Permite gestionar las aplicaciones Flatpak

```bash
sudo flatpak install flathub czkawka Discord gearlever telegram
```

---
## Configuraciones

- Aplicaciones Web
    - Arena AI: [https://arena.ai](https://arena.ai)
    - Chatgpt: [https://chatgpt.com/](https://chatgpt.com/)
    - Claude: [https://claude.ai/new](https://claude.ai/new)
    - Copilot: [https://copilot.microsoft.com](https://copilot.microsoft.com)
    - Deepseek: [https://chat.deepseek.com/](https://chat.deepseek.com/)
    - Diagrams: [https://app.diagrams.net/](https://app.diagrams.net/)
    - Gemini: [https://gemini.google.com/](https://gemini.google.com/)
    - Genspark: [https://www.genspark.ai/](https://www.genspark.ai/)
    - Google Stitch: [https://stitch.withgoogle.com/](https://stitch.withgoogle.com/)
    - Minimax: [https://agent.minimax.io/](https://agent.minimax.io/)
    - Notebook LM: [https://notebooklm.google.com/](https://notebooklm.google.com/)
    - Perplexity: [https://www.perplexity.ai/](https://www.perplexity.ai/)
    - Raphael AI: [https://raphael.app/es](https://raphael.app/es)
    - Red Panda AI - Image to Image: [https://redpandaai.com/image/editor](https://redpandaai.com/image/editor)
    - Red Panda AI - Text to Image: [https://redpandaai.com/image/generator](https://redpandaai.com/image/generator)
    - VibecodeAPP: [https://www.vibecodeapp.com/](https://www.vibecodeapp.com/)
    - whatsapp: [https://web.whatsapp.com/](https://web.whatsapp.com/)
    - Youtube: [https://www.youtube.com/](https://www.youtube.com/)

- Aplicaciones Menu
    - Clima: weather@mockturtl
    - Combined Monitor: por d-atoshi
    - Lanzador de Aplicaciones: por mchilli
    - Menu Clasico: por fredcw


---
## Repositorios nuevos

### VScode

```bash
# ----------------- Oficial -----------------
# 1. Importar la clave GPG oficial
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

# 2. Instalar la clave en el sistema
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

# 3. Agregar el repositorio oficial
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

# 4. Eliminacion de la clave GPG oficial
rm -f packages.microsoft.gpg

# ----------------- Utilizado -----------------
# 1. Importar la clave GPG oficial
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

# 2. Instalar la clave en el sistema
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/

# 3. Agregar el repositorio oficial
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

# ----------------- Instalación VScode -----------------
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders
```

### Antigravity

```bash
# ----------------- Agregar Repositorio -----------------
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/antigravity-repo-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main" | \
  sudo tee /etc/apt/sources.list.d/antigravity.list > /dev/null

# ----------------- Instalación Antigravity -----------------
sudo apt update
sudo apt install antigravity
```

### VSCodium

```bash
# ----------------- Agregar Repositorio -----------------
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo -e 'Types: deb\nURIs: https://download.vscodium.com/debs\nSuites: vscodium\nComponents: main\nArchitectures: amd64 arm64\nSigned-by: /usr/share/keyrings/vscodium-archive-keyring.gpg' \
| sudo tee /etc/apt/sources.list.d/vscodium.sources

# ----------------- Instalación VSCodium -----------------
sudo apt update
sudo apt install codium
```

---
## Entornos de Trabajo

### Docker

- Instalación Docker V1

```bash
#Instalación
sudo apt install docker.io docker-compose

#Configurar inicio automático
sudo systemctl status docker.service
sudo systemctl enable docker.service
sudo systemctl start docker.service
```

- Instalación Docker V2


```bash
# Ubuntu
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-buildx-plugin docker-compose-plugin
```

- Instalación portainer

```bash
### Instalación de portainer:
sudo docker volume create portainer_data
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

#URL de acceso
https://localhost:9443

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

---
## Otros Programas para Docker

### N8N

N8N es una plataforma de automatización de flujos de trabajo que ofrece a los equipos técnicos la flexibilidad del código con la velocidad del no-code. Con más de 400 integraciones, capacidades de IA nativas y una licencia de código justo, n8n te permite crear automatizaciones potentes mientras mantienes el control total de tus datos e implementaciones.

URL: https://github.com/n8n-io/n8n

```bash
### Instalación:
sudo docker volume create n8n_data
sudo docker run -d -p 5678:5678 --name n8n --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v n8n_data:/home/node/.n8n docker.n8n.io/n8nio/n8n

#URL de acceso
https://localhost:5678

```

### FossFLOW

FossFLOW es una herramienta de código abierto y gratuita para crear diagramas isométricos atractivos de software o infraestructura.

URL: https://github.com/stan-smith/FossFLOW

```bash
### Instalación:
sudo docker run -d -p 8096:80 --name fossflow --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/diagrams:/data/diagrams stnsmith/fossflow:latest

#URL de acceso
https://localhost:8096

```

### tldraw

tldraw es una herramienta de pizarra digital colaborativa y de código abierto para crear bocetos y diagramas rápidamente.

URL: https://www.tldraw.com/

```bash
### Instalación:
sudo docker run -d -p 8097:3000 --name tldraw --restart=always -v /var/run/docker.sock:/var/run/docker.sock heizicao/tldraw:4.0.2

#URL de acceso
https://localhost:8097

```

### Excalidraw

Excalidraw es una herramienta gratuita y de código abierto que permite crear diagramas, bocetos e ilustraciones digitales con un estilo de dibujo a mano alzada.
Funciona como una pizarra virtual en línea, ideal para la lluvia de ideas, la creación de prototipos y la visualización de datos, con opciones de colaboración en tiempo real.

URL: https://excalidraw.com/

```bash
### Instalación:
sudo docker run -d -p 5000:80 --name excalidraw --restart=always -v /var/run/docker.sock:/var/run/docker.sock excalidraw/excalidraw:latest

#URL de acceso
https://localhost:5000

```

### Open-Webui

Open WebUI es una interfaz web de código abierto, autoalojada y muy similar a ChatGPT, diseñada para interactuar con grandes modelos de lenguaje (LLM) de forma privada y local.

URL: https://github.com/open-webui/open-webui

```bash
# If Ollama is on your computer, use this command:
sudo docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main

# If Ollama is on a Different Server, use this command:
## To connect to Ollama on another server, change the OLLAMA_BASE_URL to the server's URL:
sudo docker run -d -p 3000:8080 -e OLLAMA_BASE_URL=https://example.com -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main

# To run Open WebUI with Nvidia GPU support, use this command:
sudo docker run -d -p 3000:8080 --gpus all --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:cuda


#URL de acceso
https://localhost:3000

```

### Omniroute

OmniRoute es una puerta de enlace (gateway) de inteligencia artificial de código abierto que agrupa cientos de proveedores y modelos en un único punto de acceso local.

URL: https://hub.docker.com/r/diegosouzapw/omniroute

```bash
# Intall:
sudo docker run -d -p 20128:20128 --name omniroute --restart=always --add-host=host.docker.internal:host-gateway -v /mnt/Desarrollos/Docker/omniroute:/data diegosouzapw/omniroute:latest

#URL de acceso
https://localhost:20128

```
