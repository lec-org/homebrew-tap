cask "orbit" do
  arch arm: "arm64", intel: "x64"

  version "0.1.4"
  sha256 arm:   "9459ca44fafab1c8a055d86d03ace260bffcba2d6210936e88268efe90e16988",
         intel: "a24392d604e13902ecb15fe6cebf3d6ae8587a423a761ca5c7a1e386c813c6f7"

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
