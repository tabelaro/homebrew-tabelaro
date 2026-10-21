cask "tabelaro" do
  version :latest
  sha256 :no_check

  url "https://tabelaro.com/download/Tabelaro-latest.dmg"
  name "Tabelaro"
  desc "Free database client for PostgreSQL, MySQL/MariaDB and SQLite"
  homepage "https://tabelaro.com"

  depends_on macos: ">= :big_sur"

  app "Tabelaro.app"

  # Tabelaro is not signed or notarized, so clear the quarantine flag after install.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Tabelaro.app"]
  end
end
