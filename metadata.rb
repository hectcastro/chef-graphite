maintainer        "Hector Castro"
maintainer_email  "hectcastro@gmail.com"
license           "Apache 2.0"
description       "Installs and configures Graphite."
version           "0.0.1"
recipe            "graphite", "Installs and configures Graphite and all of its components"
recipe            "graphite::carbon", "Installs and configures Carbon"
recipe            "graphite::dashboard", "Installs and configures the Graphite dashboard"
recipe            "graphite::whisper", "Installs and configures Whisper"

depends "python"
depends "apache2"

%w{ ubuntu }.each do |os|
    supports os
end
