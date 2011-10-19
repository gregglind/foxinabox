class builddeps {
      package {
          [ "libasound2-dev", "libcurl4-openssl-dev", "libnotify-dev", "libxt-dev", "libiw-dev", "mesa-common-dev", "autoconf2.13", "yasm" ]:
              ensure => installed;
      }

      exec { "install-builddeps":
          command => "/usr/bin/sudo /usr/bin/apt-get -y build-dep firefox",
          logoutput => "on_failure";
      }

      Package <| |> -> Exec['install-builddeps']
}