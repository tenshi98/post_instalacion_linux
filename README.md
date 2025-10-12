# Post Instalación Linux
Comandos a ejecutar después de la instalación de linux


### Comandos para la terminal

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

- Administración Remota

```bash
sudo apt install cockpit
sudo systemctl status cockpit

sudo apt install openssh-server
sudo systemctl status ssh
sudo systemctl enable ssh
sudo systemctl start ssh
```
