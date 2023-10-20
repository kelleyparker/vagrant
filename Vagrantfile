Vagrant.configure("2") do |config|
  
  # Define host1 machine
  config.vm.define "host1" do |host1|
    host1.vm.box = "generic/fedora37"
    host1.vm.hostname = "host1"
    host1.disksize.size = "60GB"
    host1.vm.boot_timeout = 300
    host1.vm.provider "virtualbox" do |vmware|
      vmware.memory = 4096
      vmware.cpus = 2
    end
  end

  # Define sql machine
  config.vm.define "sql" do |sql|
    sql.vm.box = "generic/fedora37"
    sql.vm.hostname = "sql"
    sql.disksize.size = "60GB"
    sql.vm.boot_timeout = 300
    sql.vm.provider "virtualbox" do |vmware|
      vmware.memory = 4096
      vmware.cpus = 2
    end
  end

  # Define fedora1 machine
  config.vm.define "fedora1" do |fedora1|
    fedora1.vm.box = "generic/fedora37"
    fedora1.vm.hostname = "fedora1"
    fedora1.disksize.size = "60GB"
    fedora1.vm.boot_timeout = 300
    fedora1.vm.provider "virtualbox" do |vmware|
      vmware.memory = 4096
      vmware.cpus = 2
    end
  end

  # Define web machine
  config.vm.define "web" do |web|
    web.vm.box = "generic/fedora37"
    web.vm.hostname = "web"
    web.disksize.size = "60GB"
    web.vm.boot_timeout = 300
    web.vm.provider "virtualbox" do |vmware|
      vmware.memory = 4096
      vmware.cpus = 2
    end
    # Add shell provisioner
    web.vm.provision "shell", inline: <<-SHELL
      sudo dnf update -y
      sudo dnf install httpd -y
    SHELL
  end

  # Define prod machine
  config.vm.define "prod" do |prod|
    prod.vm.box = "generic/fedora37"
    prod.vm.hostname = "prod"
    prod.disksize.size = "60GB"
    prod.vm.boot_timeout = 300
    prod.vm.provider "virtualbox" do |vmware|
      vmware.memory = 4096
      vmware.cpus = 2
    end
    # Add shell provisioner
     prod.vm.provision "shell", inline: <<-SHELL
      sudo dnf update -y
      sudo dnf install httpd -y
    SHELL
   end

  # Define qa1 machine
  config.vm.define "qa1" do |qa1|
    qa1.vm.box = "generic/fedora37"
    qa1.vm.hostname = "qa1"
    qa1.disksize.size = "60GB"
    qa1.vm.boot_timeout = 300
    qa1.vm.provider "virtualbox" do |vmware|
      vmware.memory = 4096
      vmware.cpus = 2
    end
  end

  # Define qa2 machine
  config.vm.define "qa2" do |qa2|
    qa2.vm.box = "generic/fedora37"
    qa2.vm.hostname = "qa2"
    qa2.disksize.size = "60GB"
    qa2.vm.boot_timeout = 300
    qa2.vm.provider "virtualbox" do |vmware|
      vmware.memory = 4096
      vmware.cpus = 2
    end
  end
end
