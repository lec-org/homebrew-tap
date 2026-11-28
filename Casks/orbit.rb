cask "orbit" do
  arch arm: "arm64", intel: "x64"

  version "0.2.5"
  sha256 arm:   "7b9de9b5fe8ed60e556f7b26d37042c3bc2a70b92a1fd9ec52d5bdf087a08632",
         intel: "fb7c88b049266b36329d464192d1d0ad53d485298c11240cfcbc2470af3ea912"

  url "https://github.com/lec-org/lec-orbit/releases/download/v#{version}/Orbit-#{version}-mac-#{arch}.dmg"
  name "Orbit"
  desc "LEC 软件工作室统一桌面工作台与 LecSSO 原生桌面认证器"
  homepage "https://lec-org.github.io/lec-orbit/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Orbit.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Orbit.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Orbit",
    "~/Library/Preferences/top.lecspace.orbit.plist",
    "~/Library/Saved Application State/top.lecspace.orbit.savedState",
  ]
end
